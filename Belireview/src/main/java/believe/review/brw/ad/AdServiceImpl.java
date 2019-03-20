package believe.review.brw.ad;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adService")
public class AdServiceImpl implements AdService{

	@Resource(name="adDAO")
	private AdDAO adDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList() throws Exception{
	return adDAO.selectBoardList();
}

	@Override
	public Map<String, Object> adDetail(Map<String, Object> map) throws Exception {
		return adDAO.adDetail(map);
	}

	@Override
	public List<Map<String, Object>> adCommentByRecent(Map<String, Object> map) throws Exception {
		return adDAO.adCommentByRecent(map);
	}

	@Override
	public List<Map<String, Object>> adCommentByLike(Map<String, Object> map) throws Exception {
		return adDAO.adCommentByLike(map);
	}

	@Override
	public int totalAdComment(Map<String, Object> map) throws Exception {
		return adDAO.totalAdComment(map);
	}

	@Override
	public Map<String, Object> myComment(Map<String, Object> map) throws Exception {
		return adDAO.myComment(map);
	}

	@Override
	public Map<String, Object> adCommentLike(Map<String, Object> map) throws Exception {
		return adDAO.adCommentLike(map);
	}
	
	
	
	
	
}
