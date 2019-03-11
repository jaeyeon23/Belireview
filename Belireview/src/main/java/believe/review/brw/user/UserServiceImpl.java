package believe.review.brw.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Resource(name="userDAO")
	private UserDAO userDAO;

	@Override
	public List<Map<String, Object>> UserMovieByRecent(Map<String, Object> map) throws Exception {
		return userDAO.UserMovieByRecent(map);
	}

	@Override
	public List<Map<String, Object>> UserMovieAll(Map<String, Object> map) throws Exception {
		return userDAO.UserMovieAll(map);
	}
	
	
	

}
