package believe.review.brw.login;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
/*import believe.review.brw.common.CommandMap;*/

@Service("loginService")
public class LoginServiceImpl implements LoginService{

	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	
	@Override
	public Map<String, Object> loginGo(Map<String, Object> map) throws Exception {
		return loginDAO.selectId(map);
	}
	
	//아이디 찾기
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {
		return loginDAO.findId(map);
	}
	
	//비밀번호 바꾸기
	public void changePw(Map<String, Object> map) throws Exception 
	{
		loginDAO.changePw(map);
	}
	
	@Override //아이디에 맞는 이메일불러오기
	public String findEmail(Map<String, Object> map) throws Exception {
		return loginDAO.findEmail(map);
	}
	

}
