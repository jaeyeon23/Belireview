package believe.review.brw.user;

import java.util.List;
import java.util.Map;

public interface UserService {
	
	List<Map<String,Object>> UserMovieByRecent(Map<String, Object>  map) throws Exception;
	List<Map<String,Object>> UserMovieAll(Map<String, Object>  map) throws Exception;

}
