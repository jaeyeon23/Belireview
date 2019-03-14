package believe.review.brw.main;

import java.util.List;
import java.util.Map;

public interface MainService {
	
	List<Map<String,Object>> mainSerach(Map<String, Object>  map) throws Exception;
	List<Map<String,Object>> movieSerach(Map<String, Object>  map) throws Exception;
	List<Map<String, Object>> dramaSerach(Map<String, Object> map) throws Exception;
	List<Map<String,Object>> adSerach(Map<String, Object>  map) throws Exception;
	public List<Map<String, Object>> dramaListTop8() throws Exception;
	
	public List<Map<String, Object>> movieListTop8() throws Exception;

	public List<Map<String, Object>> adListTop8() throws Exception;
}
