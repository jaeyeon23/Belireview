package believe.review.brw.user;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> UserMovieByRecent(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("user.UserMovieByRecent",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> UserMovieAll(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("user.UserMovieAll",map);
	}
	


}
