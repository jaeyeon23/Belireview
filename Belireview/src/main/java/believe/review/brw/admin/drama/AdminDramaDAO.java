package believe.review.brw.admin.drama;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("adminDramaDAO")
public class AdminDramaDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDramaList(){
		return (List<Map<String, Object>>) selectList("admin.selectDramaList");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDramaList_order(Map<String, Object> map){
		
		return (List<Map<String, Object>>) selectList("admin.selectDramaList_order", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectDramaOne(int no){
		return (Map<String, Object>) selectOne("admin.selectDramaOne", no);
	}
	
	public int checkDrama(Map<String, Object> map) {
		return (Integer) selectOne("admin.checkDrama", map);
	}
	
	public void deleteDramaImageOne(int no) {
		delete("admin.deleteDramaImageOne", no);
	}
	
	public void deleteDramaOne(Map<String, Object> map) {
		delete("admin.deleteDramaOne", map);
	}
}
