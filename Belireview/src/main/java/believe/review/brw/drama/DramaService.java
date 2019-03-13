package believe.review.brw.drama;

import java.util.List;
import java.util.Map;

public interface DramaService {
	
	List<Map<String,Object>> selectBoardList(Map<String, Object>  map) throws Exception;
	
	Map<String,Object> dramaDetail(Map<String,Object> map) throws Exception;
	
	List<Map<String,Object>> dramaActor(Map<String,Object> map) throws Exception;
	
	List<Map<String,Object>> dramaCommentByRecent(Map<String, Object> map) throws Exception;
	
	List<Map<String,Object>> dramaCommentByLike(Map<String, Object> map) throws Exception;
	
	List<Map<String,Object>> detailgenre(Map<String, Object> map) throws Exception;
	
	int totalDramaCount(Map<String,Object> map) throws Exception;
	
	int totalDramaComment(Map<String,Object> map) throws Exception;
	
	Map<String,Object> existGrade(Map<String,Object> map) throws Exception;
	
	void addGrade(Map<String,Object> map) throws Exception;
	
	void updateGrade(Map<String,Object> map) throws Exception;
	
	public void writeDramaComment(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> myComment(Map<String, Object> map) throws Exception;

	/*Map<String,Object> insertdramaComment(Map<String,Object> map) throws Exception;*/

}
