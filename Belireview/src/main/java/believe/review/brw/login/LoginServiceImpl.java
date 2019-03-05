/*package believe.review.brw.login;

import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import believe.review.brw.common.CommandMap;

@Service("loginService")
public class LoginServiceImpl implements LoginService{

	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	
	@Override
	public Map<String, Object> loginGo(Map<String, Object> map) throws Exception {
		return loginDAO.selectId(map);
	}
	
	//아이디 찾기
	public String findId(Map<String, Object> map) throws Exception {
		return loginDao.findId(map);
	}
	
	//비밀번호 찾기
	public void findPasswd(Map<String, Object> map) throws Exception 
	{
		loginDao.findPasswd(map);
	}
	
	@Override
	public Map<String, Object> loginMember(Map<String,Object>map)throws Exception{
		Map<String,Object> tempMap=loginDao.loginMember(map);
		return tempMap;
		
	}
	@Override
	public Map<String,Object> loginMember(Map<String,Object> map)throws Exception{
		return loginDao.selectOneMember(map);
	}

	@Override
	public Map<String, Object> searchId(Map<String, Object> map) throws Exception {
		return loginDao.searchId(map);
	}

	@Override
	public Map<String, Object> searchPw(Map<String, Object> map) throws Exception {
		return loginDao.searchPw(map);
	}
	
}
*/