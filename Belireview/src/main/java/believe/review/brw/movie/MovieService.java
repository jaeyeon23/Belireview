package believe.review.brw.movie;

import java.util.List;
import java.util.Map;

public interface MovieService {
	 List<Map<String,Object>> selectBoardList(Map<String, Object> map) throws Exception;
	 
	 List<Map<String,Object>> movieCommentByRecent(Map<String, Object> map) throws Exception;
		
	 List<Map<String,Object>> movieCommentByLike(Map<String, Object> map) throws Exception;
	 
}
