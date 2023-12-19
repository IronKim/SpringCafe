package member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

@Repository
@Transactional
public class MemberDAOMyBatis implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void write(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.write",memberDTO);
		
	}

	@Override
	public int idCheck(String id) {
		int cnt = sqlSession.selectOne("memberSQL.idCheck",id);
		return cnt;
	}


	@Override
	public MemberDTO login(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlSession.selectOne("memberSQL.login",map);
	}

	@Override
	public String pwdCheck(String pwd) {
		String cnt = sqlSession.selectOne("memberSQL.pwdCheck",pwd);
		return cnt;
	}
	
	@Override
	public void update(MemberDTO memberDTO) {
		sqlSession.update("memberSQL.update",memberDTO);

	}
	
	@Override
	public void delete(String id) {
		sqlSession.delete("memberSQL.delete",id);

	}

}
