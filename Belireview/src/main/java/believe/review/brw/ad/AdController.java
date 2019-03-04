package believe.review.brw.ad;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/ad")
public class AdController {
   
   @RequestMapping(value="/adList.br")
   public ModelAndView adList() {
      ModelAndView mv = new ModelAndView("adList");
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