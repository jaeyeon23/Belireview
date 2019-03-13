package believe.review.brw.movie;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("movieDAO")

public class MovieDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("movie.selectBoardList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> movieCommentByRecent(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("movie_comment.movieCommentByRecent",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> movieCommentByLike(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("movie_comment.movieCommentByLike",map);
	}
}
