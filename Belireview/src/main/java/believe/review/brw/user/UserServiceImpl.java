package believe.review.brw.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import believe.review.brw.user.UserDAO;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Resource(name="userDAO")
	private UserDAO userDAO;

	
	@Override
	public void ModifyMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		userDAO.ModifyMember(map);
	}
	
	@Override
	public Map<String, Object> userGo(Map<String, Object> map) throws Exception {
		return userDAO.selectId(map);
	}

	@Override
	public List<Map<String, Object>> UserMovieAll(Map<String, Object> map) throws Exception {
		return userDAO.UserMovieAll(map);
	}
	/*보고싶어요*/
	@Override
	public Map<String, Object> userWishList(Map<String, Object> map) throws Exception {
		return userDAO.userWishList(map);
	}
	@Override
	public void insertWishList(Map<String, Object> map) throws Exception {
		userDAO.insertWishList(map);
	}
	@Override
	public void updateWishList(Map<String, Object> map) throws Exception {
		userDAO.updateWishList(map);
	}
	/*보고싶어요*/

	@Override
	public List<Map<String, Object>> selectUserGrade(Map<String, Object> map) throws Exception {
		return userDAO.selectUserGrade(map);
	}

	@Override
	public List<Map<String, Object>> userDramaList(Map<String, Object> map) throws Exception {
		return userDAO.userDramaList(map);
	}
	
	@Override
	public List<Map<String, Object>> userMovieList(Map<String, Object> map) throws Exception {
		return userDAO.userMovieList(map);
	}
	
	
	
}






















