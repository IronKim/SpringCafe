package admin.dao;

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
public class AdminDAOMyBatis implements AdminDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> memberList() {
		return sqlSession.selectList("adminSQL.memberList");
	}

	@Override
	public void memberDelete(String seq) {
		sqlSession.delete("adminSQL.memberDelete",seq);
	}

	@Override
	public void menuAdd(MenuDTO menuDTO) {
		sqlSession.insert("adminSQL.menuAdd",menuDTO);
	}

	@Override
	public List<MenuDTO> menuList() {
		return sqlSession.selectList("adminSQL.menuList");
	}

	@Override
	public void menuDelete(String seq) {
		sqlSession.delete("adminSQL.menuDelete",seq);
	}

	@Override
	public MenuDTO menuSelectOne(String seq) {
		return sqlSession.selectOne("adminSQL.menuSelectOne",seq);
	}

	@Override
	public void storeAdd(StoreDTO storeDTO) {
		sqlSession.insert("adminSQL.storeAdd",storeDTO);
	}

	@Override
	public List<StoreDTO> storeList() {
		return sqlSession.selectList("adminSQL.storeList");
	}

	@Override
	public void storeDelete(String seq) {
		sqlSession.delete("adminSQL.storeDelete",seq);
	}

	@Override
	public StoreDTO storeSelectOne(String seq) {
		return sqlSession.selectOne("adminSQL.storeSelectOne",seq);
	}

	@Override
	public void memberPoint(String id, String point) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("point", point);
		map.put("id", id);
		sqlSession.update("adminSQL.point",map);
	}

	@Override
	public MemberDTO memberSelect(String seq) {
		return sqlSession.selectOne("adminSQL.memberSelect",seq);
	}

	@Override
	public List<OrderDTO> payList() {
		return sqlSession.selectList("adminSQL.payList");
	}

	@Override
	public List<OrderDTO> myPayList(String id) {
		return sqlSession.selectList("adminSQL.myPayList",id);
	}

}
