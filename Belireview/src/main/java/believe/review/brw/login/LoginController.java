package believe.review.brw.login;

import java.math.BigDecimal;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginComplete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		System.out.println("아이디" + commandMap.get("id"));

		Map<String, Object> chk = loginService.loginGo(commandMap.getMap());
	
		if(chk==null) {//아이디가 없으면
			mv.setViewName("loginForm");
			mv.addObject("message","해당 아이디가 없습니다.");
			return mv;						
		}else{

			int admin = ((BigDecimal) chk.get("ADMIN")).intValue();

			if (admin == 1) {// 관리자

				if (chk.get("PASSWORD").equals(commandMap.get("password"))) {
					session.setAttribute("ID", commandMap.get("id"));
					session.setAttribute("NAME", chk.get("NAME"));
					session.setAttribute("ADMIN", chk.get("ADMIN"));

					mv.setViewName("redirect:/admin/main.br");
					return mv;
				} else {
					mv.setViewName("loginForm");
					mv.addObject("message", "비밀번호를 확인해주세요.");
					return mv;
				}
			}else {// 회원이 로그인을 시도하였을 때
				System.out.println("비밀번호1:" + chk.get("PASSWORD") + "\t비밀번호2:" + commandMap.get("password"));

				if (chk.get("PASSWORD").equals(commandMap.get("password"))) {
					session.setAttribute("ID", commandMap.get("id"));
					mv.addObject("MEMBER", chk);
					mv.setViewName("redirect:/main.br");
					session.setAttribute("NAME", chk.get("NAME"));
					session.setAttribute("TEL", chk.get("TEL"));
					session.setAttribute("EMAIL", chk.get("EMAIL"));
					session.setAttribute("ADMIN", chk.get("ADMIN"));

					return mv;
				} else {
					mv.addObject("message", "비밀번호를 확인해주세요.");
					mv.setViewName("loginForm");
					return mv;
				}
			}
		}
		
	}	 
		 
	
	@RequestMapping(value = "/logout.br")		//로그아웃
	   public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) {
	      HttpSession session = request.getSession(false);
	      if (session != null)
	         session.invalidate();
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("redirect:/main.br");
	      return mv;
	 }
	
	@RequestMapping(value="/findIdForm" )
	public ModelAndView findForm() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("findIdForm");
		return mv;
	}
	
	@RequestMapping(value="/findIdOk",method=RequestMethod.POST)
	public ModelAndView findId(HttpServletRequest request,CommandMap commandMap)throws Exception{

		int memberFindChk;
		
		ModelAndView mv=new ModelAndView();
 		
		Map<String, Object> chk = loginService.findId(commandMap.getMap());
 		
 		
 		if (chk == null) {
 			memberFindChk=0;
			mv.addObject("memberFindChk",memberFindChk);
			mv.setViewName("findIdError");
			return mv;
 		} else {
 			
 			memberFindChk = 1;
 			mv.addObject("NAME",commandMap.get("name"));
			mv.addObject("ID",chk.get("ID"));
			mv.addObject("memberFindChk", memberFindChk);
			mv.setViewName("findIdOk");
			return mv;
		
 		}
 		
 	}
	
	@RequestMapping(value="/findPwForm" )
	public ModelAndView findPwForm() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("findPwForm");
		return mv;
	}
		
	

		
	

}


