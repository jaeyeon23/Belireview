package believe.review.brw.ad;

import java.util.List;
import java.util.Map;

public interface AdService {
List<Map<String,Object>> selectBoardList(Map<String, Object>  map) throws Exception;
	
	Map<String,Object> adDetail(Map<String,Object> map) throws Exception;
	
	List<Map<String,Object>> adActor(Map<String,Object> map) throws Exception;
	
	List<Map<String,Object>> adCommentByRecent(Map<String, Object> map) throws Exception;
	
	List<Map<String,Object>> adCommentByLike(Map<String, Object> map) throws Exception;
	
	List<Map<String,Object>> adCommentForDetail(Map<String, Object> map) throws Exception;
	
	List<Map<String,Object>> detailgenre(Map<String, Object> map) throws Exception;
	
	int totalAdCount(Map<String,Object> map) throws Exception;
	
	int totalAdComment(Map<String,Object> map) throws Exception;
	
	Map<String,Object> existGrade(Map<String,Object> map) throws Exception;
	
	void addGrade(Map<String,Object> map) throws Exception;
	
	void updateGrade(Map<String,Object> map) throws Exception;
	
	void writeAdComment(Map<String, Object> map) throws Exception;
	
	Map<String, Object> myComment(Map<String, Object> map) throws Exception;
	
	void deleteComment(Map<String, Object> map) throws Exception;

	void adCommentLike(Map<String, Object> map) throws Exception;
	
	void updateAdComment(Map<String, Object> map) throws Exception;
	
	List<Map<String,Object>> gradeRatio(Map<String, Object> map) throws Exception;
	
	int grade(Map<String, Object> map) throws Exception;
	
	double ratingPrediction(Map<String, Object> map) throws Exception;
	
	Map<String, Object> commentOne(Map<String, Object> map) throws Exception;
}
