package believe.review.brw.admin.drama;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import believe.review.brw.common.common.CommandMap;

@Controller
@RequestMapping("/admin")
public class AdminDramaController {

	@Resource(name="adminDramaService")
	private AdminDramaService adminDramaService;
	
	@RequestMapping(value="/drama.br", method=RequestMethod.GET)
	public String dramaPage(Model model) throws Exception{
		
		List<Map<String, Object>> admin = adminDramaService.selectDramaList();
		
		model.addAttribute("admin", admin);
		
		return "/admin/drama/adminDramaList";
	}
	
	@RequestMapping(value="/drama.br", method=RequestMethod.POST)
	public String dramaPage_order(CommandMap commandMap, Model model) throws Exception{
		List<Map<String, Object>> admin = adminDramaService.selectDramaList_order(commandMap.getMap());
		
		model.addAttribute("orderby", commandMap.getMap().get("orderby"));
		model.addAttribute("admin", admin);
		
		return "/admin/drama/adminDramaList";
	}
}
