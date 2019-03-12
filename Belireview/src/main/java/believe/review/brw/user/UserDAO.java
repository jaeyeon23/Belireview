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
	public List<Map<String, Object>> UserMovieAll(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("user.UserMovieAll",map);
	}
	/*보고싶어요*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> userWishList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("user.userWishList", map);
	}
	public void insertWishList(Map<String, Object> map) throws Exception {
		insert("user.insertWishList", map);
	}
	public void updateWishList(Map<String, Object> map) throws Exception {
		update("user.updateWishList", map);
	}
	/*보고싶어요*/
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectUserGrade(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("user.selectUserGrade",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> userDramaList(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("user.userDramaList",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> userMovieList(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("user.userMovieList",map);
	}
}
