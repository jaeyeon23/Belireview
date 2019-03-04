package believe.review.brw.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Movie")
public class MovieController {
	
	@RequestMapping("moviewList")
	public ModelAndView movieList() {
		ModelAndView mv = new ModelAndView("Movie/movieList");
		return mv;
	}
	
	@RequestMapping("moviewDetail")
	public ModelAndView movieDetail() {
		ModelAndView mv = new ModelAndView("Movie/movieDetail");
		return mv;
	}
	
	@RequestMapping("moviewInfo")
	public ModelAndView movieInfo() {
		ModelAndView mv = new ModelAndView("Movie/movieInfo");
		return mv;
	}
	
	@RequestMapping("movieComment")
	public ModelAndView movieComment() {
		ModelAndView mv = new ModelAndView("Movie/movieComment");
		return mv;
	}
	
	

}
