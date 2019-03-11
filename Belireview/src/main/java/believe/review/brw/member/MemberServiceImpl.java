package believe.review.brw.member;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;

	@Override
	public void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		memberDAO.insertMember(map);
	}

	@Override
	public int checkId(String mem_id) throws Exception {
		return memberDAO.checkId(mem_id);
	}

	@Override
	public int checkMember(Map<String, Object> map) throws Exception {
		return memberDAO.checkMember(map);
	}

	// 관리자
	@Override
	public int checkAdminSessionPw(Map<String, Object> map) throws Exception {
		return memberDAO.checkAdminSessionPw(map);
	}
}
