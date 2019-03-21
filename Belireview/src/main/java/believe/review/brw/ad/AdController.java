package believe.review.brw.ad;

import java.util.ArrayList;
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
import believe.review.brw.user.UserService;

@Controller
@RequestMapping("/ad")
public class AdController {
	private int totalCount;
	
	@Resource(name="adService")
	private AdService adService;
	
	@Resource(name="userService")
	private UserService userService;
   
   @RequestMapping(value="adList.br")
   public ModelAndView adList(CommandMap commandMap) throws Exception {
	   
      ModelAndView mv = new ModelAndView("adList");
      List<Map<String,Object>> list = adService.selectBoardList(commandMap.getMap());
      mv.addObject("list",list);
      return mv;
   }
   @RequestMapping(value="/adDetail.br" , method=RequestMethod.GET)
   public ModelAndView adDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("dramaDetail");
		HttpSession session = request.getSession(); 
		
		Map<String,Object> map = adService.adDetail(commandMap.getMap());//상세보기
		List<Map<String,Object>> comment = adService.adCommentForDetail(map);//댓
		
		List<Map<String,Object>> actor = adService.adActor(map); //출연배우
		
		List<Map<String,Object>> detailgenre = adService.detailgenre(map);//비슷한장르
		int totalGrade = adService.grade(map);
		try {
			List<Map<String,Object>> gradeRatio = adService.gradeRatio(map);//별점비율
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
		String[] image = map.get("ad_CONTENT_IMAGE").toString().split(",");
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
				if(tmp.get("MYPAGE_ad")!=null) {//보고싶어요
					String str[] = tmp.get("MYPAGE_ad").toString().split(",");
					for(String s : str) {
						if(map.get("ad_NO").toString().equals(s)) {
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
			
			tmp = adService.existGrade(map);
		
			if(tmp!=null) {//별점
				String[] ra = {"평가하기","최악이에요","싫어요","재미없어요","별로에요","부족해요","보통이에요","볼만해요","재미있어요","훌륭해요!","최고에요!"};
				int g = (int)(Double.parseDouble(tmp.get("DL_GRADE").toString())*2);
				mv.addObject("grade",g);
				mv.addObject("ra",ra[g]);
				mv.addObject("initValue","r"+g);
			}else {
				mv.addObject("initValue","r0");
			}
			tmp = adService.myComment(map);
			if(tmp!=null) {
				mv.addObject("myComment",tmp);
			}
			ratingPrediction = adService.ratingPrediction(map);
		}
		
		totalCount = (Integer)adService.totalAdComment(map);
	
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
 
   @RequestMapping(value="/adComment.br",method = RequestMethod.GET)
   public ModelAndView adComment(CommandMap commandMap,HttpServletRequest request)throws Exception {
	  HttpSession session = request.getSession();
     ModelAndView mv = new ModelAndView("adComment");
		List<Map<String,Object>> adcomment = adService.adCommentByLike(commandMap.getMap());
	/*    Map<String,Object> map = adService.myComment();
		*/
		

		mv.addObject("adcomment",adcomment);
		
		if(session.getAttribute("ID")!=null)
			mv.addObject("ID",request.getAttribute("ID"));
			System.out.println("id"+session.getAttribute("ID"));
		
	/*	for(int i=0; i<adcomment.size(); i++) {
			String[] str =adcomment.get(i).get("AD_LIKE_ID").toString().split(",");
			System.out.println("gg"+adcomment.get(i).get("AD_LIKE_ID"));
			
			for(String s : str) {
				System.out.println("nn"+s);
				if(session.getAttribute("ID").equals(s)) {
					mv.addObject("yes","a");
				}
			}
		}*/

	   
      return mv;
   }
   
   @RequestMapping(value="adComment.br",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> CommentLike(CommandMap commandMap) throws Exception {

		Map<String,Object> mv = commandMap.getMap();
		/*좋아요*/
		
		
			Map<String,Object> map = adService.myComment(mv);

			System.out.println(map.get("AD_LIKE_ID"));
			if(map.get("AD_LIKE_ID")!=null) {
				
				String[] str = map.get("AD_LIKE_ID").toString().split(",");
				boolean exist = false;
				int likenum = Integer.parseInt(map.get("AD_LIKE").toString());
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
				mv.put("AD_LIKE_ID", dc_like_id);
				mv.put("AD_LIKE", likenum);
				System.out.println(mv.get("AD_LIKE"));
				adService.adCommentLike(mv);
			}
		return mv;
		}
	
}