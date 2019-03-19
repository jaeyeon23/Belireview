package believe.review.brw.admin.actor;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	@Resource(name="adminActorService")
	private AdminActorService adminActorService;
	
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
	public String actionModify(HttpServletRequest request, CommandMap commandMap, Model model) throws Exception{
		Set keyset = commandMap.keySet();
		System.out.println("test : " + keyset);
		
		if(commandMap.get("show_file") != null) {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile multipartFile = multipartRequest.getFile("image");
			String fileName = multipartFile.getOriginalFilename();
		
			String IMAGEExtension = fileName.substring(fileName.lastIndexOf("."));
			String fileName2 = (String)(commandMap.get("name")) + IMAGEExtension;
			
			commandMap.put("image", fileName2);
			
			file = new File(filePath + fileName2);
			multipartFile.transferTo(file);
		}
		Set rrkeyset = commandMap.keySet();
		System.out.println("rrtest : " + rrkeyset);
		System.out.println("result : " + commandMap.get("image"));
		System.out.println("no : " + commandMap.get("no"));
		
		adminActorService.updateActorOne(commandMap.getMap());
		
		return "redirect:/admin/actor.br";
	}
}
