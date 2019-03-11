package believe.review.brw.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("UserService")
public class UserServiceImpl implements UserService{
	
	@Resource(name="UserDAO")
	private UserDAO userDAO;

	@Override
	public List<Map<String, Object>> UserMovieByRecent(Map<String, Object> map) throws Exception {
		return userDAO.UserMovieByRecent(map);
	}
	
	

}
