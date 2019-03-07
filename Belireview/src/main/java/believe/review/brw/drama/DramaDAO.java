package believe.review.brw.drama;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("dramaDAO")
public class DramaDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList() throws Exception{
		return (List<Map<String, Object>>) selectList("drama.selectBoardList");
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> dramaDetail(Map<String, Object> map) throws Exception{
		return(Map<String,Object>)selectOne("drama.dramaDetail",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> dramaActor(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("drama.dramaActor",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> dramaCommentByRecent(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("drama_comment.dramaCommentByRecent",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> dramaCommentByLike(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("drama_comment.dramaCommentByLike",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> dramaName(Map<String, Object> map) throws Exception{
		return(Map<String,Object>)selectOne("drama.dramaName",map);
	}
	
}
