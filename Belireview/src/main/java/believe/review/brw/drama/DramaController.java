package believe.review.brw.drama;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import believe.review.brw.common.common.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	@RequestMapping(value="dramaDetail.br")
	public ModelAndView dramaDetail(CommandMap commandMap/*, HttpServletRequest request*/) throws Exception {

		ModelAndView mv = new ModelAndView("dramaDetail");
		/*HttpSession session = request.getSession();*/
		Map<String,Object> map = dramaService.dramaDetail(commandMap.getMap());
		
		List<Map<String,Object>> comment = dramaService.dramaCommentByLike(map);
		List<Map<String,Object>> actor = dramaService.dramaActor(map); 
		/*Map<String,Object> insertcomment = dramaService.insertdramaComment(commandMap.getMap());*/
		
		mv.addObject("map",map);
		mv.addObject("comment",comment);
		mv.addObject("actor",actor);
	/*	mv.addObject("insertcomment",insertcomment);*/
		
		System.out.println(actor.get(0).get("ACTOR_NAME"));
		
		return mv;

	}

	@RequestMapping(value = "dramaInfo.br")
	public ModelAndView dramaInfo(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("dramaInfo");
		Map<String,Object> map = dramaService.dramaDetail(commandMap.getMap());
		
		mv.addObject("map",map);

		return mv;

		
	}

	@RequestMapping(value = "dramaComment.br")
	public ModelAndView dramaComment(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("dramaComment");
		

		return mv;

	}
}