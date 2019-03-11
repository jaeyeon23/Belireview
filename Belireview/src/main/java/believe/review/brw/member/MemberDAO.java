package believe.review.brw.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {
	
	//ȸ������
	public void insertMember(Map<String, Object> map) throws Exception {
		insert("member.insertMember", map);
	}
	
	//���̵�üũ
	public int checkId(String mem_id) throws Exception {
		return (Integer)selectOne("member.checkId", mem_id);
	}
	
	//�̸������翩��üũ
	public int checkMember(Map<String, Object> map)throws Exception{
		return selectMemberId("member.checkMember",map);
	}
		
	
	
	//관리자
	public int checkAdminSessionPw(Map<String, Object> map) throws Exception{
		return (Integer) selectOne("member.checkAdminSessionPw", map);
	}
}

