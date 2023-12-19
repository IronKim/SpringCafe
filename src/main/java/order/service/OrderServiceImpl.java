package order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import menu.bean.MenuDTO;
import order.bean.OrderDTO;
import order.dao.OrderDAO;
import store.bean.StoreDTO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO orderDAO;
	
	@Override
	public List<MenuDTO> itemList(String id) {
		return orderDAO.itemList(id);
	}

	@Override
	public int payment(OrderDTO orderDTO) {
		return orderDAO.payment(orderDTO);
	}

	@Override
	public OrderDTO selectPayment(String seq) {
		return orderDAO.selectPayment(seq);
	}

	@Override
	public MenuDTO paymentList(String seq) {
		return orderDAO.paymentList(seq);
	}

	@Override
	public List<StoreDTO> storeList(String region) {
		return orderDAO.storeList(region);
	}

	@Override
	public List<StoreDTO> storeSearch(String region, String search) {
		if (search.equals("")) return null;
		else return orderDAO.storeSearch(region,search);
	}

	@Override
	public String storeName(String seq) {
		return orderDAO.storeName(seq);
	}

	@Override
	public void point(String point,String pointUsed,String id) {
		orderDAO.point(point,pointUsed,id);
	}

	@Override
	public MemberDTO newSession(String id) {
		return orderDAO.newSession(id);
	}

	@Override
	public String payNum() {
		return orderDAO.payNum();
	}
}
