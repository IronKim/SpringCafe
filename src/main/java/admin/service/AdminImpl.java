package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.AdminDAO;
import member.bean.MemberDTO;
import menu.bean.MenuDTO;
import order.bean.OrderDTO;
import store.bean.StoreDTO;

@Service
public class AdminImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public List<MemberDTO> memberList() {
		return adminDAO.memberList();
	}

	@Override
	public void memberDelete(List<String> deleteData) {
		for(int i = 0;i < deleteData.size();i++) {
			String seq = deleteData.get(i);
			adminDAO.memberDelete(seq);
		}
	}

	@Override
	public void menuAdd(MenuDTO menuDTO) {
		adminDAO.menuAdd(menuDTO);
	}

	@Override
	public List<MenuDTO> menuList() {
		return adminDAO.menuList();
	}

	@Override
	public void menuDelete(List<String> deleteData) {
		for(int i = 0;i < deleteData.size();i++) {
			String seq = deleteData.get(i);
			adminDAO.menuDelete(seq);
		}
	}

	@Override
	public MenuDTO menuSelectOne(String seq) {
		return adminDAO.menuSelectOne(seq);
	}

	@Override
	public void storeAdd(StoreDTO storeDTO) {
		adminDAO.storeAdd(storeDTO);
	}

	@Override
	public List<StoreDTO> storeList() {
		return adminDAO.storeList();
	}

	@Override
	public void storeDelete(List<String> deleteData) {
		for(int i = 0;i < deleteData.size();i++) {
			String seq = deleteData.get(i);
			adminDAO.storeDelete(seq);
		}
	}

	@Override
	public StoreDTO storeSelectOne(String seq) {
		return adminDAO.storeSelectOne(seq);
	}

	@Override
	public void memberPoint(String id, String point) {
		adminDAO.memberPoint(id,point);
	}

	@Override
	public MemberDTO memberSelect(String seq) {
		return adminDAO.memberSelect(seq);
	}

	@Override
	public List<OrderDTO> payList() {
		return adminDAO.payList();
	}

	@Override
	public List<OrderDTO> myPayList(String id) {
		return adminDAO.myPayList(id);
	}

}
