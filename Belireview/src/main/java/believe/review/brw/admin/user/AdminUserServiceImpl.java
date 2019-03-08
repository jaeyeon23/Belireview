package believe.review.brw.admin.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("adminUserService")
public class AdminUserServiceImpl implements AdminUserService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminUserDAO")
	private AdminUserDAO adminUserDAO;

	@Override
	public List<Map<String, Object>> selectUserList(Map<String, Object> map) throws Exception {
		return adminUserDAO.selectUserList(map);
	}

	@Override
	public int checkUser(Map<String, Object> map) throws Exception {
		return adminUserDAO.checkUser(map);
	}

	@Override
	public String selectUserOne_profile(String id) throws Exception {
		return adminUserDAO.selectUserOne_profile(id);
	}

	@Override
	public Map<String, Object> selectUserOne(String str) throws Exception {
		return adminUserDAO.selectUserOne(str);
	}

	@Override
	public void updateUserOne_profile(Map<String, Object> map) throws Exception {
		adminUserDAO.updateUserOne_profile(map);
	}

	@Override
	public void updateUserOne(Map<String, Object> map) throws Exception {
		adminUserDAO.updateUserOne(map);
	}

	@Override
	public void deleteUserOne(Map<String, Object> map) throws Exception {
		adminUserDAO.deleteUserOne(map);
	}
}
