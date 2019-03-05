package believe.review.brw.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/movie")
public class MovieController {
   
   @RequestMapping(value="/movieList")
   public ModelAndView movieList() {
      ModelAndView mv = new ModelAndView("movieList");
      return mv;
   }
   
   @RequestMapping(value="/movieDetail")
   public ModelAndView movieDetail() {
      ModelAndView mv = new ModelAndView("movieDetail");
      return mv;
   }
   
   @RequestMapping(value="/movieInfo")
   public ModelAndView movieInfo() {
      ModelAndView mv = new ModelAndView("movieInfo");
      return mv;
   }
   
   @RequestMapping(value="/movieComment")
   public ModelAndView movieComment() {
      ModelAndView mv = new ModelAndView("movieComment");
      return mv;
   }
   
   


}