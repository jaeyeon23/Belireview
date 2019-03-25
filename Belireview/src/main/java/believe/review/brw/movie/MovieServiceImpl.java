package believe.review.brw.movie;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("movieService")

public class MovieServiceImpl  implements MovieService{

	@Resource(name="movieDAO")
	private MovieDAO movieDAO;
	
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object>  map) throws Exception {
		return movieDAO.selectBoardList(map);
	}
	@Override
	public Map<String, Object> movieDetail(Map<String, Object> map) throws Exception {
		return movieDAO.movieDetail(map);
	}
	@Override
	public List<Map<String,Object>> movieActor(Map<String, Object> map) throws Exception {
		return movieDAO.movieActor(map);
	}
	@Override
	public List<Map<String, Object>> movieCommentByRecent(Map<String, Object> map) throws Exception {
		return movieDAO.movieCommentByRecent(map);
	}
	@Override
	public List<Map<String, Object>> movieCommentByLike(Map<String, Object> map) throws Exception {
		return movieDAO.movieCommentByLike(map);
	}
	@Override
	public List<Map<String,Object>> movieCommentForDetail(Map<String, Object> map) throws Exception{
		return movieDAO.movieCommentForDetail(map);
	}
	@Override
	public int totalMovieCount(Map<String, Object> map) throws Exception {
		return movieDAO.totalMovieCount(map);
	}
	
	@Override
	public List<Map<String, Object>> detailgenre(Map<String, Object> map) throws Exception {
		return movieDAO.detailgenre(map);
	}
	@Override
	public int totalMovieComment(Map<String, Object> map) throws Exception {
		return movieDAO.totalMovieComment(map);
	}
	@Override
	public Map<String, Object> existGrade(Map<String, Object> map) throws Exception {
		return movieDAO.existGrade(map);
	}
	@Override
	public void addGrade(Map<String, Object> map) throws Exception {
		movieDAO.addGrade(map);
	}
	@Override
	public void updateGrade(Map<String, Object> map) throws Exception {
		movieDAO.updateGrade(map);
	}
	@Override
	public void writeMovieComment(Map<String, Object> map) throws Exception{
		movieDAO.writeMovieComment(map);
	}
	@Override
	public Map<String, Object> myComment(Map<String, Object> map) throws Exception{
		return movieDAO.myComment(map);
	}
	@Override
	public void deleteComment(Map<String, Object> map) throws Exception{
		movieDAO.deleteComment(map);
	}
	@Override
	public void movieCommentLike(Map<String, Object> map) throws Exception {
		movieDAO.movieCommentLike(map);
	}
	@Override
	public void updateMovieComment(Map<String, Object> map) throws Exception {
		movieDAO.updateMovieComment(map);
	}
	@Override
	public List<Map<String,Object>> gradeRatio(Map<String, Object> map) throws Exception{
		return movieDAO.gradeRatio(map);
	}
	@Override
	public int grade(Map<String, Object> map) throws Exception{
		return movieDAO.grade(map);
	}
	@Override
	public double ratingPrediction(Map<String, Object> map) throws Exception{
		return movieDAO.ratingPrediction(map);
	}
	@Override
	public Map<String, Object> commentOne(Map<String, Object> map) throws Exception{
		return movieDAO.commentOne(map);
	}
	@Override
	public void updateReadCount(Map<String, Object> map) throws Exception{
		movieDAO.updateReadCount(map);
	}
	@Override
	public void updateGrade2(Map<String, Object> map) throws Exception{
		movieDAO.updateGrade2(map);
	}
	
	/*@Override
	public Map<String, Object> insertdramaComment(Map<String, Object> map) throws Exception {
		return movieDAO.dramaComment(map);
	}*/
}
