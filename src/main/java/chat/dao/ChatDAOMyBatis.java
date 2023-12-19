package chat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import chat.bean.ChatDTO;

@Repository
@Transactional
public class ChatDAOMyBatis implements ChatDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ChatDTO> reload(String seq) {
		return sqlSession.selectList("chatSQL.reload",seq);
	}

	@Override
	public void send(ChatDTO chatDTO) {
		sqlSession.insert("chatSQL.send",chatDTO);
	}

}
