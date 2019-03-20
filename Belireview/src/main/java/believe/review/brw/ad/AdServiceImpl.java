//package believe.review.brw.ad;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//
//import org.springframework.stereotype.Service;
//
//import believe.review.brw.ad.adDAO;
//import believe.review.brw.ad.adService;
//
//@Service("adService")
//
//public class AdServiceImpl  implements adService{
//
//	@Resource(name="adDAO")
//	private adDAO adDAO;
//	
//	
//	@Override
//	public List<Map<String, Object>> selectBoardList(Map<String, Object>  map) throws Exception {
//		return adDAO.selectBoardList(map);
//	}
//	@Override
//	public Map<String, Object> adDetail(Map<String, Object> map) throws Exception {
//		return adDAO.adDetail(map);
//	}
//	@Override
//	public List<Map<String,Object>> adActor(Map<String, Object> map) throws Exception {
//		return adDAO.adActor(map);
//	}
//	@Override
//	public List<Map<String, Object>> adCommentByRecent(Map<String, Object> map) throws Exception {
//		return adDAO.adCommentByRecent(map);
//	}
//	@Override
//	public List<Map<String, Object>> adCommentByLike(Map<String, Object> map) throws Exception {
//		return adDAO.adCommentByLike(map);
//	}
//	@Override
//	public List<Map<String,Object>> adCommentForDetail(Map<String, Object> map) throws Exception{
//		return adDAO.adCommentForDetail(map);
//	}
//	@Override
//	public int totaladCount(Map<String, Object> map) throws Exception {
//		return adDAO.totaladCount(map);
//	}
//	
//	@Override
//	public List<Map<String, Object>> detailgenre(Map<String, Object> map) throws Exception {
//		return adDAO.detailgenre(map);
//	}
//	@Override
//	public int totaladComment(Map<String, Object> map) throws Exception {
//		return adDAO.totaladComment(map);
//	}
//	@Override
//	public Map<String, Object> existGrade(Map<String, Object> map) throws Exception {
//		return adDAO.existGrade(map);
//	}
//	@Override
//	public void addGrade(Map<String, Object> map) throws Exception {
//		adDAO.addGrade(map);
//	}
//	@Override
//	public void updateGrade(Map<String, Object> map) throws Exception {
//		adDAO.updateGrade(map);
//	}
//	@Override
//	public void writeadComment(Map<String, Object> map) throws Exception{
//		adDAO.writeadComment(map);
//	}
//	@Override
//	public Map<String, Object> myComment(Map<String, Object> map) throws Exception{
//		return adDAO.myComment(map);
//	}
//	@Override
//	public void deleteComment(Map<String, Object> map) throws Exception{
//		adDAO.deleteComment(map);
//	}
//	@Override
//	public void adCommentLike(Map<String, Object> map) throws Exception {
//		adDAO.adCommentLike(map);
//	}
//	@Override
//	public void updateadComment(Map<String, Object> map) throws Exception {
//		adDAO.updateadComment(map);
//	}
//	@Override
//	public List<Map<String,Object>> gradeRatio(Map<String, Object> map) throws Exception{
//		return adDAO.gradeRatio(map);
//	}
//	@Override
//	public int grade(Map<String, Object> map) throws Exception{
//		return adDAO.grade(map);
//	}
//	@Override
//	public double ratingPrediction(Map<String, Object> map) throws Exception{
//		return adDAO.ratingPrediction(map);
//	}
//	@Override
//	public Map<String, Object> commentOne(Map<String, Object> map) throws Exception{
//		return adDAO.commentOne(map);
//	}
//	
//	/*@Override
//	public Map<String, Object> insertadComment(Map<String, Object> map) throws Exception {
//		return adDAO.adComment(map);
//	}*/
//}
