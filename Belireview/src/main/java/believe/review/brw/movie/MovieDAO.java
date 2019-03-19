package believe.review.brw.movie;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("movieDAO")
public class MovieDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("movie.selectBoardList",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> movieDetail(Map<String, Object> map) throws Exception{
		return(Map<String,Object>)selectOne("movie.movieDetail",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> movieActor(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("movie.movieActor",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> movieCommentByRecent(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("movie_comment.movieCommentByRecent",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> movieCommentByLike(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("movie_comment.movieCommentByLike",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> movieCommentForDetail(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("movie_comment.movieCommentForDetail",map);
	}
	public int totalMovieCount(Map<String, Object> map) throws Exception{
		return (Integer) selectOne("movie.totalMovieCount",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> detailgenre(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("movie.detailgenre",map);
	}
	
	public int totalMovieComment(Map<String, Object> map) throws Exception{
		return (Integer) selectOne("movie_comment.totalMovieComment",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> existGrade(Map<String, Object> map) throws Exception{
		return(Map<String,Object>)selectOne("movie.existGrade",map);
	}
	public void addGrade(Map<String, Object> map) throws Exception{
		insert("movie.addGrade", map);
	}
	public void updateGrade(Map<String, Object> map) throws Exception{
		update("movie.updateGrade", map);
	}
	public void writeMovieComment(Map<String, Object> map) throws Exception{
		insert("movie_comment.writeMovieComment", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> myComment(Map<String, Object> map) throws Exception{
		return(Map<String,Object>)selectOne("movie_comment.myComment",map);
	}
	public void deleteComment(Map<String, Object> map) throws Exception{
		delete("movie_comment.deleteComment", map);
	}
	public void movieCommentLike(Map<String, Object> map) throws Exception {
		update("movie_comment.movieCommentLike", map);
	}
	public void updateMovieComment(Map<String, Object> map) throws Exception {
		update("movie_comment.updateMovieComment", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> gradeRatio(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("movie.gradeRatio",map);
	}
	public int grade(Map<String, Object> map) throws Exception{
		return (Integer) selectOne("movie.grade",map);
	}
	public double ratingPrediction(Map<String, Object> map) throws Exception{
		if(selectOne("movie.ratingPrediction",map)!=null) {
			return (Double) selectOne("movie.ratingPrediction",map);
		}
			return 0;
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> commentOne(Map<String, Object> map) throws Exception{
		return(Map<String,Object>)selectOne("movie_comment.commentOne",map);
	}
}
