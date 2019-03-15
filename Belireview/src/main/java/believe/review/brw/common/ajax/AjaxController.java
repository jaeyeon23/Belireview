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

import believe.review.brw.main.MainService;

@Controller
public class AjaxController {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Resource(name="mainService")
	private MainService mainService; 
	
	@RequestMapping(value="/auto.br", method=RequestMethod.GET)
	public void auto(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String searchValue = request.getParameter("searchValue");
		List<Map<String, Object>> dramalist = mainService.searchDramaRelation(searchValue);
		List<Map<String, Object>> movielist = mainService.searchMovieRelation(searchValue);
		List<Map<String, Object>> adlist = mainService.searchAdRelation(searchValue);
		
		JSONArray array = new JSONArray();
		JSONObject obj = null;
		
		for(Map<String, Object> map : dramalist) {
			obj = new JSONObject();
			obj.put("data", map.get("DRAMA_NAME"));
			array.put(obj);
		}
		
		for(Map<String, Object> map : movielist) {
			obj = new JSONObject();
			obj.put("data", map.get("MOVIE_NAME"));
			array.put(obj);
		}
		
		for(Map<String, Object> map : adlist) {
			obj = new JSONObject();
			obj.put("data", map.get("AD_NAME"));
			array.put(obj);
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
		String user_pw = (String) session.getAttribute("PASSWORD");
		Boolean check_pw = false;
		
		if(passwordEncoder.matches(password, user_pw)) {
			check_pw = true;
		}else {
			check_pw = false;
		}
		
		return check_pw;
	}
}
