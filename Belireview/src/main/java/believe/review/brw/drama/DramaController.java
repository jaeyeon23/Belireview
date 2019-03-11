package believe.review.brw.drama;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import believe.review.brw.common.common.CommandMap;
import believe.review.brw.common.util.Paging;
import believe.review.brw.user.UserService;


@Controller

@RequestMapping("/drama")
public class DramaController {
	private int currentPage = 1;	 
	private int totalCount;
	private int blockCount = 1;	 
	private int blockPage = 5; 	 
	private String pagingHtml; 
	private Paging page;
	
	@Resource(name="dramaService")
	private DramaService dramaService;
	
	@Resource(name="userService")
	private UserService userService;
	

	@RequestMapping(value = "dramaList.br")
	public ModelAndView dramaList(CommandMap commandMap,HttpServletRequest request) throws Exception {
		String p = request.getParameter("currentPage");
		
		if(p == null || p.trim().isEmpty() || p.equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		ModelAndView mv = new ModelAndView("dramaList");
		
		List<Map<String,Object>> list = dramaService.selectBoardList(commandMap.getMap());
		
		totalCount = list.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/drama/dramaList");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("list", list);
		mv.addObject("page",pagingHtml);
		mv.addObject("currentPage",currentPage);
		
		return mv;

	}

	@RequestMapping(value="dramaDetail.br", method = RequestMethod.GET)
	public ModelAndView dramaDetail(CommandMap commandMap/*, HttpServletRequest request*/) throws Exception {

		ModelAndView mv = new ModelAndView("dramaDetail");
		/*HttpSession session = request.getSession();*/
		Map<String,Object> map = dramaService.dramaDetail(commandMap.getMap());//상세보기
		List<Map<String,Object>> comment = dramaService.dramaCommentByLike(map);//댓
		List<Map<String,Object>> actor = dramaService.dramaActor(map); //출연배우
		List<Map<String,Object>> detailgenre = dramaService.detailgenre(map);//비슷한장르
		
		/*Map<String,Object> insertcomment = dramaService.insertdramaComment(commandMap.getMap());*/
		totalCount = (Integer)dramaService.totalDramaComment(map);
		
		mv.addObject("map",map);
		mv.addObject("comment",comment);
		mv.addObject("actor",actor);
		mv.addObject("detailgenre",detailgenre);
		mv.addObject("totalCount",totalCount);
	/*	mv.addObject("insertcomment",insertcomment);*/
		
		return mv;

	}
	@RequestMapping(value="dramaDetail.br",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> dramaDe(CommandMap commandMap) throws Exception {

		Map<String,Object> mv = commandMap.getMap();
		/*보고싶어요*/
		System.out.println(mv.get("drama_no"));
		System.out.println(mv.get("id"));
		System.out.println(mv.get("wish"));
		System.out.println(mv.get("rating"));
		
		if(mv.get("wish")!=null) {
			Map<String,Object> map = userService.userWishList(mv);
			
			if(map==null) {//위시리스트에 아무것도 없을때 
				System.out.println("널");
				userService.insertWishList(mv);
			}
			else {//위시리스트에 값이 있을때
				System.out.println("하하");
				String[] str = map.get("MYPAGE_DRAMA").toString().split(",");
				boolean exist = false;
				String drama_no = "";
				for(String s : str) {
					if(mv.get("drama_no").equals(s)) {
						exist = true;
					}else {
						drama_no += s+",";
					}
				}
				/*System.out.println(exist);*/
				if(!exist) {
					drama_no += mv.get("drama_no");
					mv.put("add", "add");
				}else {
					mv.put("subtract", "subtract");
				}
				/*System.out.println(drama_no);*/
				mv.put("drama_no", drama_no);
				/*System.out.println(mv.get("drama_no"));*/
				userService.updateWishList(mv);
			}
		}
		/*평점*/
		if(mv.get("rating")!=null) {
			
		}
		
		
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