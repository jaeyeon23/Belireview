package believe.review.brw.admin.user;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import believe.review.brw.common.common.CommandMap;
import believe.review.brw.common.util.Paging;

@Controller
@RequestMapping("/admin")
public class AdminUserController {

	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 9;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;
	private String filePath = "C:\\Users\\박재연\\Desktop\\Belireview\\Belireview\\src\\main\\webapp\\resources\\images\\user_profile\\";
	private File file;
	/*
	Set keyset = commandMap.keySet();
	System.out.println("Key set values are" + keyset);
	
	(result) Key set values are[password, sms_marketing, email_marketing, password_check, name, admin, tel, id, email]
	
	*/
	
	@Resource(name="adminUserService")
	private AdminUserService adminUserService;
	
	@RequestMapping("/users.br")
	public String userPage(@RequestParam(value="alert_value", defaultValue="default") String alert_value, CommandMap commandMap, HttpServletRequest request,  Model model) throws Exception{
		List<Map<String, Object>> admin = null;
		
		String orderby = (String)commandMap.get("orderby");
		String searchNum = (String)commandMap.get("searchNum");
		String searchBox = (String)commandMap.get("searchBox");
		
		admin = adminUserService.selectUserList(commandMap.getMap());
		
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
		
		return "/admin/user/adminUserList";
	}
	
	@RequestMapping(value = "/delete.br", method=RequestMethod.POST)
	public String userDelete(CommandMap commandMap, RedirectAttributes redirectAttributes) throws Exception{
		String alert_value = null;
		
		if(commandMap.containsKey("id") && commandMap.containsKey("password")) {
			if(adminUserService.checkUser(commandMap.getMap()) > 0) {
				adminUserService.deleteUserOne(commandMap.getMap());
				alert_value = "삭제 성공";
			}else {
				alert_value = "삭제 실패 : 비밀번호를 확인해주세요";
			}
		}
		
		redirectAttributes.addAttribute("alert_value", alert_value);
		
		return "redirect:/admin/users.br";
	}
	
	@RequestMapping(value="/modify.br", method=RequestMethod.GET)
	public String userModifyPage(HttpServletRequest request, Model model) throws Exception{
		Map<String, Object> admin = null;
		
		if(request.getParameter("id") != null) {
			admin = adminUserService.selectUserOne(request.getParameter("id"));
		}
		
		model.addAttribute("admin", admin);
		
		return "/admin/user/adminUserModify";
	}
	
	@RequestMapping(value="/modify.br", method=RequestMethod.POST)
	public String userModify(CommandMap commandMap, HttpServletRequest request, Model model) throws Exception{
		if(commandMap.containsKey("image_delete")) {
			String file_name = adminUserService.selectUserOne_profile((String) commandMap.get("id"));
			
			file = new File(filePath + file_name);
			file.delete();
			
			adminUserService.updateUserOne_profile(commandMap.getMap());
			
			return "redirect:/admin/users.br";
		}
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("profile_image");
		
		String fileName = multipartFile.getOriginalFilename();
		
		if(fileName != null) {
			String IMAGEExtension = fileName.substring(fileName.lastIndexOf("."));
			String fileName2 = (String)(commandMap.get("id")) + IMAGEExtension;
			
			commandMap.put("profile_image", fileName2);
			
			file = new File(filePath + fileName2);
			multipartFile.transferTo(file);
			
			adminUserService.updateUserOne(commandMap.getMap());
		}else {
			commandMap.put("profile_image", null);
			adminUserService.updateUserOne(commandMap.getMap());
		}

		return "redirect:/admin/users.br";
	}
	
}
