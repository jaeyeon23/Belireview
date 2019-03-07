package believe.review.brw.login;

import java.math.BigDecimal;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
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

		System.out.println("�븘�씠�뵒" + commandMap.get("ID"));

		Map<String, Object> chk = loginService.loginGo(commandMap.getMap());

		int admin = ((BigDecimal)chk.get("ADMIN")).intValue();
		
		if(chk==null) {//아이디가 없으면

			mv.setViewName("loginForm");
			mv.addObject("message","lkjlkjl");
			return mv;
						

		}else if(admin == 1) {//관리자

			
			if(chk.get("PASSWORD").equals(commandMap.get("PASSWORD"))) {
	              session.setAttribute("ID", commandMap.get("ID"));
	              session.setAttribute("NAME", chk.get("NAME"));
	              session.setAttribute("ADMIN", chk.get("ADMIN"));
	              
	              mv.setViewName("redirect:/admin/main.br");
	              return mv;
			}
			else {
				mv.setViewName("loginForm");		
				mv.addObject("message","비밀번호를 확인해주세요.");
				return mv;
			}
		}//회원이 로그인을 시도하였을 때
		else {
			System.out.println("비밀번호1:"+chk.get("PASSWORD")+"\t비밀번호2:"+commandMap.get("PASSWORD"));

		
			if(chk.get("PASSWORD").equals(commandMap.get("PASSWORD"))) {
				session.setAttribute("ID",commandMap.get("ID"));
				mv.addObject("MEMBER",chk);
				mv.setViewName("redirect:/main.br");
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
	      mv.setViewName("redirect:/main.br");
	      return mv;
	 }
	
	@RequestMapping(value="/findIdForm" )
	public ModelAndView findForm() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("findIdForm");
		return mv;
	}
	
	@RequestMapping(value="/findId",method=RequestMethod.POST)
	public ModelAndView findId(HttpServletRequest request,CommandMap commandMap)throws Exception{

		int memberFindChk;
		String name=request.getParameter("NAME");
		String email=request.getParameter("EMAIL");

		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> chk=loginService.findId(commandMap.getMap());
		
		if(chk==null) {
			memberFindChk=0;
			mv.addObject("memberFindChk",memberFindChk);
			mv.setViewName("findIdError");
			return mv;
		}else {
			if(chk.get(name).equals(name)&&chk.get(email).equals(email)) {
				memberFindChk=1;
				mv.addObject("chk",chk);
				mv.addObject("memberFindChk",memberFindChk);
				mv.setViewName("findIdOk");
				return mv;
			}else {
				memberFindChk=-1;
				mv.addObject("memberFindChk",memberFindChk);
				mv.setViewName("findIdError");
				return mv;
			}
		}
		/*ModelAndView mv = new ModelAndView();

		Map<String, Object> chk=loginService.findId(commandMap.getMap());

		System.out.println("이름" + commandMap.get("NAME"));

		if(chk==null) {
			mv.addObject("message", "입력하신 정보와 일치하는 ID가 없습니다.");
			return mv;
			
		}else {
			mv.addObject("message", "찾은 ID : <strong>"+chk+"</strong>");
			return mv;
		}*/
		
	}

}


