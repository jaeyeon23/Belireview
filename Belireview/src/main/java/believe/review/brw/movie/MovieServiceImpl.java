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
	public List<Map<String, Object>> selectBoardList() throws Exception{
		return movieDAO.selectBoardList();
		
	}

}
