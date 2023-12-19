package admin.service;

import java.util.List;

import member.bean.MemberDTO;
import menu.bean.MenuDTO;
import order.bean.OrderDTO;
import store.bean.StoreDTO;

public interface AdminService {
	public List<MemberDTO> memberList();

	public void memberDelete(List<String> deleteData);

	public void menuAdd(MenuDTO menuDTO);

	public List<MenuDTO> menuList();

	public void menuDelete(List<String> deleteData);

	public MenuDTO menuSelectOne(String seq);

	public void storeAdd(StoreDTO storeDTO);

	public List<StoreDTO> storeList();

	public void storeDelete(List<String> deleteData);

	public StoreDTO storeSelectOne(String seq);

	public void memberPoint(String id, String point);

	public MemberDTO memberSelect(String seq);

	public List<OrderDTO> payList();

	public List<OrderDTO> myPayList(String id);
}
