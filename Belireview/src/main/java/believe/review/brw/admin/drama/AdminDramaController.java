package believe.review.brw.admin.drama;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
import believe.review.brw.common.util.FileUtils;
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
	private String filePath = "C:\\Users\\박재연\\Desktop\\Belireview\\Belireview\\src\\main\\webapp\\resources\\images\\user_profile\\";
	
	@Resource(name="adminDramaService")
	private AdminDramaService adminDramaService;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@RequestMapping(value="/drama.br")
	public String dramaPage(@RequestParam(value="alert_value", defaultValue="default") String alert_value,HttpServletRequest request, CommandMap commandMap, Model model) throws Exception{
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
		
		commandMap.put("no", no + 1);
		
		String content_image = fileUtils.parseInsertFileInfo(commandMap.getMap(), request);
		
		commandMap.put("drama_content_image", content_image);
		
		return "redirect:/admin/drama.br";
	}
	
	@RequestMapping(value="/drama/modify.br", method=RequestMethod.GET)
	public String dramaModify(HttpServletRequest request, Model model) throws Exception{
		
		int no = Integer.parseInt(request.getParameter("no"));

		Map<String, Object> update_drama_one = adminDramaService.selectDramaOne(no);
		
		model.addAttribute("admin", update_drama_one);
		
		return "/admin/drama/adminDramaModify";
	}
	/*
	@RequestMapping(value="/drama/modify.br", method=RequestMethod.POST)
	public String dramaModify_action(Model model) throws Exception{
		
		return "redirect:/admin/drama.br";
	}
		*/
	@RequestMapping(value="/drama/delete.br", method=RequestMethod.POST)
	public String dramaDelete(CommandMap commandMap, RedirectAttributes redirectAttributes) throws Exception{
		String alert_value = null;
		
		/*if(commandMap.containsKey("no") && commandMap.containsKey("password")) {
			if(adminDramaService.checkDrama(commandMap.getMap()) > 0) {
				adminDramaService.deleteDramaOne(commandMap.getMap());
				alert_value = "삭제 성공";
			}else {
				alert_value = "삭제 실패 : 비밀번호를 확인해주세요";
			}
		}*/
		
		redirectAttributes.addAttribute("alert_value", alert_value);
		
		return "redirect:/admin/drama.br";
	}

	
}
