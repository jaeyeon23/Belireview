package believe.review.brw.admin.ad;

import java.util.List;
import java.util.Map;

public interface AdminAdService {

	public List<Map<String, Object>> selectAdList(Map<String, Object> map) throws Exception;
	
	public int selectNextVal_ad() throws Exception;
	
	public void writeAd(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectAdOne(int no) throws Exception;
	
	public void updateAdOne(Map<String, Object> map) throws Exception;
	
	public int checkAd(Map<String, Object> map) throws Exception;
	
	public void deleteAdOne(Map<String, Object> map) throws Exception;
}
