package believe.review.brw.drama;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

@RequestMapping("/drama")
public class DramaController {

   @RequestMapping(value="dramaList.br")
   public ModelAndView dramaList() throws Exception{
      
      ModelAndView mv = new ModelAndView("dramaList");
      
      return mv;
      
   
   }
   
   @RequestMapping(value="dramaDetail.br")
   public ModelAndView dramaDetail() throws Exception{
      
      ModelAndView mv = new ModelAndView("dramaDetail");
      
      return mv;
      
   
   }
   
   @RequestMapping(value="dramaInfo.br")
   public ModelAndView dramaInfo() throws Exception{
      
      ModelAndView mv = new ModelAndView("dramaInfo");
      
      return mv;
      
   
   }
   
   @RequestMapping(value="dramaComment.br")
   public ModelAndView dramaComment() throws Exception{
      
      ModelAndView mv = new ModelAndView("dramaComment");
      
      return mv;
      
   
   }
}