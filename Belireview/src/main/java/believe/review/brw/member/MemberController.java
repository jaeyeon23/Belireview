package believe.review.brw.member;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
 
import believe.review.brw.common.common.CommandMap;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping(value="/joinTerms")  //step1 약관동의
	public ModelAndView joinTerms(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("joinTerms");
		return mv;
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)    //step2 정보입력
	public ModelAndView joinForm(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("join");
		return mv;
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST) //step3 가입완료
	public ModelAndView join(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();
		
		Map<String, Object> memberMap = new HashMap<String, Object>();	
	
		memberMap = commandMap.getMap();
		
		memberService.insertMember(memberMap, request);
		
		/*
		 * session.setAttribute("ID", commandMap.get("id"));
		 * session.setAttribute("PASSWORD", commandMap.get("password"));
		 * session.setAttribute("NAME", commandMap.get("name"));
		 * session.setAttribute("EMAIL", commandMap.get("email"));
		 * session.setAttribute("TEL", commandMap.get("tel"));
		 * session.setAttribute("ADMIN", 0); session.setAttribute("EMAIL_MARKETING", 1);
		 * session.setAttribute("SMS_MARKETING", 1);
		 */
		mv.setViewName("joinComplete");
		
		mv.addObject("NAME",commandMap.get("name"));
		return mv;
	}
	

}

























