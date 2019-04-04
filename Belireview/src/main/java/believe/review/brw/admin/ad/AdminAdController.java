package believe.review.brw.admin.ad;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import believe.review.brw.admin.user.AdminUserService;
import believe.review.brw.common.common.CommandMap;
import believe.review.brw.common.util.FileUtils;
import believe.review.brw.common.util.Paging;
import believe.review.brw.member.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminAdController {

	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 9;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;
	private String filePath = "C:\\인영\\sts\\Belireview\\Belireview\\src\\main\\webapp\\resources\\images\\ad\\";
	private HttpSession session = null;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Resource(name="adminAdService")
	private AdminAdService adminAdService;
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name="adminUserService")
	private AdminUserService adminUserService;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@RequestMapping(value="/ad.br")
	public String adPage(@RequestParam(value="alert_value", defaultValue="default") String alert_value, HttpServletRequest request, CommandMap commandMap, Model model) throws Exception{
		List<Map<String, Object>> admin = null;
		
		String orderby = (String)commandMap.get("orderby");
		String searchNum = (String)commandMap.get("searchNum");
		String searchBox = (String)commandMap.get("searchBox");
		
		admin = adminAdService.selectAdList(commandMap.getMap());
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		totalCount = admin.size();
			
		if(orderby == null || searchNum == null) {
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/admin/ad");
		}else {
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/admin/ad", orderby, searchNum, searchBox);
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
		
		return "/admin/ad/adminAdList";
	}
	
	@RequestMapping(value="/ad/write.br", method=RequestMethod.GET)
	public String adWritePage(Model model) throws Exception{
		return "/admin/ad/adminAdWrite";
	}
	
	@RequestMapping(value="/ad/write.br", method=RequestMethod.POST)
	public String adWrite(CommandMap commandMap, HttpServletRequest request, Model model) throws Exception{
		int no = adminAdService.selectNextVal_ad();
		
		commandMap.put("no", no);
		
		Map<String, Object> listMap = fileUtils.parseInsertFileInfo(commandMap.getMap(), request, filePath);
		
		String[] arr = commandMap.get("link").toString().split("\\?");
		String poster_image = arr[0].replace("www", "img");
		poster_image = poster_image.replace("embed", "vi");
		poster_image += "/mqdefault.jpg";
		
		commandMap.put("poster_image", poster_image);
		commandMap.put("main_image", listMap.get("main_image"));
		
		adminAdService.writeAd(commandMap.getMap());

		return "redirect:/admin/ad.br";
	}
	
	@RequestMapping(value="/ad/modify.br", method=RequestMethod.GET)
	public String adModifyPage(HttpServletRequest request, Model model) throws Exception{
		int no = Integer.parseInt(request.getParameter("no"));
		
		Map<String, Object> update_ad_one = adminAdService.selectAdOne(no);
		
		model.addAttribute("admin", update_ad_one);
		
		return "/admin/ad/adminAdModify";
	}
	
	@RequestMapping(value="/ad/modify.br", method=RequestMethod.POST)
	public String adModify(CommandMap commandMap, HttpServletRequest request, Model model) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(commandMap.containsKey("show_file")) {
			map = adminAdService.selectAdOne(Integer.parseInt((String)commandMap.get("no")));
			
			fileUtils.fileDelete(map, filePath, "ad");
			
			commandMap.put("media", "ad");
			map = fileUtils.parseInsertFileInfo(commandMap.getMap(), request, filePath);
			
			String[] arr = commandMap.get("link").toString().split("\\?");
			String poster_image = arr[0].replace("www", "img");
			poster_image = poster_image.replace("embed", "vi");
			poster_image += "/mqdefault.jpg";
			
			commandMap.put("poster_image", poster_image);
			commandMap.put("main_image", map.get("main_image"));
		}
		
		adminAdService.updateAdOne(commandMap.getMap());
		
		return "redirect:/admin/ad.br";
	}
	
	@RequestMapping(value="/ad/delete.br", method=RequestMethod.POST)
	public String adDelete(CommandMap commandMap, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception{
		String alert_value = null;
		session = request.getSession();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = adminUserService.selectUserOne((String)session.getAttribute("ID"));
		
		if(passwordEncoder.matches((String)commandMap.get("password"), (String)map.get("PASSWORD"))) {
			map = adminAdService.selectAdOne(Integer.parseInt((String) commandMap.get("no")));
			fileUtils.fileDelete(map, filePath, "ad");
			
			adminAdService.deleteAdOne(commandMap.getMap());
			
			alert_value = "삭제 성공!";
		}else {
			alert_value = "삭제 실패 : 비밀번호를 확인하세요!";
		}
		
		redirectAttributes.addAttribute("alert_value", alert_value);
		
		return "redirect:/admin/ad.br";
	}
}
