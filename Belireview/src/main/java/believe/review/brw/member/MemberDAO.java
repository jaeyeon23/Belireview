package believe.review.brw.member;


import java.util.Map;

<<<<<<< HEAD
=======
//
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> 9192b817c639ee458ad08ce1f1d07a751638c7ea
import org.springframework.stereotype.Repository;

import believe.review.brw.common.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {

	
	public void insertMember(Map<String, Object> map) throws Exception {
		insert("member.insertMember",map);
	}
	 
}

