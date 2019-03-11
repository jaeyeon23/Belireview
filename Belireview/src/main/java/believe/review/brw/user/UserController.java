package believe.review.brw.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import believe.review.brw.common.common.CommandMap;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource(name="UserService") private UserService userService;
	
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
	public ModelAndView userMovie(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView("userMovie");
		List<Map<String,Object>> userList = userService.UserMovieByRecent(commandMap.getMap());
		System.out.println(userList.get(0).get("MOVIE_NAME"));
		mv.addObject("userList", userList);
		return mv;
	}
	
	@RequestMapping(value="/userMovielist")
	public ModelAndView userMovielist() {
		ModelAndView mv = new ModelAndView("userMovielist");
	
		return mv;
	}
}