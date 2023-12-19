package menu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import menu.bean.MenuDTO;
import menu.service.MenuService;

@Controller
@RequestMapping(value = "menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	@PostMapping(value="menuForm")
	@ResponseBody
	public List<MenuDTO> getMenu() {
		List list = menuService.getMenu();
		return list;
	}
	
	@GetMapping(value="menuForm")
	public String showMenu(ModelMap model) {
		List list = menuService.getMenu();
		model.put("menu", list);
		return "jsp/menu/menuForm";
	}

}
