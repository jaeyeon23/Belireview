package believe.review.brw.ad;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

	@Repository("adDAO")

	public class AdDAO  extends AbstractDAO {
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> selectBoardList(Map<String, Object>  map) throws Exception{
			return (List<Map<String, Object>>) selectList("ad.selectBoardList",map);
		}
		@SuppressWarnings("unchecked")
		public Map<String, Object> adDetail(Map<String, Object> map) throws Exception{
			return(Map<String,Object>)selectOne("ad.adDetail",map);
		}
		@SuppressWarnings("unchecked")
		public List<Map<String,Object>> adCommentByRecent(Map<String, Object> map) throws Exception{
			return (List<Map<String,Object>>)selectList("ad_comment.adCommentByRecent",map);
		}
		@SuppressWarnings("unchecked")
		public List<Map<String,Object>> adCommentByLike(Map<String, Object> map) throws Exception{
			return (List<Map<String,Object>>)selectList("ad_comment.adCommentByLike",map);
		}
		@SuppressWarnings("unchecked")
		public List<Map<String,Object>> adCommentForDetail(Map<String, Object> map) throws Exception{
			return (List<Map<String,Object>>)selectList("ad_comment.adCommentForDetail",map);
		}
		public int totalAdCount(Map<String, Object> map) throws Exception{
			return (Integer) selectOne("ad.totalAdCount",map);
		}
		/*@SuppressWarnings("unchecked")
		public List<Map<String,Object>> detailgenre(Map<String, Object> map) throws Exception{
			return (List<Map<String,Object>>)selectList("ad.detailgenre",map);
		}*/
		
		public int totalAdComment(Map<String, Object> map) throws Exception{
			return (Integer) selectOne("ad_comment.totalAdComment",map);
		}
		@SuppressWarnings("unchecked")
		public Map<String, Object> existGrade(Map<String, Object> map) throws Exception{
			return(Map<String,Object>)selectOne("ad.existGrade",map);
		}
		public void addGrade(Map<String, Object> map) throws Exception{
			insert("ad.addGrade", map);
		}
		public void updateGrade(Map<String, Object> map) throws Exception{
			update("ad.updateGrade", map);
		}
		public void writeAdComment(Map<String, Object> map) throws Exception{
			insert("ad_comment.writeAdComment", map);
		}
		@SuppressWarnings("unchecked")
		public Map<String, Object> myComment(Map<String, Object> map) throws Exception{
			return(Map<String,Object>)selectOne("ad_comment.myComment",map);
		}
		public void deleteComment(Map<String, Object> map) throws Exception{
			delete("ad_comment.deleteComment", map);
		}
		public void adCommentLike(Map<String, Object> map) throws Exception {
			update("ad_comment.adCommentLike", map);
		}
		public void updateAdComment(Map<String, Object> map) throws Exception {
			update("ad_comment.updateAdComment", map);
		}
		@SuppressWarnings("unchecked")
		public List<Map<String,Object>> gradeRatio(Map<String, Object> map) throws Exception{
			return (List<Map<String,Object>>)selectList("ad.gradeRatio",map);
		}
		public int grade(Map<String, Object> map) throws Exception{
			return (Integer) selectOne("ad.grade",map);
		}
		public double ratingPrediction(Map<String, Object> map) throws Exception{
			if(selectOne("ad.ratingPrediction",map)!=null) {
				return (Double) selectOne("ad.ratingPrediction",map);
			}
				return 0;
		}
		@SuppressWarnings("unchecked")
		public Map<String, Object> commentOne(Map<String, Object> map) throws Exception{
			return(Map<String,Object>)selectOne("ad_comment.commentOne",map);
		}
}
