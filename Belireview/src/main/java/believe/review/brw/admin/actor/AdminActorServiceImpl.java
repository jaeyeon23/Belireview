package believe.review.brw.admin.actor;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminActorService")
public class AdminActorServiceImpl implements AdminActorService{

	@Resource(name="adminActorDAO")
	private AdminActorDAO adminActorDAO;

	@Override
	public List<Map<String, Object>> selectActorList(Map<String, Object> map) throws Exception {
		return adminActorDAO.selectActorList(map);
	}

	@Override
	public Map<String, Object> selectActorOne(String no) throws Exception {
		return adminActorDAO.selectActorOne(no);
	}

	@Override
	public List<Map<String, Object>> selectActorDrama(String searchValue) throws Exception {
		return adminActorDAO.selectActorDrama(searchValue);
	}

	@Override
	public List<Map<String, Object>> selectActorMovie(String searchValue) throws Exception {
		return adminActorDAO.selectActorMovie(searchValue);
	}

	@Override
	public void insertActor(Map<String, Object> map) throws Exception {
		adminActorDAO.insertActor(map);
	}

	@Override
	public void updateActorOne(Map<String, Object> map) throws Exception {
		adminActorDAO.updateActorOne(map);
	}

	@Override
	public void deleteActorOne(String no) throws Exception {
		adminActorDAO.deleteActorOne(no);
	}

	@Override
	public List<Map<String, Object>> selectActorAjax(String searchValue) throws Exception {
		return adminActorDAO.selectActorAjax(searchValue);
	}

	@Override
	public List<Map<String, Object>> selectActorDramaModify(String no) throws Exception {
		return adminActorDAO.selectActorDramaModify(no);
	}

	@Override
	public List<Map<String, Object>> selectActorMovieModify(String no) throws Exception {
		return adminActorDAO.selectActorMovieModify(no);
	}
}
