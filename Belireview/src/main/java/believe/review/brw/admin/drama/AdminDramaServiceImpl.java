package believe.review.brw.admin.drama;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("adminDramaService")
public class AdminDramaServiceImpl implements AdminDramaService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminDramaDAO")
	private AdminDramaDAO adminDramaDAO;
	
	@Override
	public List<Map<String, Object>> selectDramaList(Map<String, Object> map) throws Exception {
		return adminDramaDAO.selectDramaList(map);
	}

	@Override
	public Map<String, Object> selectDramaOne(int no) throws Exception {
		return adminDramaDAO.selectDramaOne(no);
	}

	@Override
	public int selectNextVal() throws Exception {
		return adminDramaDAO.selectNextVal();
	}

	
}
