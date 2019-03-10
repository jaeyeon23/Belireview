package believe.review.brw.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import believe.review.brw.common.common.CommandMap;

@Controller
@RequestMapping("/user")
public class UserController {
	/*
	 * @Resource(name="userService") private UserService userService;
	 */
	@RequestMapping(value="/user.br")  
	public ModelAndView user(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user");
		return mv;
	}
	
	
	@RequestMapping(value="/userModifyPass")  // ���������� �̵��� ��й�ȣ Ȯ�� 
	public ModelAndView userModifyPass(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pwdCheck");
		return mv;
	}
	
	@RequestMapping(value="/userModify", method=RequestMethod.GET)  
	public ModelAndView userModify(){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("modify");
		return mv;
	}
	
	@RequestMapping(value="/userModify", method=RequestMethod.POST)  
	public ModelAndView userModify(CommandMap commandMap, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user");
		return mv;
	}
	
	
	@RequestMapping(value="/userMovie")
	public ModelAndView userMovie() {
		ModelAndView mv = new ModelAndView("userMovie");
		return mv;
	}
}