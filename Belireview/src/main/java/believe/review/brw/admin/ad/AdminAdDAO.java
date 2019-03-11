package believe.review.brw.admin.ad;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("adminAdDAO")
public class AdminAdDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAdList(Map<String, Object> map){
		return selectList("admin.selectAdList", map);
	}
	
	public int selectNextVal_ad() {
		return (Integer) selectOne("admin.selectNextVal_ad");
	}
	
	public void writeAd(Map<String, Object> map) {
		insert("admin.writeAd", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAdOne(int no){
		return (Map<String, Object>) selectOne("admin.selectAdOne", no);
	}
	
	public void updateAdOne(Map<String, Object> map) {
		update("admin.updateAdOne", map);
	}
	
	public int checkAd(Map<String, Object> map) {
		return (Integer) selectOne("admin.checkAd", map);
	}
	
	public void deleteAdOne(Map<String, Object> map) {
		delete("admin.deleteAdOne", map);
	}
}
