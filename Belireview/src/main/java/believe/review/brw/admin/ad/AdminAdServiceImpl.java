package believe.review.brw.admin.ad;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("adminAdService")
public class AdminAdServiceImpl implements AdminAdService{

	@Resource(name="adminAdDAO")
	private AdminAdDAO adminAdDAO;
	
	@Override
	public List<Map<String, Object>> selectAdList(Map<String, Object> map) throws Exception {
		return adminAdDAO.selectAdList(map);
	}

	@Override
	public int selectNextVal_ad() throws Exception {
		return adminAdDAO.selectNextVal_ad();
	}

	@Override
	public void writeAd(Map<String, Object> map) throws Exception {
		adminAdDAO.writeAd(map);
	}

	@Override
	public Map<String, Object> selectAdOne(int no) throws Exception {
		return adminAdDAO.selectAdOne(no);
	}

	@Override
	public void updateAdOne(Map<String, Object> map) throws Exception {
		adminAdDAO.updateAdOne(map);
	}

	@Override
	public int checkAd(Map<String, Object> map) throws Exception {
		return adminAdDAO.checkAd(map);
	}

	@Transactional
	@Override
	public void deleteAdOne(Map<String, Object> map) throws Exception {
		adminAdDAO.deleteAdLikeOne(map);
		adminAdDAO.deleteAdCommentOne(map);
		adminAdDAO.deleteAdOne(map);
	}
}


