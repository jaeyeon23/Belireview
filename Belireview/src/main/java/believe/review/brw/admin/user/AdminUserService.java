package believe.review.brw.admin.user;

import java.util.List;
import java.util.Map;

public interface AdminUserService {

	public List<Map<String, Object>> selectUserList(Map<String, Object> map) throws Exception;
	
	public int checkUser(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectUserOne(String str) throws Exception;
	
	public String selectUserOne_profile(String id) throws Exception;
	
	public void updateUserOne_profile(Map<String, Object> map) throws Exception;
	
	public void updateUserOne(Map<String, Object> map) throws Exception;
	
	public void deleteUserOne(Map<String, Object> map) throws Exception;
}
