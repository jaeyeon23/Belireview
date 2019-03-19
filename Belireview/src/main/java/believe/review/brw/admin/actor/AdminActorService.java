package believe.review.brw.admin.actor;

import java.util.List;
import java.util.Map;

public interface AdminActorService {

	public List<Map<String, Object>> selectActorList(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectActorOne(String no) throws Exception;
	
	public List<Map<String, Object>> selectActorDrama(String searchValue) throws Exception;
	
	public List<Map<String, Object>> selectActorMovie(String searchValue) throws Exception;
	
	public void insertActor(Map<String, Object> map) throws Exception;
	
	public void updateActorOne(Map<String, Object> map) throws Exception;
	
	public void deleteActorOne(String no) throws Exception;
	
	public List<Map<String, Object>> selectActorAjax(String searchValue) throws Exception;
	
	public List<Map<String, Object>> selectActorDramaModify(String no) throws Exception;
	
	public List<Map<String, Object>> selectActorMovieModify(String no) throws Exception;
}
