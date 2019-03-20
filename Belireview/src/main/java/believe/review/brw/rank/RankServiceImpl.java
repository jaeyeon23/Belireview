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
}
