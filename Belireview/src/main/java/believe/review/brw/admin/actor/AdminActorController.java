package believe.review.brw.admin.actor;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import believe.review.brw.admin.user.AdminUserService;
import believe.review.brw.common.common.CommandMap;
import believe.review.brw.common.util.Paging;

@RequestMapping("/admin")
@Controller
public class AdminActorController {

	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 8;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;
	private String filePath = "C:\\Users\\박재연\\Desktop\\Belireview\\Belireview\\src\\main\\webapp\\resources\\images\\actor\\";
	private File file;
	private HttpSession session;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Resource(name="adminActorService")
	private AdminActorService adminActorService;
	
	@Resource(name="adminUserService")
	private AdminUserService adminUserService;
	
	
	@RequestMapping(value="/actor.br")
	public String actorPage(@RequestParam(value="alert_value", defaultValue="default") String alert_value, HttpServletRequest request, CommandMap commandMap, Model model) throws Exception{
		List<Map<String, Object>> admin = null;
		
		String orderby = (String)commandMap.get("orderby");
		String searchNum = (String)commandMap.get("searchNum");
		String searchBox = (String)commandMap.get("searchBox");
		
		admin = adminActorService.selectActorList(commandMap.getMap());
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		totalCount = admin.size();
		
		if(orderby == null || searchNum == null) {
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/admin/users");
		}else {
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/admin/users", orderby, searchNum, searchBox);
		}
		
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		
		admin = admin.subList(page.getStartCount(), lastCount);
		
		model.addAttribute("pagingHtml", pagingHtml);
		
		model.addAttribute("orderby", orderby);
		model.addAttribute("searchNum", searchNum);
		model.addAttribute("searchBox", searchBox);
		
		model.addAttribute("admin", admin);
		
		if(!alert_value.equals("default")) {
			model.addAttribute("alert_value", alert_value);
		}
		
		return "/admin/actor/adminActorList";
	}
	
	@RequestMapping(value="/actor/write.br", method=RequestMethod.GET)
	public String actorWritePage() throws Exception{
		
		return "/admin/actor/adminActorWrite";
	}
	
	@RequestMapping(value="/actor/write.br", method=RequestMethod.POST)
	public String actorWrite(HttpServletRequest request, CommandMap commandMap) throws Exception{
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("image");
		String fileName = multipartFile.getOriginalFilename();
	
		String IMAGEExtension = fileName.substring(fileName.lastIndexOf("."));
		String fileName2 = (String)(commandMap.get("name")) + IMAGEExtension;
		
		commandMap.put("image", fileName2);
		
		file = new File(filePath + fileName2);
		multipartFile.transferTo(file);
		
		adminActorService.insertActor(commandMap.getMap());
		
		return "redirect:/admin/actor.br";
	}
	
	@RequestMapping(value="/actor/modify.br", method=RequestMethod.GET)
	public String actorModifyPage(HttpServletRequest request, Model model) throws Exception{
		String no = request.getParameter("no");
		
		Map<String, Object> admin = adminActorService.selectActorOne(no);
		
		model.addAttribute("admin", admin);
		
		return "/admin/actor/adminActorModify";
	}
	
	@RequestMapping(value="/actor/modify.br", method=RequestMethod.POST)
	public String actorModify(HttpServletRequest request, CommandMap commandMap, Model model) throws Exception{
		Map<String, Object> map = null;
		
		if(commandMap.get("show_file") != null) {
			map = adminActorService.selectActorOne((String)commandMap.get("no"));
			
			file = new File(filePath + map.get("ACTOR_IMAGE"));
			file.delete();
			
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile multipartFile = multipartRequest.getFile("image");
			String fileName = multipartFile.getOriginalFilename();
		
			String IMAGEExtension = fileName.substring(fileName.lastIndexOf("."));
			String fileName2 = (String)(commandMap.get("name")) + IMAGEExtension;
			
			commandMap.put("image", fileName2);
			
			file = new File(filePath + fileName2);
			multipartFile.transferTo(file);
		}
		
		adminActorService.updateActorOne(commandMap.getMap());
		
		return "redirect:/admin/actor.br";
	}
	
	@RequestMapping(value="/actor/delete.br", method=RequestMethod.POST)
	public String actorDelete(HttpServletRequest request, CommandMap commandMap, RedirectAttributes redirectAttributes) throws Exception{
		String alert_value = null;
		session = request.getSession();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = adminUserService.selectUserOne((String)session.getAttribute("ID"));
		
		if(passwordEncoder.matches((String)commandMap.get("password"), (String)map.get("PASSWORD"))) {
			map = adminActorService.selectActorOne((String)commandMap.get("no"));
			
			file = new File(filePath + map.get("ACTOR_IMAGE"));
			file.delete();

			adminActorService.deleteActorOne((String)commandMap.get("no"));
			
			alert_value = "삭제 성공!";
		}else {
			alert_value = "삭제 실패 : 비밀번호를 확인하세요!";
		}
		
		redirectAttributes.addAttribute("alert_value", alert_value);
		
		return "redirect:/admin/actor.br";
	}
}
