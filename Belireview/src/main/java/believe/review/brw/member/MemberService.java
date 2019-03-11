package believe.review.brw.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {
	

	//회원가입
	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	//회원가입 ID중복체크
	int checkId(String mem_id)throws Exception;
	
	//이메일존재여부
	int checkMember(Map<String, Object> map)throws Exception;
	
	//관리자
	public int checkAdminSessionPw(Map<String, Object> map) throws Exception;
}
