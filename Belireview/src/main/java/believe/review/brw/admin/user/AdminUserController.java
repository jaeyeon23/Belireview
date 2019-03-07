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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public String userPage(HttpServletRequest request, Model model) throws Exception{
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		List<Map<String, Object>> admin = adminUserService.selectUserList();
		
		totalCount = admin.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/admin/users");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		admin = admin.subList(page.getStartCount(), lastCount);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pagingHtml", pagingHtml);
		model.addAttribute("currentPage", currentPage);
		
		model.addAttribute("admin", admin);
		
		return "/admin/user/adminUserList";
	}
	
	@RequestMapping("/delete.br")
	public String userDelete(CommandMap commandMap, Model model) throws Exception{
		if(commandMap.containsKey("id") && commandMap.containsKey("password")) {
			if(adminUserService.checkUser(commandMap.getMap()) > 0) {
				adminUserService.deleteUserOne(commandMap.getMap());
			}else {
				String str = "잘못된 비밀번호입니다";
				
				model.addAttribute("str", str);
			}
		}
		
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
		/*if(commandMap.containsKey("image_delete")) {
			String file_name = adminUserService.selectUserOne_profile(commandMap.getMap());
			
			file = new File(filePath + file_name);
			file.delete();
		}*/
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("profile_image");
		
		String fileName = multipartFile.getOriginalFilename();
		
		String IMAGEExtension = fileName.substring(fileName.lastIndexOf("."));
		String fileName2 = (String)(commandMap.get("id")) + IMAGEExtension;
		
		commandMap.put("profile_image", fileName2);
		
		file = new File(filePath + fileName2);
		
		multipartFile.transferTo(file);
		adminUserService.updateUserOne(commandMap.getMap());
		
		/*MultipartFile multipartFile = multipartHttpServletRequest.getFile("profile_image");
		String fileName = multipartFile.getOriginalFilename();
		if(fileName != "") {
			String id = (String) commandMap.get("id");
			
	        String IMAGEExtension = fileName.substring(fileName.lastIndexOf("."));
	        String fileName2 = id + IMAGEExtension;
	        FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(filePath + fileName2));
	        
	        commandMap.put("profile_image", fileName2);
		}else {
			commandMap.put("profile_image", null);
		}*/

		return "redirect:/admin/users.br";
	}
	
}
