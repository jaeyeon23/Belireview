package believe.review.brw.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("user")
public class UserController {
	@RequestMapping(value="userMovie.br")
	public ModelAndView userMovie() {
		ModelAndView mv = new ModelAndView("userMovie");
		return mv;
	}
}
