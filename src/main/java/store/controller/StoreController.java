package store.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import store.bean.StoreDTO;
import store.service.StoreService;

@Controller
@RequestMapping(value = "store")
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@GetMapping(value="storeSearch")
	public String storeSearch() {
		return "jsp/store/storeSearch";
	}
	
	@PostMapping(value="storeSearch")
	public String storeOneSearch() {
		return "jsp/store/storeSearch";
	}
	
	@PostMapping(value = "getStoreList")
	@ResponseBody
	public List<StoreDTO> getStoreList(@RequestParam String region){
		List<StoreDTO> list = storeService.getStoreList(region);
		
		return list;
	}
	
	@PostMapping(value = "getStoreListByName")
	@ResponseBody
	public List<StoreDTO> getStoreListByName(@RequestParam String name ) {
		
		List<StoreDTO> list = storeService.getStoreListByName(name);
		
		return list;
	}
}
