package believe.review.brw.admin.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import believe.review.brw.admin.actor.AdminActorService;
import believe.review.brw.admin.user.AdminUserService;
import believe.review.brw.common.common.CommandMap;
import believe.review.brw.common.util.FileUtils;
import believe.review.brw.common.util.Paging;
import believe.review.brw.member.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminMovieController {
	
	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 9;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;
	private String filePath = "C:\\인영\\sts\\Belireview\\Belireview\\src\\main\\webapp\\resources\\images\\movie\\";
	private HttpSession session = null;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Resource(name="adminActorService")
	private AdminActorService adminActorService;
	
	@Resource(name="adminUserService")
	private AdminUserService adminUserService;
	
	@Resource(name="adminMovieService")
	private AdminMovieService adminMovieService;
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@RequestMapping(value="/movie.br")
	public String moviePage(@RequestParam(value="alert_value", defaultValue="default") String alert_value, HttpServletRequest request, CommandMap commandMap, Model model) throws Exception{
		List<Map<String, Object>> admin = null;
		
		String orderby = (String)commandMap.get("orderby");
		String searchNum = (String)commandMap.get("searchNum");
		String searchBox = (String)commandMap.get("searchBox");
		
		admin = adminMovieService.selectMovieList(commandMap.getMap());
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		totalCount = admin.size();
			
		if(orderby == null || searchNum == null) {
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/admin/movie");
		}else {
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/admin/movie", orderby, searchNum, searchBox);
		}
		
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		admin = admin.subList(page.getStartCount(), lastCount);
		
		model.addAttribute("pagingHtml", pagingHtml);
		
		model.addAttribute("orderby", orderby);
		model.addAttribute("searchNum", searchNum);
		model.addAttribute("searchBox", searchBox);
		
		model.addAttribute("admin", admin);
		
		if(!alert_value.equals("default")) {
			model.addAttribute("alert_value", alert_value);
		}
		
		return "/admin/movie/adminMovieList";
	}
	
	@RequestMapping(value="/movie/write.br", method=RequestMethod.GET)
	public String movieWritePage(Model model) throws Exception{
		
		return "/admin/movie/adminMovieWrite";
	}
	
	@RequestMapping(value="/movie/write.br", method=RequestMethod.POST)
	public String movieWrite(CommandMap commandMap, HttpServletRequest request, Model model) throws Exception{
		int no = adminMovieService.selectNextVal_movie();
		
		commandMap.put("no", no);
		
		Map<String, Object> listMap = fileUtils.parseInsertFileInfo(commandMap.getMap(), request, filePath);
		
		commandMap.put("poster_image", listMap.get("poster_image"));
		commandMap.put("main_image", listMap.get("main_image"));
		commandMap.put("content_image", listMap.get("content_image"));
				
		adminMovieService.writeMovie(commandMap.getMap());
		
		if(commandMap.get("movie_textarea") != "" && commandMap.get("movie_textarea") != null && commandMap.get("movie_textarea").toString().trim().length() != 0) {
			String textarea = (String)commandMap.get("movie_textarea");
			String[] actor_list = textarea.split(", ");
			
			for(String actor : actor_list) {
				Map<String, Object> actor_map = adminActorService.selectActorOne(actor);
				
				String movie_textarea = (String)actor_map.get("ACTOR_MOVIE");
				String[] movie_list = null;
				
				if(movie_textarea != null) {
					movie_list = movie_textarea.split(", ");
				}

				int count = 0;
				
				if(movie_list != null) {
					for(String movie : movie_list) {
						if(movie.equals(commandMap.get("no").toString())) {
							count = 1;
							
							break;
						}
					}
				}else {
					count = 0;
				}
				
				if(count == 0) {
					if(movie_list == null) {
						actor_map.put("movie_textarea", commandMap.get("no"));
					}else{
						actor_map.put("movie_textarea", actor_map.get("ACTOR_MOVIE") + ", " + commandMap.get("no")); 
 					}
					
					adminActorService.updateActorOne(actor_map);
				}
			}
		}
		return "redirect:/admin/movie.br";
	}
	
	@RequestMapping(value="/movie/modify.br", method=RequestMethod.GET)
	public String movieModifyPage(HttpServletRequest request, Model model) throws Exception{
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		List<Map<String, Object>> actor_list = adminActorService.selectActorMovieModify(request.getParameter("no"));
		String str = "";
		
		for(Map<String, Object> map : actor_list) {
			String movie_list = (String) map.get("ACTOR_MOVIE");
			String[] movie_arr = movie_list.split(", ");
			
			for(String movie : movie_arr) {
				if(movie.equals(request.getParameter("no"))) {
					if(str.equals("")) {
						str = map.get("ACTOR_NO").toString();
					}else {
						str += ", " + map.get("ACTOR_NO").toString();
					}
				}
			}
		}
		
		Map<String, Object> update_movie_one = adminMovieService.selectMovieOne(no);
		
		model.addAttribute("admin", update_movie_one);
		model.addAttribute("str", str);
		
		return "/admin/movie/adminMovieModify";
	}
	
	@RequestMapping(value="/movie/modify.br", method=RequestMethod.POST)
	public String movieModify(CommandMap commandMap, HttpServletRequest request, Model model) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(commandMap.containsKey("show_file")) {
			map = adminMovieService.selectMovieOne(Integer.parseInt((String)commandMap.get("no")));
			
			fileUtils.fileDelete(map, filePath, "movie");
			
			commandMap.put("media", "movie");
			map = fileUtils.parseInsertFileInfo(commandMap.getMap(), request, filePath);
			
			commandMap.put("poster_image", map.get("poster_image"));
			commandMap.put("main_image", map.get("main_image"));
			commandMap.put("content_image", map.get("content_image"));
		}
		
		adminMovieService.updateMovieOne(commandMap.getMap());
		
		String textarea = (String)commandMap.get("movie_textarea");
		String[] actor_list = null;
		
		if(textarea.trim().length() > 0) {
			actor_list = textarea.split(", ");
		}

		if(actor_list != null) {
			for(String actor : actor_list) {
				Map<String, Object> actor_map = adminActorService.selectActorOne(actor);
				
				String movie_textarea = (String)actor_map.get("ACTOR_MOVIE");
				String[] movie_list = null;
				
				if(movie_textarea != null) {
					movie_list = movie_textarea.split(", ");
				}
				
				int count = 0;
				
				if(movie_list != null) {
					for(String movie : movie_list) {
						if(movie.equals((String)commandMap.get("no"))) {
							count = 1;
							
							break;
						}
					}
				}else {
					count = 0;
				}

				if(count == 0) {
					if(movie_list == null) {
						actor_map.put("movie_textarea", commandMap.get("no"));
					}else {
						actor_map.put("movie_textarea", actor_map.get("ACTOR_MOVIE") + ", " + commandMap.get("no"));
					}
					
					adminActorService.updateActorOne(actor_map);
				}
			}
		}
		return "redirect:/admin/movie.br";
	}
	
	@RequestMapping(value="/movie/delete.br", method=RequestMethod.POST)
	public String movieDelete(CommandMap commandMap, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception{
		String alert_value = null;
		session = request.getSession();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = adminUserService.selectUserOne((String)session.getAttribute("ID"));
		
		if(passwordEncoder.matches((String)commandMap.get("password"), (String)map.get("PASSWORD"))) {
			map = adminMovieService.selectMovieOne(Integer.parseInt((String) commandMap.get("no")));
			fileUtils.fileDelete(map, filePath, "movie");
			
			adminMovieService.deleteMovieOne(commandMap.getMap());
			
			alert_value = "삭제 성공!";
		}else {
			alert_value = "삭제 실패 : 비밀번호를 확인하세요!";
		}
		
		redirectAttributes.addAttribute("alert_value", alert_value);
		
		return "redirect:/admin/movie.br";
	}
}
