package believe.review.brw.ad;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import believe.review.brw.common.common.AbstractDAO;

	@Repository("adDAO")

	public class AdDAO  extends AbstractDAO {
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> selectBoardList() throws Exception{
			return (List<Map<String, Object>>) selectList("ad.selectBoardList");
		}
		@SuppressWarnings("unchecked")
		public Map<String, Object> adDetail(Map<String, Object> map) throws Exception{
			return(Map<String,Object>)selectOne("ad.adDetail",map);
		}
		@SuppressWarnings("unchecked")
		public List<Map<String,Object>> adCommentByLike(Map<String, Object> map) throws Exception{
			return (List<Map<String,Object>>)selectList("ad_comment.adCommentByLike",map);
		}
		@SuppressWarnings("unchecked")
		public List<Map<String,Object>> adCommentByRecent(Map<String, Object> map) throws Exception{
			return (List<Map<String,Object>>)selectList("ad_comment.adCommentByRecent",map);
		}
		public int totalAdComment(Map<String, Object> map) throws Exception{
			return (Integer) selectOne("ad_comment.totalAdComment",map);
		}
		@SuppressWarnings("unchecked")
		public Map<String, Object> myComment(Map<String, Object> map) throws Exception{
			return(Map<String,Object>)selectOne("ad_comment.myComment",map);
		}
		@SuppressWarnings("unchecked")
		public Map<String, Object> adCommentLike(Map<String, Object> map) throws Exception{
			return (Map<String, Object>)selectOne("ad_comment.adCommentLike",map);
		}
}
