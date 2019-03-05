package believe.review.brw.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {
	
	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
	/*
	 * Map<String, Object> getMember(Map<String, Object> map) throws Exception;
	 * 
	 * Map<String, Object> IdCheck(Map<String, Object> map) throws Exception;
	 * 
	 */
}
