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

}
