package believe.review.brw.admin.drama;

import java.util.List;
import java.util.Map;

public interface AdminDramaService {

	public List<Map<String, Object>> selectDramaList() throws Exception;
	
	public List<Map<String, Object>> selectDramaList_order(Map<String, Object> map) throws Exception;
}
