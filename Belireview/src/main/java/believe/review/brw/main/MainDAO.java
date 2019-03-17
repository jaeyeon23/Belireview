package believe.review.brw.main;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> mainSerach(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("main.selectMainSerach",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> movieSerach(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("main.selectMovieSerach",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> dramaSerach(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("main.selectDramaSerach",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adSerach(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("main.selectAdSerach",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> dramaListTop8(){
		return selectList("main.dramaListTop8");
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> movieListTop8(){
		return selectList("main.movieListTop8");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adListTop8(){
		return selectList("main.adListTop8");
	}
	
	/*연관검색어*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchRelation(String searchValue){
		return (List<Map<String, Object>>) selectList("main.searchRelation", searchValue);
	}
	
}
