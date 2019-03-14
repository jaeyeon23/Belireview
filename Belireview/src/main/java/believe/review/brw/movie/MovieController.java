package believe.review.brw.movie;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import believe.review.brw.common.common.CommandMap;


@Controller
@RequestMapping("/movie")
public class MovieController {
   
	@Resource(name="movieService")
	private MovieService movieService;
	
   @RequestMapping(value="movieList.br")
   public ModelAndView movieList(CommandMap commandMap) throws Exception {
	   
      ModelAndView mv = new ModelAndView("movieList");
      List<Map<String,Object>> list = movieService.selectBoardList(commandMap.getMap());
      mv.addObject("list",list);
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
   public ModelAndView movieComment(CommandMap commandMap)throws Exception {
	   
      ModelAndView mv = new ModelAndView("movieComment");
      List<Map<String,Object>> commentList = movieService.movieCommentByLike(commandMap.getMap());
      mv.addObject("commentList",commentList);
 
      return mv;
   }
   
   


}