package believe.review.brw.admin.drama;

import java.util.List;
import java.util.Map;

public interface AdminDramaService {

	public List<Map<String, Object>> selectDramaList(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectDramaOne(int no) throws Exception;
	
	public int selectNextVal() throws Exception;
	
	public void writeDrama(Map<String, Object> map) throws Exception;
}
