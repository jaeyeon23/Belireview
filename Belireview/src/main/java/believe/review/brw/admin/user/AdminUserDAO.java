package believe.review.brw.admin.user;

import java.util.Map;
import java.util.List;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("adminUserDAO")
public class AdminUserDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectUserList(){
		return (List<Map<String, Object>>) selectList("admin.selectUserList");
	}
	
	public int checkUser(Map<String, Object> map) {
		return (Integer) selectOne("admin.checkUser", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectUserOne(String str){
		return (Map<String, Object>) selectOne("admin.selectUserOne", str);
	}
	
	public void updateUserOne(Map<String, Object> map) {
		update("admin.updateUserOne", map);
	}
	
	public void deleteUserOne(Map<String, Object> map) {
		delete("admin.deleteUserOne", map);
	}
}
