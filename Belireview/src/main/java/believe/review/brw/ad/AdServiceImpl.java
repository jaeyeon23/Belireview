package believe.review.brw.ad;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adService")
public class AdServiceImpl implements AdService{

	@Resource(name="adDAO")
	private AdDAO adDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object>  map) throws Exception {
		return adDAO.selectBoardList(map);
	}
	@Override
	public Map<String, Object> adDetail(Map<String, Object> map) throws Exception {
		return adDAO.adDetail(map);
	}
	@Override
	public List<Map<String, Object>> adCommentByRecent(Map<String, Object> map) throws Exception {
		return adDAO.adCommentByRecent(map);
	}
	@Override
	public List<Map<String, Object>> adCommentByLike(Map<String, Object> map) throws Exception {
		return adDAO.adCommentByLike(map);
	}
	@Override
	public List<Map<String,Object>> adCommentForDetail(Map<String, Object> map) throws Exception{
		return adDAO.adCommentForDetail(map);
	}
	@Override
	public int totalAdCount(Map<String, Object> map) throws Exception {
		return adDAO.totalAdCount(map);
	}
	
	@Override
	public List<Map<String, Object>> detailgenre(Map<String, Object> map) throws Exception {
		return adDAO.detailgenre(map);
	}
	@Override
	public int totalAdComment(Map<String, Object> map) throws Exception {
		return adDAO.totalAdComment(map);
	}
	@Override
	public Map<String, Object> existGrade(Map<String, Object> map) throws Exception {
		return adDAO.existGrade(map);
	}
	@Override
	public void addGrade(Map<String, Object> map) throws Exception {
		adDAO.addGrade(map);
	}
	@Override
	public void updateGrade(Map<String, Object> map) throws Exception {
		adDAO.updateGrade(map);
	}
	@Override
	public void writeAdComment(Map<String, Object> map) throws Exception{
		adDAO.writeAdComment(map);
	}
	@Override
	public Map<String, Object> myComment(Map<String, Object> map) throws Exception{
		return adDAO.myComment(map);
	}
	@Override
	public void deleteComment(Map<String, Object> map) throws Exception{
		adDAO.deleteComment(map);
	}
	@Override
	public void adCommentLike(Map<String, Object> map) throws Exception {
		adDAO.adCommentLike(map);
	}
	@Override
	public void updateAdComment(Map<String, Object> map) throws Exception {
		adDAO.updateAdComment(map);
	}
	@Override
	public List<Map<String,Object>> gradeRatio(Map<String, Object> map) throws Exception{
		return adDAO.gradeRatio(map);
	}
	@Override
	public int grade(Map<String, Object> map) throws Exception{
		return adDAO.grade(map);
	}
	@Override
	public double ratingPrediction(Map<String, Object> map) throws Exception{
		return adDAO.ratingPrediction(map);
	}
	@Override
	public Map<String, Object> commentOne(Map<String, Object> map) throws Exception{
		return adDAO.commentOne(map);
	}
	@Override
	public void updateReadCount(Map<String, Object> map) throws Exception{
		adDAO.updateReadCount(map);
	}
	
}
