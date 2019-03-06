package believe.review.brw.admin.drama;

import java.util.List;
import java.util.Map;

public interface AdminDramaService {

	public List<Map<String, Object>> selectDramaList() throws Exception;
	
	public List<Map<String, Object>> selectDramaList_order(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectDramaOne(int no) throws Exception;
	
	public int checkDrama(Map<String, Object> map) throws Exception;
	
	public void deleteDramaImageOne(int no) throws Exception;
	
	public void deleteDramaOne(Map<String, Object> map) throws Exception;
}
