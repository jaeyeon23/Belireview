package believe.review.brw.realTime;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("realTimeDAO")
public class RealTimeDAO extends AbstractDAO{
	
	public int selectAllName(Map<String, Object> map){
		return (Integer) selectOne("realTime.selectAllName", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRealTime() {
		return (List<Map<String, Object>>) selectList("realTime.selectRealTime");
	}

	public int selectRealTimeCount(Map<String, Object> map) {
		return (Integer) selectOne("realTime.selectRealTimeCount", map);
	}
	
	public void updateRealTime(Map<String, Object> map) {
		update("realTime.updateRealTime", map);
	}
	
	public void insertRealTime(Map<String, Object> map) {
		insert("realTime.insertRealTime", map);
	}
}
