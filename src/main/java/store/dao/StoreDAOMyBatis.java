package store.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import store.bean.StoreDTO;

@Repository
@Transactional
public class StoreDAOMyBatis implements StoreDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<StoreDTO> getStoreList(String region) {
		return sqlSession.selectList("storeSQL.getStoreList", region);
	}

	@Override
	public List<StoreDTO> getStoreListByName(String name) {
		return sqlSession.selectList("storeSQL.getStoreListByName", name);
	}

}
