package believe.review.brw.rank;

import java.util.List;
import java.util.Map;

public interface RankService {

	public List<Map<String, Object>> selectMovieTotal(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectRank5(Map<String, Object> map) throws Exception;
	
	public int selectCountSearchText(Map<String, Object> map) throws Exception;
	
	public void insertSearchText(Map<String, Object> map) throws Exception;
	
	public void updateSearchText(Map<String, Object> map) throws Exception;
	
	public int selectDramaSearch(Map<String, Object> map) throws Exception;
	
	public int selectMovieSearch(Map<String, Object> map) throws Exception;
	
	public int selectActorSearch(Map<String, Object> map) throws Exception;
}
