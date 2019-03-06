package believe.review.brw.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {
	
	//회원가입
	public void insertMember(Map<String, Object> map) throws Exception {
		insert("member.insertMember", map);
	}
	
	
	 
}

