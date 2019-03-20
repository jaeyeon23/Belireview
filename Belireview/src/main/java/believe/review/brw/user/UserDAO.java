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
	// 프로필사진수정
	public void UserProfile(Map<String, Object> map) throws Exception {
		update("user.UserProfile", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> UserMovieAll(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("user.UserMovieAll",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> UserDramaAll(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("user.UserDramaAll",map);
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
	public List<Map<String, Object>> selectDUserGrade(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("user.selectDUserGrade",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> userDramaList(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("user.userDramaList",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> userMovieList(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("user.userMovieList",map);
	}
/*	@SuppressWarnings("unchecked")
	public Map<String, Object> checkPwd(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("user.checkPwd", map);
	}*/
	
/*	@SuppressWarnings("unchecked")
	public void deleteMember(Map<String, Object> map) throws Exception {
		update("user.deleteMember", map);
	}*/
	
	/*회원탈퇴 삭제하기*/
	
	public void deleteUserOne(Map<String, Object> map) {
		delete("user.deleteUserOne", map);
	}
	
	public void deleteMyPage(Map<String, Object> map) {
		delete("user.deleteMyPage", map);
	}
	
	public void deleteAdLike(Map<String, Object> map) {
		delete("user.deleteAdLike", map);
	}
	
	public void deleteAdComment(Map<String, Object> map) {
		delete("user.deleteAdComment", map);
	}
	
	public void deleteDramaLike(Map<String, Object> map) {
		delete("user.deleteDramaLike", map);
	}
	
	public void deleteDramaComment(Map<String, Object> map) {
		delete("user.deleteDramaComment", map);
	}
	
	public void deleteMovieLike(Map<String, Object> map) {
		delete("user.deleteMovieLike", map);
	}
	
	public void deleteMovieComment(Map<String, Object> map) {
		delete("user.deleteMovieComment", map);
	}
}
