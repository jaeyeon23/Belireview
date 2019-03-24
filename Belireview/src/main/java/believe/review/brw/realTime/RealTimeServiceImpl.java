package believe.review.brw.realTime;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("realTimeService")
public class RealTimeServiceImpl implements RealTimeService{

	@Resource
	private RealTimeDAO realTimeDAO;

	@Override
	public int selectAllName(Map<String, Object> map) throws Exception {
		return realTimeDAO.selectAllName(map);
	}

	@Override
	public List<Map<String, Object>> selectRealTime() throws Exception {
		return realTimeDAO.selectRealTime();
	}

	@Override
	public int selectRealTimeCount(Map<String, Object> map) throws Exception {
		return realTimeDAO.selectRealTimeCount(map);
	}

	@Override
	public void updateRealTime(Map<String, Object> map) throws Exception {
		realTimeDAO.updateRealTime(map);
	}

	@Override
	public void insertRealTime(Map<String, Object> map) throws Exception {
		realTimeDAO.insertRealTime(map);
	}
}
