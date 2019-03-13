package believe.review.brw.admin.movie;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("adminMovieDAO")
public class AdminMovieDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMovieList(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("admin.selectMovieList", map);
	}
	
	public int selectNextVal_movie() {
		return (Integer) selectOne("admin.selectNextVal_movie");
	}
	
	public void writeMovie(Map<String, Object> map) {
		insert("admin.writeMovie", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMovieOne(int no){
		return (Map<String, Object>) selectOne("admin.selectMovieOne", no);
	}
	
	public void updateMovieOne(Map<String, Object> map) {
		update("admin.updateMovieOne", map);
	}
	
	public int checkMovie(Map<String, Object> map) {
		return (Integer) selectOne("admin.checkMovie", map);
	}
	
	public void deleteMovieOne(Map<String, Object> map) {
		delete("admin.deleteMovieOne", map);
	}
	
	public void deleteMovieCommentOne(Map<String, Object> map) {
		delete("admin.deleteMovieCommentOne", map);
	}
	
	public void deleteMovieLikeOne(Map<String, Object> map) {
		delete("admin.deleteMovieLikeOne", map);
	}
}
