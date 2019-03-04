/*package believe.review.brw.login;

import java.util.Map;
import org.springframework.stereotype.Repository;
import believe.review.brw.common.AbstractDAO;

@Repository("loginDao")
public class LoginDao extends AbstractDAO{

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