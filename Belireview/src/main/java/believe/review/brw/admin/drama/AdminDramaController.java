package believe.review.brw.admin.drama;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import believe.review.brw.common.common.CommandMap;
import believe.review.brw.common.util.Paging;

@Controller
@RequestMapping("/admin")
public class AdminDramaController {

	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 9;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;
	
	@Resource(name="adminDramaService")
	private AdminDramaService adminDramaService;
	
	@RequestMapping(value="/drama.br", method=RequestMethod.GET)
	public String dramaPage(HttpServletRequest request, CommandMap commandMap, Model model) throws Exception{
		List<Map<String, Object>> admin = null;
		int orderby = 0;
		String searchNum = null;
		String searchBox = null;
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		if(!commandMap.containsKey("orderby") && !commandMap.containsKey("searchNum")) {
			admin = adminDramaService.selectDramaList();
			
			model.addAttribute("admin", admin);
			
			totalCount = admin.size();
			
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/admin/drama");
		}else {
			admin = adminDramaService.selectDramaList_order(commandMap.getMap());
			
			model.addAttribute("admin", admin);
			
			if(commandMap.containsKey("orderby")) {
				orderby = Integer.parseInt((String) commandMap.getMap().get("orderby"));
				model.addAttribute("orderby", orderby);
			}
			
			if(commandMap.containsKey("searchNum")) {
				searchNum = (String)commandMap.getMap().get("searchNum");
				searchBox = (String)commandMap.getMap().get("searchBox");
				model.addAttribute("searchNum", searchNum);
				model.addAttribute("searchBox", searchBox);
			}
			
			totalCount = admin.size();
			
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/admin/drama", orderby, searchNum, searchBox);
		}
		
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		admin = admin.subList(page.getStartCount(), lastCount);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pagingHtml", pagingHtml);
		model.addAttribute("currentPage", currentPage);
		
		
		return "/admin/drama/adminDramaList";
	}
	
	@RequestMapping(value="/drama/write.br")
	public String dramaWrite(Model model) throws Exception{
		
		return "/admin/drama/adminDramaWrite";
	}
	
	@RequestMapping(value="/drama/modify.br", method=RequestMethod.GET)
	public String dramaModify(HttpServletRequest request, Model model) throws Exception{
		
		int no = Integer.parseInt(request.getParameter("no"));

		//���� �̹��� ����� �ڵ�
		
			
		adminDramaService.deleteDramaImageOne(no);
		Map<String, Object> update_drama_one = adminDramaService.selectDramaOne(no);
		
		model.addAttribute("admin", update_drama_one);
		
		return "/admin/drama/adminDramaModify";
	}
	
	@RequestMapping(value="/drama/modify.br", method=RequestMethod.POST)
	public String dramaModify_action(Model model) throws Exception{
		
		return "redirect:/admin/drama.br";
	}
	
	@RequestMapping(value="/drama/delete.br")
	public String dramaDelete(CommandMap commandMap, Model model) throws Exception{
		if(commandMap.containsKey("no") && commandMap.containsKey("password")) {
			if(adminDramaService.checkDrama(commandMap.getMap()) > 0) {
				adminDramaService.deleteDramaOne(commandMap.getMap());
			}else {
				String str = "�߸��� ��й�ȣ�Դϴ�";
				
				model.addAttribute("str", str);
			}
		}
		
		return "redirect:/admin/drama.br";
	}
	
	
}
