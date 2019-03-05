package believe.review.brw.admin.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "/admin/users.br");
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
	
	@RequestMapping("/modify.br")
	public String userModifyPage(HttpServletRequest request, Model model) throws Exception{
		Map<String, Object> admin = null;
		
		if(request.getParameter("id") != null) {
			admin = adminUserService.selectUserOne(request.getParameter("id"));
		}
		
		model.addAttribute("admin", admin);
		
		return "/admin/user/adminUserModify";
	}
}
