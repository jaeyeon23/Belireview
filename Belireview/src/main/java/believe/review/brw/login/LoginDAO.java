package believe.review.brw.login;

import java.util.Map;

import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import believe.review.brw.common.common.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 로그인 정보 불러오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.loginGo", map);
	}
	// 아이디 찾기
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.findId", map);
	}

	//비밀번호 찾기
	public void changePw(Map<String, Object> map)throws Exception {
		sqlSession.update("member.changePw",map);
	}
	
/*	@SuppressWarnings("unchecked")
	public Map<String, Object> loginMember(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("member.selectOneMember", map);
	}
	*/
/*	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneMember(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		return (Map<String,Object>) selectOne("member.selectOneMember",map);
	}*/

	/*@SuppressWarnings("unchecked")
	public Map<String, Object> searchId(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		return (Map<String,Object>) selectOne("member.serachId",map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> searchPw(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		return (Map<String,Object>) selectOne("member.searchPw",map);
	}*/

	

}
