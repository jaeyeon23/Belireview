package believe.review.brw.main;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO{
	
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
}
