package believe.review.brw.main;

import java.util.List;
import java.util.Map;

public interface MainService {

	public List<Map<String, Object>> dramaListTop8() throws Exception;
	
	public List<Map<String, Object>> movieListTop8() throws Exception;

	public List<Map<String, Object>> adListTop8() throws Exception;
}
