package believe.review.brw.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {
	
	//회원가입
	public void insertMember(Map<String, Object> map) throws Exception {
		insert("member.insertMember", map);
	}
	
	//아이디체크
	public int checkId(String mem_id) throws Exception {
		return (Integer)selectOne("member.checkId", mem_id);
	}
	
	//이메일존재여부체크
	public int checkMember(Map<String, Object> map)throws Exception{
		return selectMemberId("member.checkMember",map);
	}
		
	 
}
