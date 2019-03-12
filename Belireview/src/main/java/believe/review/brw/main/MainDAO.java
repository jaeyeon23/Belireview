package believe.review.brw.main;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
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
	
	
}
