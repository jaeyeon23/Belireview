package believe.review.brw.user;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO {
	//회원정보수정
	public void ModifyMember(Map<String, Object> map) throws Exception {
		update("user.changeUser", map);
	}
	// 수정된 회원 정보 불러오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("user.UserGo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> UserMovieByRecent(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("user.UserMovieByRecent",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> UserMovieAll(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("user.UserMovieAll",map);
	}
}
