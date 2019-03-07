package believe.review.brw.drama;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("dramaService")

public class DramaServiceImpl  implements DramaService{

	@Resource(name="dramaDAO")
	private DramaDAO dramaDAO;
	
	
	@Override
	public List<Map<String, Object>> selectBoardList() throws Exception {
		return dramaDAO.selectBoardList();
	}
	@Override
	public Map<String, Object> dramaDetail(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		Map<String, Object> tempMap = dramaDAO.dramaDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> actor = dramaDAO.dramaDetailactor(map);
	    resultMap.put("actor", actor);
		
		return resultMap;
	}
/*	@Override
	public List<Map<String,Object>> dramaActor(Map<String, Object> map) throws Exception {
		return dramaDAO.dramaActor(map);
	}*/
	@Override
	public List<Map<String, Object>> dramaCommentByRecent(Map<String, Object> map) throws Exception {
		return dramaDAO.dramaCommentByRecent(map);
	}
	@Override
	public List<Map<String, Object>> dramaCommentByLike(Map<String, Object> map) throws Exception {
		return dramaDAO.dramaCommentByLike(map);
	}
	

}
