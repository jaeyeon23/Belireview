package believe.review.brw.member;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
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
	String Email = "";
	String authNUm = "";
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping(value="/joinTerms")  //step1 �������
	public ModelAndView joinTerms(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("joinTerms");
		return mv;
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)    //step2 �����Է�
	public ModelAndView joinForm(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("join");
		
		mv.addObject("email_marketing", request.getParameter("termsEmail"));
		mv.addObject("sms_marketing", request.getParameter("termsLocation"));
		
		
		return mv;
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST) //step3 ���ԿϷ�
	public ModelAndView join(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();
		
		Map<String, Object> memberMap = new HashMap<String, Object>();
		
		memberMap = commandMap.getMap();
		
		memberService.insertMember(memberMap, request);
		
		mv.setViewName("joinComplete");
		
		mv.addObject("NAME",commandMap.get("name"));
		return mv;
	}
	
	//���̵��ߺ�����üũ
	@RequestMapping(value="/checkId")
	@ResponseBody
	public void checkId(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap) throws Exception{
		PrintWriter out = response.getWriter(); //�ڹٿ��� ������  �����͸� ������ֱ� ���� ���
		String paramId= (request.getParameter("id") == null)?"":String.valueOf(request.getParameter("id"));
		int checkId = memberService.checkId(paramId); //MODA������ joinService.chekcId�� �Ǿ��ִ�.
		System.out.println("���̵����� : "+paramId);
		System.out.println("�ߺ�Ȯ�� ��� : "+checkId);
		out.print(checkId);
		out.flush();
		out.close();
	}

	
	//�̸��� �����ޱ��� ����!
	@RequestMapping(value="/email_auth") //�̸��� �����ޱ⸦ ������ �ڹٽ�ũ��Ʈ���� �̸��ϰ� ������  ����
	public ModelAndView email_auth(HttpServletResponse response, HttpServletRequest request,CommandMap Map)throws Exception{
		
		Email = (String) Map.getMap().get("email"); //���� ���� : �̸��� ������ ��ȿ���� ����
		String email = (String) Map.getMap().get("email");
		System.out.println("email = " + email);
		Map.getMap().put("email", email); //Map�� DB�÷������� �̸��� ������ �� �ٽ� Map�� �������
		
		int checkNum = memberService.checkMember(Map.getMap());
		System.out.println("checkNum="+checkNum);
		//System.out.println("mode"+Map.getMap().get("mode"));
		
		if(checkNum==0)
		{
		authNUm = RandomNum(); //�̸��Ϸ� �߼۵Ǵ� ������ȣ
		sendEmail(email.toString(),authNUm);
		System.out.println("���Ϻ���");
		}
		String checkNumString=String.valueOf(checkNum);
		PrintWriter writer =response.getWriter(); //�ڹٿ��� ������ ������ ���� script���� ��� data�� ��
		writer.write(checkNumString);
		writer.flush();
		writer.close();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("email",email); //�̸���
		mv.addObject("authNum", authNUm); //������ȣ
		mv.setViewName("join");
		
		System.out.println("�����"+authNUm);
		return mv;
	}
	
	 @RequestMapping(value="/email_auth_success", method=RequestMethod.POST)
	    public @ResponseBody int clickMethod (HttpServletRequest request,CommandMap Map) throws Exception   {
	        
	    	String MapEmail =(String)Map.getMap().get("email");  /*input������ �޾ƿ� �̸��ϰ� ������ȣ��*/
	    	String MapAuth = (String)Map.getMap().get("auth");
	    	System.out.println("mapEmail : "+MapEmail);
	    	System.out.println("mapAuth : "+MapAuth);
	    	String email = Email;   
	        String str = authNUm;
	        int sss = 0;
	        
	    	if(MapEmail.equals(email) && MapAuth.equals(authNUm)) {
	    		sss = 1;
	    	}
	    	else {
	    		sss = 0;
	    	}
	    	
	         System.out.println("authNUm����?"+authNUm);
	        return sss;
	    }

	private void sendEmail(String email,String authNum)throws Exception{ //������ ������ �޼���
		String host ="smtp.gmail.com";
		String subject = "������ ȸ������ ������ȣ";    //����
		String fromName ="������ ��";                  //�����»���̸�
		String from="khiclass@gmail.com";//�����¸���
		String to1 = email;
		
		String content = "������ȣ : " + authNum;  //����
		
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
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B"))); //�����»������
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			
			msg.setRecipients(Message.RecipientType.TO, address1); //�޴»������1
			msg.setSubject(subject); //������
			msg.setSentDate(new java.util.Date()); //������ ��¥����
			msg.setContent(content,"text/html;charset=utf-8"); //���뼳��
			
			Transport.send(msg);
		}catch (MessagingException e) {
			e.printStackTrace();
		Exception ex = new Exception();
			throw ex;	
		}catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	
	
	public String RandomNum(){ //������ ������ 6�ڸ����� �̾��� 
		StringBuffer buffer = new StringBuffer();
		for(int i = 0;i<=6;i++){
			int n= (int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	//�̸������� �߰� �������
}

























