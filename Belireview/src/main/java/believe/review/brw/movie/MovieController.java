package believe.review.brw.movie;

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

@RequestMapping("/movie")
public class MovieController {
	private int currentPage = 1;	 
	private int totalCount;
	private int blockCount = 10;	 
	private int blockPage = 5; 	 
	private String pagingHtml; 
	private Paging page;
	
	@Resource(name="movieService")
	private MovieService movieService;
	
	@Resource(name="userService")
	private UserService userService;
	

	@RequestMapping(value = "movieList.br" ,method = RequestMethod.GET)
	public ModelAndView movieList(CommandMap commandMap,HttpServletRequest request) throws Exception {
		String p = request.getParameter("currentPage");
		
		if(p == null || p.trim().isEmpty() || p.equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		ModelAndView mv = new ModelAndView("movieList");
		
		List<Map<String,Object>> list = movieService.selectBoardList(commandMap.getMap());
		
		totalCount = list.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/movie/movieList");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		/*if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;*/
		
		list = list.subList(page.getStartCount(), lastCount);
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("list", list);
		mv.addObject("page",pagingHtml);
		mv.addObject("currentPage",currentPage);
		
		return mv;

	}
	@RequestMapping(value = "movieList.br" ,method = RequestMethod.POST)
	@ResponseBody
	public String movieListPOST(CommandMap commandMap,HttpServletRequest request) throws Exception {
		String p = request.getParameter("currentPage");
		if(p == null || p.trim().isEmpty() || p.equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		List<Map<String,Object>> list = movieService.selectBoardList(commandMap.getMap());
		
		StringBuffer sb = new StringBuffer();
		for(Map m : list) {
			sb.append("<div class=\"col-sm-6 col-md-3 list\">")
			.append("<a href=\"/brw/movie/movieDetail.br?movie_NO=").append(m.get("MOVIE_NO")).append("\">")
			.append("<div class=\"thumbnail\">")
			.append("<img src=\"/brw/resources/images/movie/poster/").append(m.get("MOVIE_POSTER_IMAGE")).append("\">")
			.append("<div class=\"caption\">")
			.append("<h3>").append(m.get("MOVIE_NAME")).append("</h3>")
			.append("<p>").append(m.get("MOVIE_DATE")).append("・").append(m.get("MOVIE_COUNTRY")).append("・").append(m.get("MOVIE_GENRE"))
			.append("</p></div></div></a></div>");
		}
		return sb.toString();
		
	}

	@RequestMapping(value="movieDetail.br" ,method = RequestMethod.GET)
	public ModelAndView movieDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("movieDetail");
		HttpSession session = request.getSession();
		
		Map<String,Object> map = movieService.movieDetail(commandMap.getMap());//상세보기
		List<Map<String,Object>> comment = movieService.movieCommentForDetail(map);//댓
		List<Map<String,Object>> actortmp = movieService.movieActor(map); //출연배우
		List<Map<String,Object>> actor = new ArrayList<Map<String,Object>>(); 
		List<Map<String,Object>> detailgenre = movieService.detailgenre(map);//비슷한장르
		
		for(Map m:actortmp) {
			Map mp = new HashMap();
			if(m.get("ACTOR_MOVIE") != null) {
				String tmp[] = m.get("ACTOR_MOVIE").toString().split(", ");
				for(int i=0;i<tmp.length;i++) {
					if(tmp[i].equals(map.get("MOVIE_NO").toString())) {
						mp.put("ACTOR_NAME", m.get("ACTOR_NAME"));
						mp.put("ACTOR_IMAGE", m.get("ACTOR_IMAGE"));
						actor.add(mp);
					}
				}
			}
		}
		movieService.updateReadCount(map);
		
		int totalGrade = movieService.grade(map);
		try {
			List<Map<String,Object>> gradeRatio = movieService.gradeRatio(map);//별점비율
			int[] ratio = new int[11];
			for(int i=0;i<gradeRatio.size();i++) {
				ratio[i] = (int)(Double.parseDouble(gradeRatio.get(i).get("RATIO").toString())*2);
				if(ratio[i]>100)
					ratio[i] = 100;
			}
			mv.addObject("ratio",ratio);
		}catch(Exception e) {
			System.out.println("별점없음");
		}
		String[] image = map.get("MOVIE_GALLERY_IMAGE").toString().split(",");
		for(int i=0;i<image.length;i++) {
			image[i] = image[i].trim();
		}
		double ratingPrediction = 0;
		List<String> likeList = new ArrayList<String>();
		if(session.getAttribute("ID")!=null) {//로그인했을때
			map.put("ID", session.getAttribute("ID"));
			map.put("NAME", session.getAttribute("NAME"));
			Map<String,Object> tmp = userService.userWishList(map);
			if(tmp!=null) {
				if(tmp.get("MYPAGE_MOVIE")!=null) {//보고싶어요
					String str[] = tmp.get("MYPAGE_MOVIE").toString().split(",");
					for(String s : str) {
						if(map.get("MOVIE_NO").toString().equals(s)) {
							mv.addObject("wish","wish");
						}
					}
				}
			}
			for(int i=0;i<comment.size();i++) {
				if(comment.get(i).get("MC_LIKE_ID")!=null) {
					String[] str = comment.get(i).get("MC_LIKE_ID").toString().split(",");
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
			
			tmp = movieService.existGrade(map);
		
			if(tmp!=null) {//별점
				String[] ra = {"평가하기","최악이에요","싫어요","재미없어요","별로에요","부족해요","보통이에요","볼만해요","재미있어요","훌륭해요!","최고에요!"};
				int g = (int)(Double.parseDouble(tmp.get("ML_GRADE").toString())*2);
				mv.addObject("grade",g);
				mv.addObject("ra",ra[g]);
				mv.addObject("initValue","r"+g);
			}else {
				mv.addObject("initValue","r0");
			}
			tmp = movieService.myComment(map);
			if(tmp!=null) {
				mv.addObject("myComment",tmp);
			}
			ratingPrediction = movieService.ratingPrediction(map);
		}
		
		totalCount = (Integer)movieService.totalMovieComment(map);
	
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
			mv.addObject("PROFILE_IMAGE","ican/"+"no_pro.png");
		
		return mv;

	}
	@RequestMapping(value="movieDetail.br",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> movieDe(CommandMap commandMap) throws Exception {

		Map<String,Object> mv = commandMap.getMap();
		Map<String,Object> map = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		
		//좋아요
		if(mv.get("COMMENTLIKE")!=null) {
			map = movieService.commentOne(mv);
			if(map.get("MC_LIKE_ID")!=null) {
				String[] str = map.get("MC_LIKE_ID").toString().split(",");
				boolean exist = false;
				int likenum = Integer.parseInt(map.get("MC_LIKE").toString());
				String mc_like_id = "";
				for(String s : str) {
					System.out.println(s);
					System.out.println(mv.get("ID"));
					if(mv.get("ID").equals(s)) {
						exist = true;
					}else {
						mc_like_id += s+",";
					}
				}
				if(!exist) {
					mc_like_id += mv.get("ID");
					likenum +=1;
					mv.put("add", "add");
				}else {
					likenum -=1;
					mv.put("subtract", "subtract");
				}
				mv.put("MC_LIKE_ID", mc_like_id);
				mv.put("MC_LIKE", likenum);
				System.out.println(mv.get("MC_LIKE"));
				movieService.movieCommentLike(mv);
			}else {
				mv.put("MC_LIKE_ID", mv.get("ID"));
				mv.put("add", "add");
				mv.put("MC_LIKE", 1);
				movieService.movieCommentLike(mv);
			}
		}
		
		/*평점*/
		if(mv.get("RATING")!=null) {
			map = movieService.existGrade(mv);
			if(map==null) {//별점이 없을때
				movieService.addGrade(mv);
			}else {//별점이 있을때
				movieService.updateGrade(mv);
			}
			movieService.updateGrade2(mv);
		}
		/*평점*/
		
		//댓
		if(mv.get("COM")!=null) { 
			map = movieService.myComment(mv);
			if(map==null) {
				movieService.writeMovieComment(mv);
				map = movieService.myComment(mv);
			}else {
				System.out.println("작성ㄴㄴ");
			}
			mv.put("myCom",map);
			map = movieService.existGrade(mv);
			if(map==null) {
				mv.put("RATING", 0);
				movieService.addGrade(mv);
			}
		}
		//댓
		
		//댓삭제
		if(mv.get("DELCOM")!=null) {
			movieService.deleteComment(mv);
		}
		//댓삭제
		
		//댓수정
		if(mv.get("MCOM")!=null) { 
			movieService.updateMovieComment(mv);
			map = movieService.myComment(mv);
			mv.put("myCom",map);
		}
		//댓수정
		
		List<Map<String,Object>> comment = movieService.movieCommentForDetail(mv);//댓
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
					sb.append("<img class=\"defaultImage__ProfileImg-s1kn91bx-1 iaxVtx\" src=\"/brw/resources/images/ican/no_pro.png\">");
				}
				sb.append("</div></div><div class=\"UserNameWithBadges__Self-s1bd3hgj-0 brZhrQ\">")
				.append(m.get("NAME"))
				.append("<input type=\"hidden\" value=\"").append(m.get("MC_NO")).append("\" class=\"00like").append(index).append("\"/>")
				.append("<span class=\"UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 eBREVF\" src=\"/brw/resources/images/detail/detail_comment1.svg\"></span>")
				.append("<span class=\"UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 kyuoIv\" src=\"/brw/resources/images/detail/detail_comment2.svg\"></span>")
				.append("</div></div>")
				.append("<div class=\"BasicCommentItem__UserActionStatus-iqy0k7-4 cMGqAP\">")
				.append("<img src=\"/brw/resources/images/detail/detail_comment_grade.svg\" width=\"16px\" height=\"16px\" alt=\"star\"><span>").append(m.get("ML_GRADE")).append("</span>")
				.append("</div></div>")
				.append("<div class=\"BasicCommentItem__TextBlock-iqy0k7-3 eQRymK\">")
				.append("<div class=\"TextTruncate__Self-wvv1uj-0 jXBVmV\">")
				.append("<div class=\"TextTruncate__Text-wvv1uj-1 gLsCNn\" style=\"white-space: pre-line;\">")
				.append(m.get("MC_CONTENT"))
				.append("</div></div></div>")
				.append("<div class=\"ContentlessCommentItem__LikeReplyBlock-s1n6rtl6-1 bSwpdd\">")
				.append("<span class=\"ContentlessCommentItem__LikeImage-s1n6rtl6-2 jmhzoz UIImg-s3jz6tx-0 jSJJRD\" src=\"/brw/resources/images/detail/detail_like.svg\" width=\"18px\" height=\"18px\"></span>")
				.append("<em class=\"0like").append(index).append("\">").append(m.get("MC_LIKE")).append("</em></div>")
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
				if(map.get("MYPAGE_MOVIE")==null) {
					userService.updateWishList(mv);	
					mv.put("add", "add");
				}else {
					String[] str = map.get("MYPAGE_MOVIE").toString().split(",");
					boolean exist = false;
					String movie_no = "";
					for(String s : str) {
						if(mv.get("MOVIE_NO").equals(s)) {
							exist = true;
						}else {
							movie_no += s+",";
						}
					}
					if(!exist) {
						movie_no += mv.get("MOVIE_NO");
						mv.put("add", "add");
					}else {
						mv.put("subtract", "subtract");
					}
					mv.put("MOVIE_NO", movie_no);
					System.out.println(mv.get("MOVIE_NO"));
					userService.updateWishList(mv);
				}
			}
		}
		return mv;
	}

	@RequestMapping(value = "movieInfo.br")
	public ModelAndView movieInfo(CommandMap commandMap) throws Exception {


		ModelAndView mv = new ModelAndView("movieInfo");
		Map<String,Object> map = movieService.movieDetail(commandMap.getMap());
		
		mv.addObject("map",map);

		return mv;
		
	}

	@RequestMapping(value = "movieComment.br",method = RequestMethod.GET)
	public ModelAndView movieComment(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView("movieComment");
		List<Map<String,Object>> moviecomment = movieService.movieCommentByLike(commandMap.getMap());

		mv.addObject("moviecomment",moviecomment);
		
		List<String> likeList = new ArrayList<String>();
		if(session.getAttribute("ID")!=null) {
			mv.addObject("ID",request.getAttribute("ID"));
		
			for(int i=0; i<moviecomment.size(); i++) {
				if(moviecomment.get(i).get("MC_LIKE_ID")!=null) {
					String[] str =moviecomment.get(i).get("MC_LIKE_ID").toString().split(",");
					for(int j=0;j<str.length;j++) {
						if(session.getAttribute("ID").equals(str[j])) {
							likeList.add("like"+i);
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
	
	
	
	@RequestMapping(value="movieComment.br",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> CommentLike(CommandMap commandMap) throws Exception {

		Map<String,Object> mv = commandMap.getMap();
		/*좋아요*/
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(mv.get("COMMENTLIKE")!=null) {
			map = movieService.commentOne(mv);
	
			if(map.get("MC_LIKE_ID")!=null) {
				String[] str = map.get("MC_LIKE_ID").toString().split(",");
				boolean exist = false;
				int likenum = Integer.parseInt(map.get("MC_LIKE").toString());
				System.out.println(likenum);
				String mc_like_id = "";
				for(String s : str) {
					System.out.println(s);
					System.out.println(mv.get("ID"));
					if(mv.get("ID").equals(s)) {
						exist = true;
					}else {
						mc_like_id += s+",";
					}
				}
				if(!exist) {
					mc_like_id += mv.get("ID");
					likenum +=1;
					mv.put("add", "add");
				}else {
					likenum -=1;
					mv.put("subtract", "subtract");
				}
				mv.put("MC_LIKE_ID", mc_like_id);
				mv.put("MC_LIKE", likenum);
				System.out.println(mv.get("MC_LIKE"));
				movieService.movieCommentLike(mv);
			}else {
				mv.put("MC_LIKE_ID", mv.get("ID"));
				mv.put("add", "add");
				mv.put("MC_LIKE", 1);
				movieService.movieCommentLike(mv);
			}
		}
		if(mv.get("orderby")!=null) {
			List<Map<String,Object>> moviecomment = movieService.movieCommentByLike(mv);
			System.out.println("d");
			StringBuffer sb = new StringBuffer();
			int index = 0;
			List<String> likeList = new ArrayList<String>();
			
			for(int i=0; i<moviecomment.size(); i++) {
				if(moviecomment.get(i).get("MC_LIKE_ID")!=null) {
					String[] str =moviecomment.get(i).get("MC_LIKE_ID").toString().split(",");
					if(str !=null) {
						for(int j=0;j<str.length;j++) {
							if(mv.get("ID").equals(str[j])) {
								likeList.add("like"+i);
							}
						}
					}
				}
			}
			for(Map m : moviecomment) {
				sb.append("<div class=\"BasicCommentItem__Comment-iqy0k7-0 iNWJNm\">")
				.append("<div class=\"BasicCommentItem__TitleContainer-iqy0k7-1 jWsgqF\">")
				.append("<div class=\"BasicCommentItem__ProfileBlock-iqy0k7-2 dFeRwI\">")
				.append("<div class=\"ProfilePhoto__Self-s1v3isfu-1 lniNjX RoundedImageBlock-k5m4n5-0 gUZYtN\">")
				.append("<div class=\"ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 kgJrze\"></div>")
				.append("<div class=\"ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy\">");
				if(m.get("PROFILE_IMAGE")!=null) {
					sb.append("<img class=\"defaultImage__ProfileImg-s1kn91bx-1 iaxVtx\" src=\"/brw/resources/images/user_profile/").append(m.get("PROFILE_IMAGE")).append("\">");
				}else {
					sb.append("<img class=\"defaultImage__ProfileImg-s1kn91bx-1 iaxVtx\" src=\"/brw/resources/images/ican/no_pro.png\">");
				}
				sb.append("</div></div>")
				.append("<div class=\"UserNameWithBadges__Self-s1bd3hgj-0 brZhrQ\">")
				.append(m.get("NAME"))
				.append("<input type=\"hidden\" value=\"").append(m.get("MC_NO")).append("\" class=\"00like").append(index).append("\"/>")
				.append("<span class=\"UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 eBREVF\" src=\"/brw/resources/images/detail/detail_comment1.svg\"></span>")
				.append("<span class=\"UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 kyuoIv\" src=\"/brw/resources/images/detail/detail_comment2.svg\"></span>")
				.append("</div></div>")
				.append("<div class=\"BasicCommentItem__UserActionStatus-iqy0k7-4 cMGqAP\">")
				.append("<img src=\"/brw/resources/images/detail/detail_comment_grade.svg\" width=\"16px\" height=\"16px\" alt=\"star\">")
				.append("<span>").append(m.get("ML_GRADE")).append("</span>")
				.append("</div></div>")
				.append("<div class=\"BasicCommentItem__TextBlock-iqy0k7-3 gVqTAw\">")
				.append("<div class=\"ContentlessCommentItem__Text-s1n6rtl6-0 eMbWQD\">")
				.append(m.get("MC_CONTENT"))
				.append("</div></div>")
				.append("<div class=\"ContentlessCommentItem__LikeReplyBlock-s1n6rtl6-1 bSwpdd\">")
				.append("<span class=\"ContentlessCommentItem__LikeImage-s1n6rtl6-2 jmhzoz UIImg-s3jz6tx-0 jSJJRD\" src=\"/brw/resources/images/detail/detail_like.svg\" width=\"18px\" height=\"18px\"></span>")
				.append("<em class=\"0like").append(index).append("\">").append(m.get("MC_LIKE")).append("</em></div>")
				.append("<div class=\"ContentlessCommentItem__UserActionBlock-s1n6rtl6-4 kJvkpH\">")
				.append("<button class=\"ContentlessCommentItem__UserActionButton-s1n6rtl6-5 kRhZsb StylelessButton-phxvo7-0 gsSopE like like").append(index).append("\">좋아요</button>")
				.append("</div></div>")
				.append("<div class=\"PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa\"></div>");
				
				index +=1;
			}
			mv.put("likeList",likeList);
			mv.put("commentList", sb.toString());
		}
	return mv;
	}
	
}