package believe.review.brw.drama;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

@Repository("dramaDAO")
public class DramaDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object>  map) throws Exception{
		return (List<Map<String, Object>>) selectList("drama.selectBoardList",map);
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
	public List<Map<String,Object>> dramaCommentForDetail(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("drama_comment.dramaCommentForDetail",map);
	}
	public int totalDramaCount(Map<String, Object> map) throws Exception{
		return (Integer) selectOne("drama.totalDramaCount",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> detailgenre(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("drama.detailgenre",map);
	}
	
	public int totalDramaComment(Map<String, Object> map) throws Exception{
		return (Integer) selectOne("drama_comment.totalDramaComment",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> existGrade(Map<String, Object> map) throws Exception{
		return(Map<String,Object>)selectOne("drama.existGrade",map);
	}
	public void addGrade(Map<String, Object> map) throws Exception{
		insert("drama.addGrade", map);
	}
	public void updateGrade(Map<String, Object> map) throws Exception{
		update("drama.updateGrade", map);
	}
	public void writeDramaComment(Map<String, Object> map) throws Exception{
		insert("drama_comment.writeDramaComment", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> myComment(Map<String, Object> map) throws Exception{
		return(Map<String,Object>)selectOne("drama_comment.myComment",map);
	}
	public void deleteComment(Map<String, Object> map) throws Exception{
		delete("drama_comment.deleteComment", map);
	}
	public void dramaCommentLike(Map<String, Object> map) throws Exception {
		update("drama_comment.dramaCommentLike", map);
	}
	public void updateDramaComment(Map<String, Object> map) throws Exception {
		update("drama_comment.updateDramaComment", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> gradeRatio(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("drama.gradeRatio",map);
	}
	public int grade(Map<String, Object> map) throws Exception{
		return (Integer) selectOne("drama.grade",map);
	}
	public double ratingPrediction(Map<String, Object> map) throws Exception{
		if(selectOne("drama.ratingPrediction",map)!=null) {
			return (Double) selectOne("drama.ratingPrediction",map);
		}
			return 0;
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> commentOne(Map<String, Object> map) throws Exception{
		return(Map<String,Object>)selectOne("drama_comment.commentOne",map);
	}
}
