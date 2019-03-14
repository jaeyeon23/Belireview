package believe.review.brw.admin.drama;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("adminDramaDAO")
public class AdminDramaDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDramaList(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("admin.selectDramaList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectDramaOne(int no){
		return (Map<String, Object>) selectOne("admin.selectDramaOne", no);
	}
	
	public int selectNextVal() {
		return (Integer) selectOne("admin.selectNextVal");
	}
	
	public void writeDrama(Map<String, Object> map) {
		insert("admin.writeDrama", map);
	}
	
	public int checkDrama(Map<String, Object> map) {
		return (Integer) selectOne("admin.checkDrama", map);
	}

	public void updateDramaOne(Map<String, Object> map) {
		update("admin.updateDramaOne", map);
	}
	
	public void deleteDramaOne(Map<String, Object> map) {
		delete("admin.deleteDramaOne", map);
	}
	
	public void deleteDramaLikeOne(Map<String, Object> map) {
		delete("admin.deleteDramaLikeOne", map);
	}
	
	public void deleteDramaCommentOne(Map<String, Object> map) {
		delete("admin.deleteDramaCommentOne", map);
	}
}
