package believe.review.brw.login;

import java.math.BigDecimal;
import java.util.Map;
import java.util.Properties;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import believe.review.brw.common.common.CommandMap;

@Controller
@RequestMapping("/member")
public class LoginController {

	String authNUm = "";
	String Email = "";
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
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

				if (passwordEncoder.matches((String)commandMap.get("password"), (String)chk.get("PASSWORD"))) {
					session.setAttribute("ID", commandMap.get("id"));
					session.setAttribute("NAME", chk.get("NAME"));
					session.setAttribute("ADMIN", chk.get("ADMIN"));

					mv.setViewName("redirect:/main.br");
					return mv;
				} else {
					mv.setViewName("loginForm");
					mv.addObject("message", "비밀번호를 확인해주세요.");
					return mv;
				}
			}else {// 회원이 로그인을 시도하였을 때
				System.out.println(commandMap.get("uri"));
				if (passwordEncoder.matches((String)commandMap.get("password"), (String)chk.get("PASSWORD"))) {
					session.setAttribute("ID", commandMap.get("id"));
					mv.addObject("MEMBER", chk);
					mv.setViewName("redirect:/main.br");
					session.setAttribute("NAME", chk.get("NAME"));
					session.setAttribute("TEL", chk.get("TEL"));
					session.setAttribute("EMAIL", chk.get("EMAIL"));
					session.setAttribute("ADMIN", chk.get("ADMIN"));
					session.setAttribute("PROFILE_IMAGE", chk.get("PROFILE_IMAGE"));
					session.setAttribute("PASSWORD", chk.get("PASSWORD"));
					session.setAttribute("EMAIL_MARKETING", chk.get("EMAIL_MARKETING"));
					session.setAttribute("SMS_MARKETING", chk.get("SMS_MARKETING"));
					 

					return mv;
				} else {
					mv.setViewName("loginForm");
					mv.addObject("message", "비밀번호를 확인해주세요.");
					return mv;
				}
			}
		}
		
	}	 
		 
	
	@RequestMapping(value = "/logout.br")
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

 			/*if(!chk.get("EMAIL").equals(commandMap.get("email"))) {
 				memberFindChk=-1;
 				mv.addObject("memberFindChk",memberFindChk);
 				mv.setViewName("findIdError");
 			}else {*/
 			memberFindChk = 1;
 			mv.addObject("NAME",commandMap.get("name"));
			mv.addObject("ID",chk.get("ID"));
			mv.addObject("memberFindChk", memberFindChk);
			mv.setViewName("findIdOk");
/*ㅁ*/
 			return mv;
 		}
 		
 	}
	
	@RequestMapping(value="/findPwForm" )
	public ModelAndView findPwForm() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("findPwForm");
		return mv;
	}
	
	@RequestMapping(value = "/findPw")
	public ModelAndView clickMethod(HttpServletResponse response, HttpServletRequest request, CommandMap map)
			throws Exception {

		int memberFindChk;
		
		ModelAndView mv=new ModelAndView();
		
		//String check_find = (String) map.getMap().get("check_find");
		String pwname = (String) map.getMap().get("pwname");
		String pwemail = (String) map.getMap().get("pwemail");
		String pwid = (String) map.getMap().get("pwid");
		String authNUm = "";
		String str = "";

		System.out.println("pw네임 :" + pwname + " pwemail:" + pwemail + " 아이디 : " + pwid);

		System.out.println("비밀번호 찾기 시작");

		map.getMap().put("EMAIL", pwemail);
		map.getMap().put("MEMBER_ID_FIND", pwid);
		map.getMap().put("MEMBER_NAME", pwname);
		String findEmail = loginService.findEmail(map.getMap());
		System.out.println("findEmail=" + findEmail);

		if (findEmail != null) {
			System.out.println("pwe메일 : " + pwemail + "find메일 : " + findEmail);
			if (pwemail.equals(findEmail)) {
				authNUm = RandomNum();// 랜덤숫자 String으로 넣고
				
				String encryptPassword = passwordEncoder.encode(authNUm);
				
				map.getMap().put("PASSWORD_CHANGE", encryptPassword);
				loginService.changePw(map.getMap()); // 랜덤숫자로 비밀번호 변경하고
				sendEmail(findEmail, authNUm); // 메일발송
				System.out.println("메일발송성공 변경된숫자 : " + authNUm);

			}
			mv.addObject("ID",map.get("pwid"));
			mv.addObject("authNUm", authNUm);
			mv.setViewName("findPwOk");
			return mv;
			
		} else{
			memberFindChk=0;
			mv.addObject("str", str);
			mv.addObject("memberFindChk",memberFindChk);
			mv.setViewName("findPwError");

			return mv;
		} 
	}
		
	
	private void sendEmail(String email,String authNum)throws Exception{ //메일을 보내는 메서드
		String host ="smtp.gmail.com";
		String subject = "Belireview 임시 비밀 번호";
		String fromName ="Belireview 관리자";
		String from="khiclass@gmail.com";//보내는메일
		String to1 = email;
		
		//String content = "새로운 비밀번호 : " + authNum;
		
		String content = "<div id = 'all' style='width: 600px; height: 500px; font-family: 나눔고딕;'>" +
				 "<div id='hd' style='background: #403e72; padding:30px 30px 30px;'>" +
				 "<font size='6' color='white'><b>BeilReview </b></font>"
				 + "<font size='4' color='white'> 계정</font></div>"
				 + "<div id='bodys' style='height: 250px; margin:40px 40px 5px 40px;'>"
				 + "<h2>빌리뷰 비밀번호 변경 안내입니다.</h2>"
				 + "<font size='2'>아래 임시 비밀번호로 로그인 후 비밀번호를 수정해주세요.</font><br><br><br>"
				 + "<hr size='2' noshade color='#D5D5D5'><div style='margin:30px 20px 30px 20px;'><font size='2'>임시 비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;<b>" 
				 + authNum + "</b></font></div><hr size='2' noshade color='#D5D5D5'>"
				 + "</div>"
				 + "<div id='ft' style='height: 3px; background: #EAEAEA;'></div>"
				 + "<div style='height: 100px; margin:20px 40px 0 40px ; background: white;'>"
				 + "<font color='#747474'><h4>본 메일은 발신전용입니다.<br>"
				 + "문의사항은 khiclass@gmail.com 로 문의부탁드립니다.<br>"
				 + "Copyright © Team.BeilReview</h4></font></div>"
				 + "<div id='ft' style='height: 30px; background: #EAEAEA; margin-top:-15px;'></div>"
				 + "</div>";
			
		try{
			Properties props = new Properties();
			
			props.put("mail.smtp,starttls.enable","true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host",host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props,new javax.mail.Authenticator(){
					@Override
					protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication("khiclass@gmail.com","khacademy");
			}
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B"))); //보내는사람설정
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			
			msg.setRecipients(Message.RecipientType.TO, address1); //받는사람설정1
			msg.setSubject(subject); //제목설정
			msg.setSentDate(new java.util.Date()); //보내는 날짜설정
			msg.setContent(content,"text/html;charset=utf-8"); //내용설정
			
			Transport.send(msg);
		}catch (MessagingException e) {
			e.printStackTrace();
		Exception ex = new Exception();
			throw ex;	
		}catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	
	
	public String RandomNum(){ //임의의 랜덤한 6자리숫자 뽑아줌 
		StringBuffer buffer = new StringBuffer();
		for(int i = 0;i<=6;i++){
			int n= (int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
}


