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
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRank5(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("rank.selectRank5", map);
	}
	
	public int selectCountSearchText(Map<String, Object> map) {
		return (Integer) selectOne("rank.selectCountSearchText", map);
	}
	
	public void insertSearchText(Map<String, Object> map) {
		insert("rank.insertSearchText", map);
	}
	
	public void updateSearchText(Map<String, Object> map) {
		update("rank.updateSearchText", map);
	}
	
	public int selectDramaSearch(Map<String, Object> map) {
		return (Integer) selectOne("rank.selectDramaSearch", map);
	}
	
	public int selectMovieSearch(Map<String, Object> map) {
		return (Integer) selectOne("rank.selectMovieSearch", map);
	}
	
	public int selectActorSearch(Map<String, Object> map) {
		return (Integer) selectOne("rank.selectActorSearch", map);
	}
}
