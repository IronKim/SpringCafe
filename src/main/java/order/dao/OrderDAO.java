package order.dao;

import java.util.List;

import member.bean.MemberDTO;
import menu.bean.MenuDTO;
import order.bean.OrderDTO;
import store.bean.StoreDTO;

public interface OrderDAO {

	List<MenuDTO> itemList(String id);

	int payment(OrderDTO orderDTO);

	OrderDTO selectPayment(String seq);

	MenuDTO paymentList(String seq);

	List<StoreDTO> storeList(String region);

	List<StoreDTO> storeSearch(String region, String search);

	String storeName(String seq);

	void point(String point,String pointUsed,String id);

	MemberDTO newSession(String id);

	String payNum();
}
