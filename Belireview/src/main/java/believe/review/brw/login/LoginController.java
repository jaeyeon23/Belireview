package believe.review.brw.login;

import java.util.HashMap;
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
@RequestMapping("/member")
public class LoginController {

	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value="/loginForm")
	public ModelAndView loginForm() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("loginForm");
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/login.br", method = RequestMethod.POST)
	public ModelAndView loginComplete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		System.out.println("아이디" + commandMap.get("ID"));

		Map<String, Object> chk = loginService.loginGo(commandMap.getMap());

		if(chk==null) {//아이디가 없으면
			mv.setViewName("loginForm");
			mv.addObject("message","해당 아이디가 없습니다.");
			return mv;
						
		}else if(chk.get("ADMIN").equals("1")) {//관리자
			
			if(chk.get("PASSWORD").equals(commandMap.get("PASSWORD"))) {
	              session.setAttribute("ID", commandMap.get("ID"));
	              session.setAttribute("NAME", chk.get("NAME"));
	              session.setAttribute("ADMIN", chk.get("ADMIN"));
	              
	              mv.setViewName("redirect:/admin/adminMain");
	              return mv;
			}
			else {
			mv.setViewName("loginForm");		
			mv.addObject("message","비밀번호를 확인해주세요.");
			return mv;
		}
	}//회원이 로그인을 시도하였을 때
		else {
			//System.out.println("비밀번호1:"+map.get("PASSWORD")+"비밀번호2:"+commandMap.get("PASSWORD"));
		
			if(chk.get("PASSWORD").equals(commandMap.get("PASSWORD"))) {
				session.setAttribute("ID",commandMap.get("ID"));
				mv.addObject("MEMBER",chk);
				mv.setViewName("redirect:main");
				session.setAttribute("NAME", chk.get("NAME"));
				session.setAttribute("TEL", chk.get("TEL"));
				session.setAttribute("EMAIL", chk.get("EMAIL"));
				session.setAttribute("ADMIN", chk.get("ADMIN"));
				
				return mv;
			}
			else {
				mv.addObject("message","비밀번호를 확인해주세요.");
				mv.setViewName("loginForm");
				return mv;
			}
		}
		
	}	 
	
	@RequestMapping(value = "/logout.br")		//로그아웃
	   public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) {
	      HttpSession session = request.getSession(false);
	      if (session != null)
	         session.invalidate();
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("redirect:/main");
	      return mv;
	 }

}

