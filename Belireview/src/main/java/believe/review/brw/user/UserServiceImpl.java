package believe.review.brw.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import believe.review.brw.user.UserDAO;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Resource(name = "userDAO") private UserDAO userDAO;
	
	
	@Override
	public void ModifyMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		userDAO.ModifyMember(map);
	}
	
	@Override
	public Map<String, Object> userGo(Map<String, Object> map) throws Exception {
		return userDAO.selectId(map);
	}

}






















