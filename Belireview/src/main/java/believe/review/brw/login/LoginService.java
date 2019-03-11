package believe.review.brw.login;

import java.util.Map;

public interface LoginService {

	
	// 로그인 하기
	Map<String, Object> loginGo(Map<String, Object> map) throws Exception;
	
	//아이디찾기
	Map<String,Object> findId(Map<String,Object> map)throws Exception;
	
	//비밀번호 바꾸기
	void changePw(Map<String, Object> map) throws Exception;

	String findEmail(Map<String, Object> map) throws Exception;
	
	
	/*String checkMember(Map<String, Object> map)throws Exception;*/

	
/*	String findId(Map<String, Object> map) throws Exception;*/

/*	//비밀번호 찾기
	void findPasswd(Map<String, Object> map) throws Exception;*/
	
	
/*	Map<String, Object> loginMember(Map<String,Object> map)throws Exception;
	*/
/*	Map<String,Object> searchId(Map<String,Object> map)throws Exception;
	
	Map<String,Object> searchPw(Map<String,Object> map)throws Exception;
	*/
	
	
}

