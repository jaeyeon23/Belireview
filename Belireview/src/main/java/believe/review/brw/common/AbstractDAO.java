package believe.review.brw.common;

import java.util.List;
<<<<<<< HEAD
import java.util.Map;
=======
>>>>>>> 9192b817c639ee458ad08ce1f1d07a751638c7ea

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
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
	

=======

/*import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
*/
public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()) log.debug("\t QueryId \t:   " + queryId);
	}
	
>>>>>>> 9192b817c639ee458ad08ce1f1d07a751638c7ea
	public Object insert(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	
<<<<<<< HEAD
	public Object update(String queryId) {
		printQueryId(queryId);
		return sqlSession.update(queryId);
	}

=======
>>>>>>> 9192b817c639ee458ad08ce1f1d07a751638c7ea
	public Object update(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	
<<<<<<< HEAD
	public Object delete(String queryId) {
		printQueryId(queryId);
		return sqlSession.delete(queryId);
	}


=======
>>>>>>> 9192b817c639ee458ad08ce1f1d07a751638c7ea
	public Object delete(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}
<<<<<<< HEAD

=======
	
>>>>>>> 9192b817c639ee458ad08ce1f1d07a751638c7ea
	public Object selectOne(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}
<<<<<<< HEAD

=======
	
>>>>>>> 9192b817c639ee458ad08ce1f1d07a751638c7ea
	public Object selectOne(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}
<<<<<<< HEAD

=======
	
>>>>>>> 9192b817c639ee458ad08ce1f1d07a751638c7ea
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}
<<<<<<< HEAD

=======
	
>>>>>>> 9192b817c639ee458ad08ce1f1d07a751638c7ea
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}
	
<<<<<<< HEAD

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
=======
/*	@SuppressWarnings("unchecked")
	public Object selectPagingList(String queryId, Object params){
	    printQueryId(queryId);
	    Map<String,Object> map = (Map<String,Object>)params;
	     
	    String strPageIndex = (String)map.get("PAGE_INDEX");
	    String strPageRow = (String)map.get("PAGE_ROW");
	    int nPageIndex = 0;
	    int nPageRow = 20;
	     
	    if(StringUtils.isEmpty(strPageIndex) == false){
	        nPageIndex = Integer.parseInt(strPageIndex)-1;
	    }
	    if(StringUtils.isEmpty(strPageRow) == false){
	        nPageRow = Integer.parseInt(strPageRow);
	    }
	    map.put("START", (nPageIndex * nPageRow) + 1);
	    map.put("END", (nPageIndex * nPageRow) + nPageRow);
	     
	    return sqlSession.selectList(queryId, map);
	}*/
	
	/*@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectPagingList1(String queryId, Object params){
	    printQueryId(queryId);
	     
	    Map<String,Object> map = (Map<String,Object>)params;
	    PaginationInfo paginationInfo = null;
	     
	    if(map.containsKey("currentPageNo") == false || StringUtils.isEmpty(map.get("currentPageNo")) == true)
	        map.put("currentPageNo","1");
	     
	    paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(Integer.parseInt(map.get("currentPageNo").toString()));
	    if(map.containsKey("PAGE_ROW") == false || StringUtils.isEmpty(map.get("PAGE_ROW")) == true){
	        paginationInfo.setRecordCountPerPage(15);
	    }
	    else{
	        paginationInfo.setRecordCountPerPage(Integer.parseInt(map.get("PAGE_ROW").toString()));
	    }
	    paginationInfo.setPageSize(10);
	     
	    int start = paginationInfo.getFirstRecordIndex();
	    int end = start + paginationInfo.getRecordCountPerPage();
	    map.put("START",start+1);
	    map.put("END",end);
	     
	    params = map;
	     
	    Map<String,Object> returnMap = new HashMap<String,Object>();
	    List<Map<String,Object>> list = sqlSession.selectList(queryId,params);
	     
	    if(list.size() == 0){
	        map = new HashMap<String,Object>();
	        map.put("TOTAL_COUNT",0); 
	        list.add(map);
	         
	        if(paginationInfo != null){
	            paginationInfo.setTotalRecordCount(0);
	            returnMap.put("paginationInfo", paginationInfo);
	        }
	    }
	    else{
	        if(paginationInfo != null){
	            paginationInfo.setTotalRecordCount(Integer.parseInt(list.get(0).get("TOTAL_COUNT").toString()));
	            returnMap.put("paginationInfo", paginationInfo);
	        }
	    }
	    returnMap.put("result", list);
	    return returnMap;
	}*/
>>>>>>> 9192b817c639ee458ad08ce1f1d07a751638c7ea

}
