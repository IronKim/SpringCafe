package order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import menu.bean.MenuDTO;
import order.bean.OrderDTO;
import order.service.OrderService;
import store.bean.StoreDTO;
@Component
@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@GetMapping(value="order/order")
	public String order() {
		return "jsp/order/order";
	}
	
	@GetMapping(value="order/payOk")
	public String payOk() {
		return "jsp/order/payOk";
	}
	
	@GetMapping(value="order/payNo")
	public String payNo() {
		return "jsp/order/payNo";
	}
	
	@GetMapping(value="order/complete")
	public String complete() {
		return "jsp/order/orderComplete";
	}
	
	/*
	 * @PostMapping(value="order/complete") public ModelAndView result(@RequestParam
	 * String seq) { ModelAndView mav = new ModelAndView();
	 * mav.addObject("seq",seq); mav.setViewName("jsp/order/orderComplete"); return
	 * mav; }
	 */
	
	@ResponseBody
	@PostMapping(value="order/payment")
	public int payment(@ModelAttribute OrderDTO orderDTO) {
		return orderService.payment(orderDTO);
	}
	
	@ResponseBody
	@PostMapping(value="order/itemList")
	public List<MenuDTO> itemList(@RequestParam String id) {
		return orderService.itemList(id);
	}
	
	@ResponseBody
	@PostMapping(value="order/item")
	public MenuDTO item(@RequestParam String seq) {
		return orderService.paymentList(seq);
	}
	
	@ResponseBody
	@PostMapping(value="order/selectPayment")
	public OrderDTO selectPayment(@RequestParam String seq) {
		return orderService.selectPayment(seq);
	}
	
	@ResponseBody
	@PostMapping(value="order/paymentList")
	public Map<String, Object> paymentList(@RequestParam String seq,@RequestParam String num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", orderService.paymentList(seq));
		map.put("num", num);
		return map;
	}
	
	@ResponseBody
	@PostMapping(value="order/storeList")
	public List<StoreDTO> storeList(@RequestParam String region) {
		return orderService.storeList(region);
	}
	
	@ResponseBody
	@PostMapping(value="order/storeSearch")
	public List<StoreDTO> storeList(@RequestParam String region,@RequestParam String search) {
		return orderService.storeSearch(region,search);
	}
	
	@ResponseBody
	@PostMapping(value="order/storeName", produces = "text/plain;charset=UTF-8")
	public String storeName(@RequestParam String seq) {
		return orderService.storeName(seq);
	}
	
	@ResponseBody
	@PostMapping(value="order/point")
	public void point(@RequestParam String point,@RequestParam String pointUsed,@RequestParam String id,HttpServletRequest req) {
		HttpSession session = req.getSession();
		orderService.point(point,pointUsed,id);
		session.removeAttribute("memMemberDTO");
		session.setAttribute("memMemberDTO", orderService.newSession(id));
	}
	
	@ResponseBody
	@PostMapping(value="order/payNum")
	public String orderNum() {
		return orderService.payNum();
	}
}
