package believe.review.brw.drama;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public ModelAndView dramaDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("dramaDetail");
		HttpSession session = request.getSession();
		
		Map<String,Object> map = dramaService.dramaDetail(commandMap.getMap());//상세보기
		List<Map<String,Object>> comment = dramaService.dramaCommentByLike(map);//댓
		List<Map<String,Object>> actor = dramaService.dramaActor(map); //출연배우
		List<Map<String,Object>> detailgenre = dramaService.detailgenre(map);//비슷한장르
		List<Map<String,Object>> gradeRatio = dramaService.gradeRatio(map);//별점비율
		String[] image = map.get("DRAMA_CONTENT_IMAGE").toString().split(",");
		for(String s :image) {
			s += s.replace("\\p{Z}","");
		}
		int[] ratio = new int[11];
		for(int i=0;i<gradeRatio.size();i++) {
			ratio[i] = (int)(Double.parseDouble(gradeRatio.get(i).get("RATIO").toString())*2);
			if(ratio[i]>100)
				ratio[i] = 100;
			System.out.println((int)(Double.parseDouble(gradeRatio.get(i).get("RATIO").toString())*2));
		}
		
		if(session.getAttribute("ID")!=null) {//로그인했을때
			map.put("ID", session.getAttribute("ID"));
			Map<String,Object> tmp = userService.userWishList(map);
			if(tmp!=null) {
				if(tmp.get("MYPAGE_DRAMA")!=null) {//보고싶어요
					String str[] = tmp.get("MYPAGE_DRAMA").toString().split(",");
					for(String s : str) {
						if(map.get("DRAMA_NO").toString().equals(s)) {
							mv.addObject("wish","wish");
						}
					}
				}
			}
			tmp = dramaService.existGrade(map);
		
			if(tmp!=null) {//별점
				String[] ra = {"평가하기","최악이에요","싫어요","재미없어요","별로에요","부족해요","보통이에요","볼만해요","재미있어요","훌륭해요!","최고에요!"};
				int g = (int)(Double.parseDouble(tmp.get("DL_GRADE").toString())*2);
				mv.addObject("grade",g);
				mv.addObject("ra",ra[g]);
				mv.addObject("initValue","r"+g);
			}else {
				mv.addObject("initValue","r0");
			}
			tmp = dramaService.myComment(map);
			if(tmp!=null) {
				mv.addObject("myComment",tmp);
			}
		}
		
		/*Map<String,Object> insertcomment = dramaService.insertdramaComment(commandMap.getMap());*/
		
		totalCount = (Integer)dramaService.totalDramaComment(map);
	
		mv.addObject("map",map);
		mv.addObject("comment",comment);
		mv.addObject("actor",actor);
		mv.addObject("detailgenre",detailgenre);
		mv.addObject("ratio",ratio);
		mv.addObject("image",image);
		mv.addObject("totalCount",totalCount);
		
	/*	mv.addObject("insertcomment",insertcomment);*/
		
		return mv;

	}
	@RequestMapping(value="dramaDetail.br",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> dramaDe(CommandMap commandMap) throws Exception {

		Map<String,Object> mv = commandMap.getMap();
		Map<String,Object> map = new HashMap<String,Object>();
		/*보고싶어요*/
		
		if(mv.get("WISH")!=null) {
			map = userService.userWishList(mv);
			
			if(map==null) {//위시리스트에 아무것도 없을때 
				userService.insertWishList(mv);
			}
			else {//위시리스트에 값이 있을때
				String[] str = map.get("MYPAGE_DRAMA").toString().split(",");
				boolean exist = false;
				String drama_no = "";
				for(String s : str) {
					if(mv.get("DRAMA_NO").equals(s)) {
						exist = true;
					}else {
						drama_no += s+",";
					}
				}
				if(!exist) {
					drama_no += mv.get("DRAMA_NO");
					mv.put("add", "add");
				}else {
					mv.put("subtract", "subtract");
				}
				mv.put("DRAMA_NO", drama_no);
				userService.updateWishList(mv);
			}
		}
		/*보고싶어요*/
		
		/*평점*/
		if(mv.get("RATING")!=null) {
			map = dramaService.existGrade(mv);
			if(map==null) {//별점이 없을때
				dramaService.addGrade(mv);
			}else {//별점이 있을때
				dramaService.updateGrade(mv);
			}
		}
		/*평점*/
		
		//댓
		if(mv.get("COM")!=null) { 
			map = dramaService.myComment(mv);
			if(map==null) {
				System.out.println("작성");
				dramaService.writeDramaComment(mv);
				map = dramaService.myComment(mv);
			}else {
				System.out.println("작성ㄴㄴ");
			}
			mv.put("myCom",map);
		}
		//댓
		
		//댓삭제
		if(mv.get("DELCOM")!=null) {
			dramaService.deleteComment(mv);
		}
		//댓삭제
		
		//댓수정
		if(mv.get("MCOM")!=null) { 
			System.out.println(mv.get("MCOM"));
			dramaService.updateDramaComment(mv);
			System.out.println("수정완료");
			map = dramaService.myComment(mv);
			System.out.println(map.get("DC_CONTENT"));
			
			mv.put("myCom",map);
		}
		//댓수정
		
		return mv;
	}
	

	@RequestMapping(value = "dramaInfo.br")
	public ModelAndView dramaInfo(CommandMap commandMap) throws Exception {


		ModelAndView mv = new ModelAndView("dramaInfo");
		Map<String,Object> map = dramaService.dramaDetail(commandMap.getMap());
		
		mv.addObject("map",map);

		return mv;

		
	}

	@RequestMapping(value = "dramaComment.br",method = RequestMethod.GET)
	public ModelAndView dramaComment(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView("dramaComment");
		List<Map<String,Object>> dramacomment = dramaService.dramaCommentByLike(commandMap.getMap());
 /*    Map<String,Object> map = dramaService.myComment();
		*/
		
		System.out.println(dramacomment.get(0).get("DC_CONTENT"));
		mv.addObject("dramacomment",dramacomment);
		
		if(session.getAttribute("ID")!=null)
			mv.addObject("ID",request.getAttribute("ID"));
			System.out.println("id"+session.getAttribute("ID"));
		
		for(int i=0; i<dramacomment.size(); i++) {
			String[] str =dramacomment.get(i).get("DC_LIKE_ID").toString().split(",");
			System.out.println("gg"+dramacomment.get(i).get("DC_LIKE_ID"));
			
			for(String s : str) {
				System.out.println("nn"+s);
				if(session.getAttribute("ID").equals(s)) {
					mv.addObject("yes","a");
				}
			}
		}
		
	
		return mv;
	}
	
	
	
	@RequestMapping(value="dramaComment.br",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> CommentLike(CommandMap commandMap) throws Exception {

		Map<String,Object> mv = commandMap.getMap();
		/*좋아요*/
		
		
			Map<String,Object> map = dramaService.myComment(mv);

			System.out.println(map.get("DC_LIKE_ID"));
			if(map.get("DC_LIKE_ID")!=null) {
				
				String[] str = map.get("DC_LIKE_ID").toString().split(",");
				boolean exist = false;
				int likenum = Integer.parseInt(map.get("DC_LIKE").toString());
				System.out.println(likenum);
				String dc_like_id = "";
				for(String s : str) {
					System.out.println(s);
					System.out.println(mv.get("ID"));
					if(mv.get("ID").equals(s)) {
						exist = true;
					}else {
						dc_like_id += s+",";
					}
				}
				if(!exist) {
					dc_like_id += mv.get("ID");
					likenum +=1;
					mv.put("add", "add");
				}else {
					likenum -=1;
					mv.put("subtract", "subtract");
				}
				mv.put("DC_LIKE_ID", dc_like_id);
				mv.put("DC_LIKE", likenum);
				System.out.println(mv.get("DC_LIKE"));
				dramaService.dramaCommentLike(mv);
			}
		return mv;
		}
	
}