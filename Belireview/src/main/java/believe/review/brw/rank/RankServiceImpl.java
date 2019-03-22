package believe.review.brw.rank;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("rankService")
public class RankServiceImpl implements RankService{

	@Resource(name="rankDAO")
	private RankDAO rankDAO;

	@Override
	public List<Map<String, Object>> selectMovieTotal(Map<String, Object> map) throws Exception {
		return rankDAO.selectMovieTotal(map);
	}

	@Override
	public List<Map<String, Object>> selectRank5(Map<String, Object> map) throws Exception {
		return rankDAO.selectRank5(map);
	}

	@Override
	public int selectCountSearchText(Map<String, Object> map) throws Exception {
		return rankDAO.selectCountSearchText(map);
	}

	@Override
	public void insertSearchText(Map<String, Object> map) throws Exception {
		rankDAO.insertSearchText(map);
	}

	@Override
	public void updateSearchText(Map<String, Object> map) throws Exception {
		rankDAO.updateSearchText(map);
	}

	@Override
	public int selectDramaSearch(Map<String, Object> map) throws Exception {
		return rankDAO.selectDramaSearch(map);
	}

	@Override
	public int selectMovieSearch(Map<String, Object> map) throws Exception {
		return rankDAO.selectMovieSearch(map);
	}

	@Override
	public int selectActorSearch(Map<String, Object> map) throws Exception {
		return rankDAO.selectActorSearch(map);
	}
}
