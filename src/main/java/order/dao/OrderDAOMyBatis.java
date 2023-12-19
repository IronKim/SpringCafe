package order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;
import menu.bean.MenuDTO;
import order.bean.OrderDTO;
import store.bean.StoreDTO;

@Repository
@Transactional
public class OrderDAOMyBatis implements OrderDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<MenuDTO> itemList(String id) {
		return sqlSession.selectList("orderSQL.itemList",id);
	}

	@Override
	public int payment(OrderDTO orderDTO) {
		sqlSession.insert("orderSQL.payment",orderDTO);
		return sqlSession.selectOne("orderSQL.orderNum");
	}

	@Override
	public OrderDTO selectPayment(String seq) {
		return sqlSession.selectOne("orderSQL.selectPayment",seq);
	}

	@Override
	public MenuDTO paymentList(String seq) {
		return sqlSession.selectOne("orderSQL.paymentList",seq);
	}

	@Override
	public List<StoreDTO> storeList(String region) {
		return sqlSession.selectList("orderSQL.storeList",region);
	}

	@Override
	public List<StoreDTO> storeSearch(String region, String search) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("region", region);
		map.put("search", search);
		return sqlSession.selectList("orderSQL.storeSearch",map);
	}

	@Override
	public String storeName(String seq) {
		return sqlSession.selectOne("orderSQL.storeName",seq);
	}

	@Override
	public void point(String point,String pointUsed, String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("point", point);
		map.put("pointUsed", pointUsed);
		map.put("id", id);
		sqlSession.update("orderSQL.point",map);
	}

	@Override
	public MemberDTO newSession(String id) {
		return sqlSession.selectOne("orderSQL.newSession",id);
	}

	@Override
	public String payNum() {
		return sqlSession.selectOne("orderSQL.payNum");
	}
}
