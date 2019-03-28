package believe.review.brw.movie;

import java.util.List;
import java.util.Map;

public interface MovieService {
	
	List<Map<String,Object>> selectBoardList(Map<String, Object>  map) throws Exception;
	
	Map<String,Object> movieDetail(Map<String,Object> map) throws Exception;
	
	List<Map<String,Object>> movieActor(Map<String,Object> map) throws Exception;
	
	List<Map<String,Object>> movieCommentByRecent(Map<String, Object> map) throws Exception;
	
	List<Map<String,Object>> movieCommentByLike(Map<String, Object> map) throws Exception;
	
	List<Map<String,Object>> movieCommentForDetail(Map<String, Object> map) throws Exception;
	
	List<Map<String,Object>> detailgenre(Map<String, Object> map) throws Exception;
	
	int totalMovieCount(Map<String,Object> map) throws Exception;
	
	int totalMovieComment(Map<String,Object> map) throws Exception;
	
	Map<String,Object> existGrade(Map<String,Object> map) throws Exception;
	
	void addGrade(Map<String,Object> map) throws Exception;
	
	void updateGrade(Map<String,Object> map) throws Exception;
	
	void writeMovieComment(Map<String, Object> map) throws Exception;
	
	Map<String, Object> myComment(Map<String, Object> map) throws Exception;
	
	void deleteComment(Map<String, Object> map) throws Exception;

	void movieCommentLike(Map<String, Object> map) throws Exception;
	
	void updateMovieComment(Map<String, Object> map) throws Exception;
	
	List<Map<String,Object>> gradeRatio(Map<String, Object> map) throws Exception;
	
	int grade(Map<String, Object> map) throws Exception;
	
	double ratingPrediction(Map<String, Object> map) throws Exception;
	
	Map<String, Object> commentOne(Map<String, Object> map) throws Exception;
	
	void updateReadCount(Map<String, Object> map) throws Exception;
		
	void updateGrade2(Map<String, Object> map) throws Exception;
	
	
	/*Map<String,Object> insertdramaComment(Map<String,Object> map) throws Exception;*/

}

