package believe.review.brw.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
	@Override
	public List<Map<String, Object>> dramaListTop8() throws Exception {
		return mainDAO.dramaListTop8();
	}
	@Resource(name="mainDAO")
	private MainDAO mainDAO;

	@Override
	public List<Map<String, Object>> mainSerach(Map<String, Object> map) throws Exception {
		return mainDAO.mainSerach(map);
	}
	
	public List<Map<String, Object>> movieSerach(Map<String, Object> map) throws Exception {
		return mainDAO.movieSerach(map);
	}
	
	public List<Map<String, Object>> dramaSerach(Map<String, Object> map) throws Exception {
		return mainDAO.dramaSerach(map);
	}
	
	public List<Map<String, Object>> adSerach(Map<String, Object> map) throws Exception {
		return mainDAO.adSerach(map);

	}

	@Override
	public List<Map<String, Object>> movieListTop8() throws Exception {
		return mainDAO.movieListTop8();
	}

	@Override
	public List<Map<String, Object>> adListTop8() throws Exception {
		return mainDAO.adListTop8();
	}
}
