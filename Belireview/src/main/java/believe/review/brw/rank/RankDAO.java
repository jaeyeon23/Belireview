package believe.review.brw.rank;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("rankDAO")
public class RankDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMovieTotal(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("rank.selectMovieTotal", map);
	}
	
}
