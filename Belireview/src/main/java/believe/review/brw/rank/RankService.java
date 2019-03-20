package believe.review.brw.rank;

import java.util.List;
import java.util.Map;

public interface RankService {

	public List<Map<String, Object>> selectMovieTotal(Map<String, Object> map) throws Exception;
}
