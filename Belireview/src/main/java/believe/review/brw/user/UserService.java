package believe.review.brw.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface UserService {
	//회원정보 변경
	void ModifyMember(Map<String, Object> memberMap, HttpServletRequest request)throws Exception;
	
	// 수정된 회원정보 불러오기
	Map<String, Object> userGo(Map<String, Object> map) throws Exception;
	// 프로필사진수정
	void UserProfile(Map<String, Object> memberMap, HttpServletRequest request)throws Exception;
	
	List<Map<String,Object>> UserMovieAll(Map<String, Object>  map) throws Exception;
	
    List<Map<String, Object>> UserDramaAll(Map<String, Object>  map) throws Exception;
	
	/*보고싶어요*/
	Map<String, Object> userWishList(Map<String, Object> map) throws Exception;
	
	void insertWishList(Map<String, Object> map) throws Exception;
	
	void updateWishList(Map<String, Object> map) throws Exception;
	/*보고싶어요*/
	
	List<Map<String,Object>> selectUserGrade(Map<String, Object>  map) throws Exception;
	
	List<Map<String,Object>> selectDUserGrade(Map<String, Object>  map) throws Exception;
	
	List<Map<String,Object>> userDramaList(Map<String, Object>  map) throws Exception;
	
	List<Map<String,Object>> userMovieList(Map<String, Object>  map) throws Exception;
		
	//Map<String, Object> myinfoDetail(Map<String, Object> map) throws Exception;

	void deleteUserOne(Map<String, Object> map) throws Exception;
	
}
