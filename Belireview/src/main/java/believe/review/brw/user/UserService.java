package believe.review.brw.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface UserService {
	//회원정보 변경
	void ModifyMember(Map<String, Object> memberMap, HttpServletRequest request)throws Exception;
	
	// 수정된 회원정보 불러오기
	Map<String, Object> userGo(Map<String, Object> map) throws Exception;
	
	List<Map<String,Object>> UserMovieByRecent(Map<String, Object>  map) throws Exception;
	
	List<Map<String,Object>> UserMovieAll(Map<String, Object>  map) throws Exception;
		
}
