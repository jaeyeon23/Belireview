package believe.review.brw.common.interceptor;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");
		int admin;
		
		if(id == null || id.trim().length() <= 0 || id == "") {
			response.sendRedirect("/brw/member/loginForm.br");
			
			return false;
		}else {
			String uri = request.getRequestURI();
			admin = ((BigDecimal)session.getAttribute("ADMIN")).intValue();
			if(uri.contains("admin")) {
				if(admin == 0) {
					response.sendRedirect("/brw/main.br");
					
					return false;
				}
			}
			if(uri.contains("user")) {
				response.sendRedirect(uri);
			}
			
		}

		return true;
	}
}
