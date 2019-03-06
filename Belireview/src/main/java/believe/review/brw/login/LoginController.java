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

		System.out.println("�븘�씠�뵒" + commandMap.get("ID"));

		Map<String, Object> chk = loginService.loginGo(commandMap.getMap());

		if(chk==null) {//�븘�씠�뵒媛� �뾾�쑝硫�
			mv.setViewName("loginForm");
			mv.addObject("message","lkjlkjl");
			return mv;
						
		}else if(chk.get("ADMIN").equals("1")) {//愿�由ъ옄
			
			if(chk.get("PASSWORD").equals(commandMap.get("PASSWORD"))) {
	              session.setAttribute("ID", commandMap.get("ID"));
	              session.setAttribute("NAME", chk.get("NAME"));
	              session.setAttribute("ADMIN", chk.get("ADMIN"));
	              
	              mv.setViewName("redirect:/admin/adminMain");
	              return mv;
			}
			else {
			mv.setViewName("loginForm");		
			mv.addObject("message","鍮꾨�踰덊샇瑜� �솗�씤�빐二쇱꽭�슂.");
			return mv;
		}
	}//�쉶�썝�씠 濡쒓렇�씤�쓣 �떆�룄�븯���쓣 �븣
		else {
			//System.out.println("鍮꾨�踰덊샇1:"+map.get("PASSWORD")+"鍮꾨�踰덊샇2:"+commandMap.get("PASSWORD"));
		
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
				mv.addObject("message","鍮꾨�踰덊샇瑜� �솗�씤�빐二쇱꽭�슂.");
				mv.setViewName("loginForm");
				return mv;
			}
		}
		
	}	 
	
	@RequestMapping(value = "/logout.br")		//濡쒓렇�븘�썐
	   public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) {
	      HttpSession session = request.getSession(false);
	      if (session != null)
	         session.invalidate();
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("redirect:/main");
	      return mv;
	 }

}

