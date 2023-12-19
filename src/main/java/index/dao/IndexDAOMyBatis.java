package index.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;
import menu.bean.MenuDTO;

@Repository
@Transactional
public class IndexDAOMyBatis implements IndexDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MenuDTO> menu() {
		return sqlSession.selectList("indexSQL.menuList");
	}

	@Override
	public List<BoardDTO> board() {
		return sqlSession.selectList("indexSQL.boardList");
	}
	
	@Override
	public List<BoardDTO> notice() {
		return sqlSession.selectList("indexSQL.noticeList");
	}
	
}
