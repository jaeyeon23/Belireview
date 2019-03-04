package believe.review.brw.login;

import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements LoginService{

	@Resource(name="loginDao")
	private LoginDao loginDao;
	
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
