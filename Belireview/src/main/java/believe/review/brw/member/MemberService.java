package believe.review.brw.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {
	
	//ȸ������
	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	
	
}
