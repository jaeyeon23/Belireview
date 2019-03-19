package believe.review.brw.ad;

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

@Controller
@RequestMapping("/ad")
public class AdController {
	private int totalCount;
	
	@Resource(name="adService")
	private AdService adService;
   
   @RequestMapping(value="adList.br")
   public ModelAndView adList(CommandMap commandMap) throws Exception {
	   
      ModelAndView mv = new ModelAndView("adList");
      List<Map<String,Object>> list = adService.selectBoardList();
      mv.addObject("list",list);
      return mv;
   }
   @RequestMapping(value="/adDetail.br")
   public ModelAndView adDetail(CommandMap commandMap,HttpServletRequest request) throws Exception{
	  HttpSession session = request.getSession();
      ModelAndView mv = new ModelAndView("adDetail");
      Map<String,Object> map = adService.adDetail(commandMap.getMap());
      List<Map<String,Object>> comment = adService.adCommentByLike(map);

     totalCount = (Integer)adService.totalAdComment(map);
      
      mv.addObject("map",map);
      mv.addObject("comment",comment);
      mv.addObject("totalCount",totalCount);
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