package believe.review.brw.drama;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import believe.review.brw.common.common.CommandMap;
import believe.review.brw.common.util.Paging;


@Controller

@RequestMapping("/drama")
public class DramaController {
	private Map<String,Integer> pageMap = new HashMap<String,Integer> ();
	private int currentPage = 1;	 
	private int totalCount;
	private int blockCount = 1;	 
	private int blockPage = 5; 	 
	private String pagingHtml; 
	private Paging page;
	
	@Resource(name="dramaService")
	private DramaService dramaService;

	@RequestMapping(value = "dramaList.br")
	public ModelAndView dramaList(CommandMap commandMap,HttpServletRequest request) throws Exception {
		String p = request.getParameter("currentPage");
		
		if(p == null || p.trim().isEmpty() || p.equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		ModelAndView mv = new ModelAndView("dramaList");
		
		totalCount = (Integer)dramaService.totalDramaCount(commandMap.getMap());
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/drama/dramaList");
		pagingHtml = page.getPagingHtml().toString();
		
		pageMap.put("START",page.getStartCount());
		pageMap.put("END",page.getEndCount());
		
		List<Map<String,Object>> list = dramaService.selectBoardList(pageMap);
		
		mv.addObject("list", list);
		/*System.out.println(list.get(0).get("DRAMA_NO"));*/
		mv.addObject("page",pagingHtml);
		
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
		System.out.println("CONT"+map.get("DRAMA_NO"));
		totalCount = (Integer)dramaService.totalDramaComment(map);
		System.out.println(totalCount);
		mv.addObject("map",map);
		mv.addObject("comment",comment);
		mv.addObject("actor",actor);
		mv.addObject("totalCount",totalCount);
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