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
	
}
