package believe.review.brw.drama;

import java.util.List;
import java.util.Map;

public interface DramaService {
	
	List<Map<String,Object>> selectBoardList() throws Exception;
	
	Map<String,Object> dramaDetail(Map<String,Object> map) throws Exception;

}
