package believe.review.brw.drama;

import java.util.ArrayList;
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
	private int blockCount = 5;	 
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

	@RequestMapping(value="dramaDetail.br" ,method = RequestMethod.GET)
	public ModelAndView dramaDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("dramaDetail");
		HttpSession session = request.getSession();
		
		Map<String,Object> map = dramaService.dramaDetail(commandMap.getMap());//상세보기
		List<Map<String,Object>> comment = dramaService.dramaCommentForDetail(map);//댓
		List<Map<String,Object>> actor = dramaService.dramaActor(map); //출연배우
		List<Map<String,Object>> detailgenre = dramaService.detailgenre(map);//비슷한장르
		int totalGrade = dramaService.grade(map);
		if(totalGrade!=0){
			List<Map<String,Object>> gradeRatio = dramaService.gradeRatio(map);//별점비율
			int[] ratio = new int[11];
			for(int i=0;i<gradeRatio.size();i++) {
				ratio[i] = (int)(Double.parseDouble(gradeRatio.get(i).get("RATIO").toString())*2);
				if(ratio[i]>100)
					ratio[i] = 100;
			}
			mv.addObject("ratio",ratio);
		}
		String[] image = map.get("DRAMA_CONTENT_IMAGE").toString().split(",");
		for(int i=0;i<image.length;i++) {
			image[i] = image[i].trim();
		}
		double ratingPrediction = 0;
		List<String> likeList = new ArrayList<String>();
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
			for(int i=0;i<comment.size();i++) {
				if(comment.get(i).get("DC_LIKE_ID")!=null) {
					String[] str = comment.get(i).get("DC_LIKE_ID").toString().split(",");
					for(int j=0;j<str.length;j++) {
						if(session.getAttribute("ID").equals(str[j])) {
							likeList.add("like"+i);
						}else
							likeList.add("nonone");
					}
				}
			}
			if(likeList.size()!=0) {
				mv.addObject("likeList",likeList);
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
			ratingPrediction = dramaService.ratingPrediction(map);
		}
		
		totalCount = (Integer)dramaService.totalDramaComment(map);
	
		mv.addObject("map",map);
		mv.addObject("comment",comment);
		mv.addObject("actor",actor);
		mv.addObject("detailgenre",detailgenre);
		mv.addObject("image",image);
		mv.addObject("totalCount",totalCount);
		mv.addObject("totalGrade",totalGrade);
		mv.addObject("ratingPrediction",ratingPrediction);
		if(session.getAttribute("PROFILE_IMAGE")!=null) {
			mv.addObject("PROFILE_IMAGE","user_profile/"+session.getAttribute("PROFILE_IMAGE"));
		}else
			mv.addObject("PROFILE_IMAGE","Temporary_img.JPG");
		
		return mv;

	}
	@RequestMapping(value="dramaDetail.br",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> dramaDe(CommandMap commandMap) throws Exception {

		Map<String,Object> mv = commandMap.getMap();
		Map<String,Object> map = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		
		//좋아요
		if(mv.get("COMMENTLIKE")!=null) {
			map = dramaService.commentOne(mv);
			if(map.get("DC_LIKE_ID")!=null) {
				String[] str = map.get("DC_LIKE_ID").toString().split(",");
				boolean exist = false;
				int likenum = Integer.parseInt(map.get("DC_LIKE").toString());
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
			}else {
				mv.put("DC_LIKE_ID", mv.get("ID"));
				mv.put("add", "add");
				mv.put("DC_LIKE", 1);
				dramaService.dramaCommentLike(mv);
			}
		}
		
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
				dramaService.writeDramaComment(mv);
				map = dramaService.myComment(mv);
			}else {
				System.out.println("작성ㄴㄴ");
			}
			mv.put("myCom",map);
			map = dramaService.existGrade(mv);
			if(map==null) {
				mv.put("RATING", 0);
				dramaService.addGrade(mv);
			}
		}
		//댓
		
		//댓삭제
		if(mv.get("DELCOM")!=null) {
			dramaService.deleteComment(mv);
		}
		//댓삭제
		
		//댓수정
		if(mv.get("MCOM")!=null) { 
			dramaService.updateDramaComment(mv);
			map = dramaService.myComment(mv);
			mv.put("myCom",map);
		}
		//댓수정
		List<Map<String,Object>> comment = dramaService.dramaCommentForDetail(mv);//댓
		int index = 0;
		if(comment != null) {
			for(Map m :comment) {
				sb.append("<li class=\"HorizontalListItem-tt0z2b-0 hRbPKu\">")
				.append("<div class=\"BasicCommentItem__Comment-iqy0k7-0 UuRdd\">")
				.append("<div class=\"BasicCommentItem__TitleContainer-iqy0k7-1 jWsgqF\">")
				.append("<div class=\"BasicCommentItem__ProfileBlock-iqy0k7-2 dFeRwI\">")
				.append("<div class=\"ProfilePhoto__Self-s1v3isfu-1 lniNjX RoundedImageBlock-k5m4n5-0 gUZYtN\">")
				.append("<div class=\"ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 eKUOvr\"></div>")
				.append("<div class=\"ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy\">");
				if(m.get("PROFILE_IMAGE")!=null) {
					sb.append("<img class=\"defaultImage__ProfileImg-s1kn91bx-1 iaxVtx\" src=\"/brw/resources/images/user_profile/")
					.append(m.get("PROFILE_IMAGE")).append("\">");
				}else {
					sb.append("<img class=\"defaultImage__ProfileImg-s1kn91bx-1 iaxVtx\" src=\"/brw/resources/images/Temporary_img.JPG\">");
				}
				sb.append("</div></div><div class=\"UserNameWithBadges__Self-s1bd3hgj-0 brZhrQ\">")
				.append(m.get("ID"))
				.append("<input type=\"hidden\" value=\"").append(m.get("DC_NO")).append("\" class=\"00like").append(index).append("\"/>")
				.append("<span class=\"UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 eBREVF\" src=\"/brw/resources/images/detail/detail_comment1.svg\"></span>")
				.append("<span class=\"UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 kyuoIv\" src=\"/brw/resources/images/detail/detail_comment2.svg\"></span>")
				.append("</div></div>")
				.append("<div class=\"BasicCommentItem__UserActionStatus-iqy0k7-4 cMGqAP\">")
				.append("<img src=\"/brw/resources/images/detail/detail_comment_grade.svg\" width=\"16px\" height=\"16px\" alt=\"star\"><span>").append(m.get("DL_GRADE")).append("</span>")
				.append("</div></div>")
				.append("<div class=\"BasicCommentItem__TextBlock-iqy0k7-3 eQRymK\">")
				.append("<div class=\"TextTruncate__Self-wvv1uj-0 jXBVmV\">")
				.append("<div class=\"TextTruncate__Text-wvv1uj-1 gLsCNn\" style=\"white-space: pre-line;\">")
				.append(m.get("DC_CONTENT"))
				.append("</div></div></div>")
				.append("<div class=\"ContentlessCommentItem__LikeReplyBlock-s1n6rtl6-1 bSwpdd\">")
				.append("<span class=\"ContentlessCommentItem__LikeImage-s1n6rtl6-2 jmhzoz UIImg-s3jz6tx-0 jSJJRD\" src=\"/brw/resources/images/detail/detail_like.svg\" width=\"18px\" height=\"18px\"></span>")
				.append("<em class=\"0like").append(index).append("\">").append(m.get("DC_LIKE")).append("</em></div>")
				.append("<div class=\"ContentlessCommentItem__UserActionBlock-s1n6rtl6-4 kJvkpH\">")
				.append("<button class=\"ContentlessCommentItem__UserActionButton-s1n6rtl6-5 kRhZsb StylelessButton-phxvo7-0 gsSopE like like").append(index).append("\">좋아요</button>")
				.append("</div></div></li>");
				
				index +=1;
			}
		}
		mv.put("comNum", comment.size());
		mv.put("comList", sb.toString());
		
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
				System.out.println(mv.get("DRAMA_NO"));
				userService.updateWishList(mv);
			}
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

	@RequestMapping(value = "dramaComment.br",method = RequestMethod.GET)
	public ModelAndView dramaComment(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView("dramaComment");
		List<Map<String,Object>> dramacomment = dramaService.dramaCommentByLike(commandMap.getMap());

		mv.addObject("dramacomment",dramacomment);
		
		List<String> likeList = new ArrayList<String>();
		if(session.getAttribute("ID")!=null) {
			mv.addObject("ID",request.getAttribute("ID"));
		
			for(int i=0; i<dramacomment.size(); i++) {
				if(dramacomment.get(i).get("DC_LIKE_ID")!=null) {
					String[] str =dramacomment.get(i).get("DC_LIKE_ID").toString().split(",");
					for(int j=0;j<str.length;j++) {
						if(session.getAttribute("ID").equals(str[j])) {
							likeList.add("like"+i);
						}else {
							likeList.add("nonone");
						}
					}
				}
			}
		}
		if(likeList.size()!=0) {
			mv.addObject("likeList",likeList);
		}
		return mv;
	}
	
	
	
	@RequestMapping(value="dramaComment.br",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> CommentLike(CommandMap commandMap) throws Exception {

		Map<String,Object> mv = commandMap.getMap();
		/*좋아요*/
		
		
			Map<String,Object> map = dramaService.commentOne(mv);

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
			}else {
				mv.put("DC_LIKE_ID", mv.get("ID"));
				mv.put("add", "add");
				mv.put("DC_LIKE", 1);
				dramaService.dramaCommentLike(mv);
			}
		return mv;
		}
	
}