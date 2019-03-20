package believe.review.brw.admin.drama;

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
public class AdminDramaController {

	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 9;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;
	private String filePath = "C:\\Users\\박재연\\Desktop\\Belireview\\Belireview\\src\\main\\webapp\\resources\\images\\drama\\";
	//private String filePath = "C:\\인영\\sts\\Belireview\\Belireview\\src\\main\\webapp\\resources\\images\\drama\\";
	private HttpSession session = null;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Resource(name="adminActorService")
	private AdminActorService adminActorService;
	
	@Resource(name="adminUserService")
	private AdminUserService adminUserService;
	
	@Resource(name="adminDramaService")
	private AdminDramaService adminDramaService;
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@RequestMapping(value="/drama.br")
	public String dramaPage(@RequestParam(value="alert_value", defaultValue="default") String alert_value, HttpServletRequest request, CommandMap commandMap, Model model) throws Exception{
		List<Map<String, Object>> admin = null;
		
		String orderby = (String)commandMap.get("orderby");
		String searchNum = (String)commandMap.get("searchNum");
		String searchBox = (String)commandMap.get("searchBox");

		admin = adminDramaService.selectDramaList(commandMap.getMap());
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		totalCount = admin.size();
			
		if(orderby == null || searchNum == null) {
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/admin/drama");
		}else {
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/admin/drama", orderby, searchNum, searchBox);
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
		
		return "/admin/drama/adminDramaList";
	}
	
	@RequestMapping(value="/drama/write.br", method=RequestMethod.GET)
	public String dramaWritePage(Model model) throws Exception{
		
		return "/admin/drama/adminDramaWrite";
	}
	
	@RequestMapping(value="/drama/write.br", method=RequestMethod.POST)
	public String dramaWrite(CommandMap commandMap, HttpServletRequest request, Model model) throws Exception{
		int no = adminDramaService.selectNextVal();
		
		commandMap.put("no", no);
		
		Map<String, Object> listMap = fileUtils.parseInsertFileInfo(commandMap.getMap(), request, filePath);
		
		commandMap.put("poster_image", listMap.get("poster_image"));
		commandMap.put("main_image", listMap.get("main_image"));
		commandMap.put("content_image", listMap.get("content_image"));
		
		adminDramaService.writeDrama(commandMap.getMap());

		String textarea = (String)commandMap.get("drama_textarea");
		String[] actor_list = textarea.split(", ");
		
		for(String actor : actor_list) {
			Map<String, Object> actor_map = adminActorService.selectActorOne(actor);
			
			String drama_textarea = (String)actor_map.get("ACTOR_DRAMA");
			String[] drama_list = drama_textarea.split(", ");
			int count = 0;
			
			for(String drama : drama_list) {
				if(drama.equals((String)commandMap.get("no"))) {
					count = 1;
					
					break;
				}
			}
			
			if(count == 0) {
				actor_map.put("drama_textarea", actor_map.get("ACTOR_DRAMA") + ", " + commandMap.get("no"));
				adminActorService.updateActorOne(actor_map);
			}
		}
		
		return "redirect:/admin/drama.br";
	}
	
	@RequestMapping(value="/drama/modify.br", method=RequestMethod.GET)
	public String dramaModifyPage(HttpServletRequest request, Model model) throws Exception{
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		List<Map<String, Object>> actor_list = adminActorService.selectActorDramaModify(request.getParameter("no"));
		String str = "";
		
		for(Map<String, Object> map : actor_list) {
			String drama_list = (String) map.get("ACTOR_DRAMA");
			String[] drama_arr = drama_list.split(", ");
			
			for(String drama : drama_arr) {
				if(drama.equals(request.getParameter("no"))) {
					if(str.equals("")) {
						str = map.get("ACTOR_NO").toString();
					}else {
						str += ", " + (String)map.get("ACTOR_NO");
					}
				}
			}
		}
		
		Map<String, Object> update_drama_one = adminDramaService.selectDramaOne(no);
		
		model.addAttribute("admin", update_drama_one);
		model.addAttribute("str", str);
		
		return "/admin/drama/adminDramaModify";
	}
	
	@RequestMapping(value="/drama/modify.br", method=RequestMethod.POST)
	public String dramaModify(CommandMap commandMap, HttpServletRequest request, Model model) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(commandMap.containsKey("show_file")) {
			//새로운 파일
			map = adminDramaService.selectDramaOne(Integer.parseInt((String)commandMap.get("no")));
			fileUtils.fileDelete(map, filePath, "drama");
			
			commandMap.put("media", "drama");
			map = fileUtils.parseInsertFileInfo(commandMap.getMap(), request, filePath);
			
			commandMap.put("poster_image", map.get("poster_image"));
			commandMap.put("main_image", map.get("main_image"));
			commandMap.put("content_image", map.get("content_image"));
		}	
		
		adminDramaService.updateDramaOne(commandMap.getMap());
		
		String textarea = (String)commandMap.get("drama_textarea");
		String[] actor_list = textarea.split(", ");
		
		for(String actor : actor_list) {
			Map<String, Object> actor_map = adminActorService.selectActorOne(actor);
			
			String drama_textarea = (String)actor_map.get("ACTOR_DRAMA");
			String[] drama_list = drama_textarea.split(", ");
			int count = 0;
			
			for(String drama : drama_list) {
				if(drama.equals((String)commandMap.get("no"))) {
					count = 1;
					
					break;
				}
			}
			
			if(count == 0) {
				actor_map.put("drama_textarea", actor_map.get("ACTOR_DRAMA") + ", " + commandMap.get("no"));
				adminActorService.updateActorOne(actor_map);
			}
		}
		
		return "redirect:/admin/drama.br";
	}

	@RequestMapping(value="/drama/delete.br", method=RequestMethod.POST)
	public String dramaDelete(CommandMap commandMap, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception{
		String alert_value = null;
		session = request.getSession();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = adminUserService.selectUserOne((String)session.getAttribute("ID"));
		
		if(passwordEncoder.matches((String)commandMap.get("password"), (String)map.get("PASSWORD"))) {
			map = adminDramaService.selectDramaOne(Integer.parseInt((String)commandMap.get("no")));
			
			fileUtils.fileDelete(map, filePath, "drama");
			
			adminDramaService.deleteDramaOne(commandMap.getMap());
			
			alert_value = "삭제 성공!";
		}else {
			alert_value = "삭제 실패 : 비밀번호를 확인하세요!";
		}
		
		redirectAttributes.addAttribute("alert_value", alert_value);
		
		return "redirect:/admin/drama.br";
	}

	
}
