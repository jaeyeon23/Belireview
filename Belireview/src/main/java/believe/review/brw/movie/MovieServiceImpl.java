package believe.review.brw.movie;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("movieService")
public class MovieServiceImpl implements MovieService{
	
	@Resource(name="movieDAO")
	private MovieDAO movieDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object>  map) throws Exception {
		return movieDAO.selectBoardList(map);
	}

	@Override
	public List<Map<String, Object>> movieCommentByRecent(Map<String, Object> map) throws Exception {
		return movieDAO.movieCommentByRecent(map);
	}

	@Override
	public List<Map<String, Object>> movieCommentByLike(Map<String, Object> map) throws Exception {
		return movieDAO.movieCommentByLike(map);
	}
	
	

}
