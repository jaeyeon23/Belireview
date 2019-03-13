package believe.review.brw.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<Map<String, Object>> UserMovieByRecent(Map<String, Object> map) throws Exception {
		return userDAO.UserMovieByRecent(map);
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
	
	
	@Transactional
	@Override
	public void deleteUserOne(Map<String, Object> map) throws Exception {
		userDAO.deleteMyPage(map);
		userDAO.deleteAdLike(map);
		userDAO.deleteAdComment(map);
		userDAO.deleteDramaLike(map);
		userDAO.deleteDramaComment(map);
		userDAO.deleteMovieLike(map);
		userDAO.deleteMovieComment(map);
		userDAO.deleteUserOne(map);
	}

}






















