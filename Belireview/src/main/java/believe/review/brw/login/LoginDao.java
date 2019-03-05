/*package believe.review.brw.login;

import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{
	
	// 로그인 정보 불러오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.loginGo", map);
	}
	// 아이디 찾기
	public String findId(Map<String, Object> map) throws Exception {
		return (String) selectOne("member.findId", map);
	}
	//비밀번호 찾기변경
	public void findPasswd(Map<String, Object> map) throws Exception
	{
		update("member.findPasswd", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> loginMember(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("member.selectOneMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneMember(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		return (Map<String,Object>) selectOne("member.selectOneMember",map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> searchId(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		return (Map<String,Object>) selectOne("member.serachId",map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> searchPw(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		return (Map<String,Object>) selectOne("member.searchPw",map);
	}

	

}
*/