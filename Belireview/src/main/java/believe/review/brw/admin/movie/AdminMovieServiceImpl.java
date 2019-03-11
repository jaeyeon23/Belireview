package believe.review.brw.admin.movie;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminMovieService")
public class AdminMovieServiceImpl implements AdminMovieService{

	@Resource(name="adminMovieDAO")
	private AdminMovieDAO adminMovieDAO;
	
	@Override
	public List<Map<String, Object>> selectMovieList(Map<String, Object> map) throws Exception {
		return adminMovieDAO.selectMovieList(map);
	}

	@Override
	public int selectNextVal_movie() throws Exception {
		return adminMovieDAO.selectNextVal_movie();
	}

	@Override
	public void writeMovie(Map<String, Object> map) throws Exception {
		adminMovieDAO.writeMovie(map);
	}

	@Override
	public Map<String, Object> selectMovieOne(int no) throws Exception {
		return adminMovieDAO.selectMovieOne(no);
	}

	@Override
	public void updateMovieOne(Map<String, Object> map) throws Exception {
		adminMovieDAO.updateMovieOne(map);
	}

	@Override
	public int checkMovie(Map<String, Object> map) throws Exception {
		return adminMovieDAO.checkMovie(map);
	}

	@Override
	public void deleteMovieOne(Map<String, Object> map) throws Exception {
		adminMovieDAO.deleteMovieOne(map);
	}	
}
