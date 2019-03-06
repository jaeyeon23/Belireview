package believe.review.brw.ad;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import believe.review.brw.common.common.CommandMap;

@Controller
@RequestMapping("/ad")
public class AdController {
	
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
   public ModelAndView adDetail() {
      ModelAndView mv = new ModelAndView("adDetail");
      return mv;
   }
   @RequestMapping(value="/adInfo.br")
   public ModelAndView adInfo() {
      ModelAndView mv = new ModelAndView("adInfo");
      return mv;
   }
   @RequestMapping(value="/adComment.br")
   public ModelAndView adComment() {
      ModelAndView mv = new ModelAndView("adComment");
      return mv;
   }
}