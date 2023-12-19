package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.service.AdminService;
import member.bean.MemberDTO;
import menu.bean.MenuDTO;
import order.bean.OrderDTO;
import store.bean.StoreDTO;
@Component
@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@GetMapping(value="admin/admin")
	public String admin() {
		return "jsp/admin/admin";
	}
//맴버
	@ResponseBody
	@PostMapping(value="admin/memberList")
	public List<MemberDTO> memberList() {
		return adminService.memberList();
	}
	
	@ResponseBody
	@PostMapping(value="admin/memberDelete")
	public void memberDelete(@RequestBody List<String> deleteData) {
		adminService.memberDelete(deleteData);
	}
	@ResponseBody
	@PostMapping(value="admin/memberPoint")
	public void memberPoint(@RequestParam String id,@RequestParam String point) {
		adminService.memberPoint(id,point);
	}
	@ResponseBody
	@PostMapping(value="admin/memberSelect")
	public MemberDTO memberSelect(@RequestParam String seq) {
		return adminService.memberSelect(seq);
	}
//메뉴
	@ResponseBody
	@PostMapping(value="admin/menuAdd")
	public void menuAdd(@ModelAttribute MenuDTO menuDTO) {
		adminService.menuAdd(menuDTO);
	}
	
	@ResponseBody
	@PostMapping(value="admin/menuList")
	public List<MenuDTO> menuList() {
		return adminService.menuList();
	}
	
	@ResponseBody
	@PostMapping(value="admin/menuDelete")
	public void menuDelete(@RequestBody List<String> deleteData) {
		adminService.menuDelete(deleteData);
	}
	
	@ResponseBody
	@PostMapping(value="admin/menuSelectOne")
	public MenuDTO menuSelectOne(@RequestParam String seq) {
		return adminService.menuSelectOne(seq);
	}
//매장
	@ResponseBody
	@PostMapping(value="admin/storeAdd")
	public void menuAdd(@ModelAttribute StoreDTO storeDTO) {
		adminService.storeAdd(storeDTO);
	}
	
	@ResponseBody
	@PostMapping(value="admin/storeList")
	public List<StoreDTO> storeList() {
		return adminService.storeList();
	}
	
	@ResponseBody
	@PostMapping(value="admin/storeDelete")
	public void storeDelete(@RequestBody List<String> deleteData) {
		adminService.storeDelete(deleteData);
	}
	
	@ResponseBody
	@PostMapping(value="admin/storeSelectOne")
	public StoreDTO storeSelectOne(@RequestParam String seq) {
		return adminService.storeSelectOne(seq);
	}
//주문내역
	@ResponseBody
	@PostMapping(value="admin/payList")
	public List<OrderDTO> payList() {
		return adminService.payList();
	}
	@ResponseBody
	@PostMapping(value="admin/myPayList")
	public List<OrderDTO> myPayList(@RequestParam String id) {
		return adminService.myPayList(id);
	}
}
