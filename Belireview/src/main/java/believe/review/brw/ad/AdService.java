package believe.review.brw.ad;

import java.util.List;
import java.util.Map;

public interface AdService {
	List<Map<String,Object>> selectBoardList() throws Exception;
	
	Map<String,Object> adDetail(Map<String,Object> map) throws Exception;
	
	List<Map<String,Object>> adCommentByRecent(Map<String, Object> map) throws Exception;
	
	List<Map<String,Object>> adCommentByLike(Map<String, Object> map) throws Exception;
	
	int totalAdComment(Map<String,Object> map) throws Exception;
	
	Map<String, Object> myComment(Map<String, Object> map) throws Exception;
	
	Map<String, Object> adCommentLike(Map<String, Object> map)throws Exception;
}
