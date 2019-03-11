package believe.review.brw.admin.user;

import java.util.Map;
import java.util.List;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("adminUserDAO")
public class AdminUserDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectUserList(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("admin.selectUserList", map);
	}
	
	public int checkUser(Map<String, Object> map) {
		return (Integer) selectOne("admin.checkUser", map);
	}

	public String selectUserOne_profile(String id){
		return (String) selectOne("admin.selectUserOne_profile", id);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectUserOne(String str){
		return (Map<String, Object>) selectOne("admin.selectUserOne", str);
	}
	
	public void updateUserOne(Map<String, Object> map) {
		update("admin.updateUserOne", map);
	}
	
	public void updateUserOne_profile(Map<String, Object> map) {
		update("admin.updateUserOne_profile", map);
	}
	
	public void deleteUserOne(Map<String, Object> map) {
		delete("admin.deleteUserOne", map);
	}
}
