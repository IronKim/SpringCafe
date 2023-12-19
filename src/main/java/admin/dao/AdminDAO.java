package admin.dao;

import java.util.List;

import member.bean.MemberDTO;
import menu.bean.MenuDTO;
import order.bean.OrderDTO;
import store.bean.StoreDTO;

public interface AdminDAO {
	public List<MemberDTO> memberList();

	public void memberDelete(String seq);

	public void menuAdd(MenuDTO menuDTO);

	public List<MenuDTO> menuList();

	public void menuDelete(String seq);

	public MenuDTO menuSelectOne(String seq);

	public void storeAdd(StoreDTO storeDTO);

	public List<StoreDTO> storeList();

	public void storeDelete(String seq);

	public StoreDTO storeSelectOne(String seq);

	public void memberPoint(String id, String point);

	public MemberDTO memberSelect(String seq);

	public List<OrderDTO> payList();

	public List<OrderDTO> myPayList(String id);
}
