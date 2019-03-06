package believe.review.brw.drama;

import java.util.List;
import java.util.Map;

public interface DramaService {
	
	List<Map<String,Object>> selectBoardList() throws Exception;

}
