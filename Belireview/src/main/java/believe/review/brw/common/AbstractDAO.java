package believe.review.brw.common;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

public class AbstractDAO {

	protected Log log = LogFactory.getLog(AbstractDAO.class);

	//@Autowired
	private SqlSessionTemplate sqlSession;

	protected void printQueryId(String queryId) {
		if (log.isDebugEnabled()) {
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}
	
	public Object insert(String queryId) {
		printQueryId(queryId);
		return sqlSession.insert(queryId);
	}
	

	public Object insert(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	
	public Object update(String queryId) {
		printQueryId(queryId);
		return sqlSession.update(queryId);
	}

	public Object update(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	
	public Object delete(String queryId) {
		printQueryId(queryId);
		return sqlSession.delete(queryId);
	}


	public Object delete(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}

	public Object selectOne(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}

	public Object selectOne(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}
	

	/*
	 * // 가입한 회원 아이디 검색
	 * 
	 * @SuppressWarnings("rawtypes") public List searchMemberList0(String map,
	 * Object params) { printQueryId(map); return sqlSession.selectList(map,
	 * params); }
	 * 
	 * // 가입한 회원 아이디 중복 확인
	 * 
	 * @SuppressWarnings("rawtypes") public int selectMemberId(String queryId,
	 * Object params) { printQueryId(queryId); return sqlSession.selectOne(queryId,
	 * params); }
	 * 
	 * 
	 * // 이름 검색
	 * 
	 * 
	 * // 가입한 회원 이름 검색
	 * 
	 * @SuppressWarnings("rawtypes") public List searchMemberList1(String queryId,
	 * Object params) { printQueryId(queryId); return sqlSession.selectList(queryId,
	 * params); }
	 * 
	 * 
	 * // 회원아이디로 검색
	 * 
	 * // 가입한 회원 전화번호 검색
	 * 
	 * 
	 * // 회원아이디로 검색
	 * 
	 * 
	 * // 가입한 회원 전화번호 검색
	 * 
	 * @SuppressWarnings("rawtypes") public List searchMemberList2(String queryId,
	 * Object params) { printQueryId(queryId); return sqlSession.selectList(queryId,
	 * params); }
	 * 
	 * 
	 * 
	 * // E-Mail 검색
	 * 
	 * // 가입한 회원 이메일 검색
	 * 
	 * 
	 * 
	 * // E-Mail 검색 // 가입한 회원 이메일 검색
	 * 
	 * 
	 * // 가입한 회원 이메일 검색
	 * 
	 * @SuppressWarnings("rawtypes") public List searchMemberList3(String queryId,
	 * Object params) { printQueryId(queryId); return sqlSession.selectList(queryId,
	 * params); }
	 * 
	 * // 글제목 검색
	 * 
	 * @SuppressWarnings("rawtypes") public List searchTitleList(String queryId,
	 * Object params, String isSearch) { printQueryId(queryId); return
	 * sqlSession.selectList(queryId, params); }
	 * 
	 * // 글내용 검색
	 * 
	 * @SuppressWarnings("rawtypes") public List searchContentList(String queryId,
	 * Object params, String isSearch) { printQueryId(queryId); return
	 * sqlSession.selectList(queryId, params); }
	 * 
	 * // 페이징
	 * 
	 * @SuppressWarnings("unchecked") public Object selectPagingList(String queryId,
	 * Object params){ printQueryId(queryId); Map<String, Object> map = (Map<String,
	 * Object>)params;
	 * 
	 * String strPageIndex = (String)map.get("PAGE_INDEX"); String strPageRow =
	 * (String)map.get("PAGE_ROW"); int nPageIndex = 0; int nPageRow = 20;
	 * 
	 * if(StringUtils.isEmpty(strPageIndex) == false){ nPageIndex =
	 * Integer.parseInt(strPageIndex)-1; } if(StringUtils.isEmpty(strPageRow) ==
	 * false){ nPageRow = Integer.parseInt(strPageRow); } map.put("START",
	 * (nPageIndex * nPageRow) + 1); map.put("END", (nPageIndex * nPageRow) +
	 * nPageRow);
	 * 
	 * return sqlSession.selectList(queryId, map); } public Map<String, Object>
	 * selectOne1(String queryId, Object params) { printQueryId(queryId); return
	 * sqlSession.selectOne(queryId, params); }
	 */

}
