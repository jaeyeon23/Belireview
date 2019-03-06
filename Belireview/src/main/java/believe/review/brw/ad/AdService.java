package believe.review.brw.ad;

import java.util.List;
import java.util.Map;

public interface AdService {
	List<Map<String,Object>> selectBoardList() throws Exception;
}
