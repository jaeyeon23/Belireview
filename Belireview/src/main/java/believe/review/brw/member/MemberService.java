package believe.review.brw.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {
	
	//ȸ������
	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	//ȸ������ ID�ߺ�üũ
	int checkId(String mem_id)throws Exception;
	
	//�̸������翩��
	int checkMember(Map<String, Object> map)throws Exception;
	
	//관리자
	public int checkAdminSessionPw(Map<String, Object> map) throws Exception;
}
