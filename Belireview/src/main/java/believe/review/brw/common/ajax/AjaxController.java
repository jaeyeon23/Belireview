package believe.review.brw.common.ajax;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import believe.review.brw.admin.actor.AdminActorService;
import believe.review.brw.admin.user.AdminUserService;
import believe.review.brw.main.MainService;

@Controller
public class AjaxController {

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Resource(name="adminUserService")
	private AdminUserService adminUserService;
	
	@Resource(name="adminActorService")
	private AdminActorService adminActorService;
	
	@Resource(name="mainService")
	private MainService mainService; 
	
	@RequestMapping(value="/auto.br", method=RequestMethod.GET)
	public void auto(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String searchValue = request.getParameter("searchValue");
		List<Map<String, Object>> list = mainService.searchRelation(searchValue);
		int i = 0;
		
		JSONArray array = new JSONArray();
		JSONObject obj = null;
		
		while(i < 10 && i < list.size()) {
			obj = new JSONObject();
			obj.put("data", list.get(i).get("NAME"));
			array.put(obj);
			i++;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(array);
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value="/ajaxDelete.br", method=RequestMethod.POST)
	@ResponseBody
	public Boolean ajaxDelete(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		String password = request.getParameter("password");
		Map<String, Object> member = adminUserService.selectUserOne((String)session.getAttribute("ID"));
		String user_pw = (String)member.get("PASSWORD");
		Boolean check_pw = false;
		
		System.out.println("password : " + password + "\tuser_pw : " + user_pw);
		
		if(passwordEncoder.matches(password, user_pw)) {
			check_pw = true;
		}else {
			check_pw = false;
		}
		
		return check_pw;
	}
	
	@RequestMapping(value="/ajaxActorWriteDrama.br", method=RequestMethod.GET)
	public void ajaxActorWriteDrama(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String searchValue = request.getParameter("searchValue");
		List<Map<String, Object>> list = adminActorService.selectActorDrama(searchValue);
		int i = 0;
		
		JSONArray array = new JSONArray();
		JSONObject obj = null;
		
		while(i < 10 && i < list.size()) {
			obj = new JSONObject();
			obj.put("name", list.get(i).get("NAME"));
			obj.put("no", list.get(i).get("NO"));
			array.put(obj);
			i++;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(array);
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value="/ajaxActorWriteMovie.br", method=RequestMethod.GET)
	public void ajaxActorWriteMovie(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String searchValue = request.getParameter("searchValue");
		List<Map<String, Object>> list = adminActorService.selectActorMovie(searchValue);
		int i = 0;
		
		JSONArray array = new JSONArray();
		JSONObject obj = null;
		
		while(i < 10 && i < list.size()) {
			obj = new JSONObject();
			obj.put("name", list.get(i).get("NAME"));
			obj.put("no", list.get(i).get("NO"));
			array.put(obj);
			i++;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(array);
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value="/ajaxActorWrite.br", method=RequestMethod.GET)
	public void ajaxActorWrite(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String searchValue = request.getParameter("searchValue");
		List<Map<String, Object>> list = adminActorService.selectActorAjax(searchValue);
		int i = 0;
		
		JSONArray array = new JSONArray();
		JSONObject obj = null;
		
		while(i < 10 && i < list.size()) {
			obj = new JSONObject();
			obj.put("name", list.get(i).get("ACTOR_NAME"));
			obj.put("no", list.get(i).get("ACTOR_NO"));
			array.put(obj);
			i++;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(array);
		pw.flush();
		pw.close();
	}
}
