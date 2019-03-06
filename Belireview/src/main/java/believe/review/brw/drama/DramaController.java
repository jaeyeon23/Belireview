package believe.review.brw.drama;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import believe.review.brw.common.common.CommandMap;

@Controller

@RequestMapping("/drama")
public class DramaController {
	
	@Resource(name="dramaService")
	private DramaService dramaService;

	@RequestMapping(value = "dramaList.br")
	public ModelAndView dramaList(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("dramaList");
		List<Map<String,Object>> list = dramaService.selectBoardList();
		mv.addObject("list", list);
		
		return mv;

	}

	@RequestMapping(value = "dramaDetail.br")
	public ModelAndView dramaDetail(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("dramaDetail");
		Map<String,Object> map = dramaService.dramaDetail(commandMap.getMap());
		List<Map<String,Object>> comment = dramaService.dramaCommentByLike(map);
		mv.addObject("map",map);
		mv.addObject("comment",comment);
		
		return mv;

	}

	@RequestMapping(value = "dramaInfo.br")
	public ModelAndView dramaInfo() throws Exception {

		ModelAndView mv = new ModelAndView("dramaInfo");

		return mv;

		
	}

	@RequestMapping(value = "dramaComment.br")
	public ModelAndView dramaComment() throws Exception {

		ModelAndView mv = new ModelAndView("dramaComment");

		return mv;

	}
}