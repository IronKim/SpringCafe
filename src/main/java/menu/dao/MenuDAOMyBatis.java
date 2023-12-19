package menu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import menu.bean.MenuDTO;

@Repository
@Transactional
public class MenuDAOMyBatis implements MenuDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MenuDTO> getMenu() {
		return sqlSession.selectList("menuSQL.getMenu");
	}

}
