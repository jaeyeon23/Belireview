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
	public List<Map<String, Object>> selectBoardList() throws Exception{
	return adDAO.selectBoardList();

}
}
