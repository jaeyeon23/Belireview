package believe.review.brw.admin.movie;

import java.util.List;
import java.util.Map;

public interface AdminMovieService {

	public List<Map<String, Object>> selectMovieList(Map<String, Object> map) throws Exception;
	
	public int selectNextVal_movie() throws Exception;
	
	public void writeMovie(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectMovieOne(int no) throws Exception;
	
	public void updateMovieOne(Map<String, Object> map) throws Exception;
	
	public int checkMovie(Map<String, Object> map) throws Exception;
	
	public void deleteMovieOne(Map<String, Object> map) throws Exception;
}
