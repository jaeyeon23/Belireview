package believe.review.brw.login;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import believe.review.brw.HomeController;
import believe.review.brw.common.CommandMap;

@Controller
/*@RequestMapping("/member")*/
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	   /**
	    * Simply selects the home view to render by returning its name.
	    */

	   @RequestMapping(value = "/login.br", method = RequestMethod.GET)
	   public String home(Locale locale, Model model) {

	      logger.info("Welcome home! The client locale is {}.", locale);

	      Date date = new Date();
	      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

	      String formattedDate = dateFormat.format(date);

	      model.addAttribute("serverTime", formattedDate);

	      return "login";
	   }
	   
	/*@Resource(name="loginService")
	private LoginService loginService;

	@RequestMapping(value="/loginForm.br")
	public ModelAndView loginForm() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping(value="/login.br", method=RequestMethod.POST)
	public ModelAndView loginMember(CommandMap commandMap,HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView();
		HttpSession session = request.getSession();
		
		Map<String,Object> map=loginService.loginMember(commandMap.getMap());		
		 // System.out.println("아이디" + commandMap.get("ID"));
		 
		if(map==null) {//아이디가 없으면
			mv.setViewName("loginForm");
			mv.addObject("message","해당 아이디가 없습니다.");
			return mv;
						
		}else if(map.get("ADMIN").equals("1")) {//관리자
			
			if(map.get("PASSWORD").equals(commandMap.get("PASSWORD"))) {
	              session.setAttribute("ID", commandMap.get("ID"));
	              session.setAttribute("NAME", map.get("NAME"));
	              session.setAttribute("ADMIN", map.get("ADMIN"));
	              
	              mv.setViewName("redirect:/admin/adminPage");
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
		
			if(map.get("PASSWORD").equals(commandMap.get("PASSWORD"))) {
				session.setAttribute("ID",commandMap.get("ID"));
				mv.addObject("MEMBER",map);
				mv.setViewName("redirect:main");
				session.setAttribute("NAME", map.get("NAME"));
				session.setAttribute("TEL", map.get("TEL"));
				session.setAttribute("EMAIL", map.get("EMAIL"));
				session.setAttribute("ADMIN", map.get("ADMIN"));
				
				return mv;
			}
			else {
				mv.addObject("message","비밀번호를 확인해주세요.");
				mv.setViewName("loginForm");
				return mv;
			}
		}
	}
	
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(CommandMap commandMap,HttpServletRequest request) {
		HttpSession session=request.getSession(false);
		if(session!=null)
			session.invalidate();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("redirect:/main");
		return mv;
	}*/
}
