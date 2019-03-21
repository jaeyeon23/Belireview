package believe.review.brw.admin.actor;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("adminActorDAO")
public class AdminActorDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectActorList(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("admin.selectActorList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectActorOne(String no){
		return (Map<String, Object>) selectOne("admin.selectActorOne", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectActorDrama(String searchValue){
		return (List<Map<String, Object>>) selectList("admin.selectActorDrama", searchValue);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectActorMovie(String searchValue){
		return (List<Map<String, Object>>) selectList("admin.selectActorMovie", searchValue);
	}
	
	public void insertActor(Map<String, Object> map) {
		insert("admin.insertActor", map);
	}
	
	public void updateActorOne(Map<String, Object> map) {
		update("admin.updateActorOne", map);
	}
	
	public void deleteActorOne(String no) {
		delete("admin.deleteActorOne", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectActorAjax(String searchValue){
		return (List<Map<String, Object>>) selectList("admin.selectActorAjax", searchValue);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectActorDramaModify(String no){
		return (List<Map<String, Object>>) selectList("admin.selectActorDramaModify", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectActorMovieModify(String no){
		return (List<Map<String, Object>>) selectList("admin.selectActorMovieModify", no);
	}
}
