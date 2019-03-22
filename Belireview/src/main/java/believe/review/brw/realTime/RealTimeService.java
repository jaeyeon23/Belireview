package believe.review.brw.realTime;

import java.util.List;
import java.util.Map;

public interface RealTimeService {

	public int selectAllName(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectRealTime() throws Exception;
	
	public int selectRealTimeCount(Map<String, Object> map) throws Exception;
	
	public void updateRealTime(Map<String, Object> map) throws Exception;
	
	public void insertRealTime(Map<String, Object> map) throws Exception;
}
