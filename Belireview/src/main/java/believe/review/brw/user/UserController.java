package believe.review.brw.user;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
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
	
    @Resource(name="userService") private UserService userService;
	 
	@RequestMapping(value="/user")  //마이페이지
	public ModelAndView user(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user");
		return mv;
	}

	@RequestMapping(value="/userModifyPass")  // 수정폼으로 이동전 비밀번호 확인 
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
	public ModelAndView userModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		Map<String, Object> userMap = new HashMap<String, Object>();
		userMap = commandMap.getMap();
		
		userMap.put("email_marketing", request.getParameter("termsEmail"));
		userMap.put("sms_marketing", request.getParameter("termsLocation"));
		
		userService.ModifyMember(userMap, request);
	
			
		Map<String, Object> usermem = userService.userGo(commandMap.getMap());
		
		 //업데이트된 정보 세션에 다시저장
		 session.setAttribute("NAME", usermem.get("NAME"));
		 session.setAttribute("TEL", usermem.get("TEL"));
		 session.setAttribute("EMAIL", usermem.get("EMAIL"));
		 session.setAttribute("PASSWORD", usermem.get("PASSWORD"));
		 session.setAttribute("EMAIL_MARKETING", usermem.get("EMAIL_MARKETING"));
		 session.setAttribute("SMS_MARKETING", usermem.get("SMS_MARKETING"));
		 
		
		mv.setViewName("user");		
		return mv;
	}
	
	
	@RequestMapping(value="/userMovie")
	public ModelAndView userMovie(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView("userMovie");
		List<Map<String,Object>> userList = userService.UserMovieByRecent(commandMap.getMap());
		
		mv.addObject("userList", userList);
		return mv;
	}
	
	@RequestMapping(value="/userMovielist")
	public ModelAndView userMovielist(CommandMap commandMap, HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView("userMovielist");
		List<Map<String,Object>> userMovieAll = userService.UserMovieAll(commandMap.getMap());
		
		mv.addObject("userMovieAll", userMovieAll);
	
		return mv;
	}
	
	@RequestMapping(value="/userDeleteForm")
	public ModelAndView userDeleteForm(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userDeleteForm");
		return mv;
	}
	
	@RequestMapping(value="/userDeletechk")
	public ModelAndView userDeletechk(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userDeletechk");
		return mv;
	}
	
	@RequestMapping(value="/userDelete")
	public ModelAndView userDelete(CommandMap commandMap, HttpServletRequest request)throws Exception{
		
		ModelAndView mv=new ModelAndView();
		HttpSession session = request.getSession();
		int check = 0;
		
		Map<String, Object> member = userService.myinfoDetail(commandMap.getMap());
		if(member.get("PASSWORD").equals(commandMap.get("password"))) {
			userService.deleteUserOne(commandMap.getMap());
			session.invalidate();
			check = 0;
			mv.addObject("check",check);
			mv.setViewName("userDelete");
			return mv;
						
		}else {
			check = 1;
			mv.addObject("check",check);
			mv.setViewName("userDelete");
			return mv;
		}
			
	}
		
		/*ModelAndView mv = new ModelAndView();
		
		String member_id = session.getAttribute("id").toString();
		String member_pw = request.getParameter("password");
		
		int deleteCheck;

		Map<String, Object> userdel = userService.checkPwd(commandMap.getMap());

		if (userdel.get("password").equals(session.getAttribute(member_pw))) {
			// 비밀번호가 맞으면
			deleteCheck = 1;
			// 삭제쿼리 ㄱㄱ
			userService.deleteUserOne(commandMap.getMap());
			session.removeAttribute("member_id");
		} else {
			deleteCheck = -1;
		}
		mv.addObject("deleteCheck", deleteCheck);
		mv.setViewName("/user/deleteOK");
		return mv;
	}*/
	
}
