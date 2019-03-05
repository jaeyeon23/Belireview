package believe.review.brw.member;

import java.util.Map;

import javax.annotation.Resource;

/*
import javax.servlet.http.HttpServletRequest;
import org.mybatis.spring.SqlSessionTemplate;
*/
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	/*
	 * @Resource(name = "memberDAO") private MemberDAO memberDAO;
	 */

	@Override
	public void insertMember(Map<String, Object> map) throws Exception {
		//memberDAO.insertMember(map);		
	}

	/*
	 * @Override public Map<String, Object> getMember(Map<String, Object> map)
	 * throws Exception { // TODO Auto-generated method stub return null; }
	 * 
	 * @Override public Map<String, Object> IdCheck(Map<String, Object> map) throws
	 * Exception { // TODO Auto-generated method stub return null; }
	 */



}
