package believe.review.brw.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import believe.review.brw.user.UserDAO;
import believe.review.brw.common.util.FileUtils;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Resource(name="userDAO")
	private UserDAO userDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	
	@Override
	public void ModifyMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		userDAO.ModifyMember(map);
	}
	
	@Override
	public Map<String, Object> userGo(Map<String, Object> map) throws Exception {
		return userDAO.selectId(map);
	}
	
	//프로필사진수정
	@Override
	public void UserProfile(Map<String, Object> map, HttpServletRequest request) throws Exception {
		userDAO.UserProfile(map);
		
		Map<String,Object> list = fileUtils.parseInsertFileInfo(map, request);
			userDAO.UserProfile(list);
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
}






















