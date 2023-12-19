package menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import menu.bean.MenuDTO;
import menu.dao.MenuDAO;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuDAO menuDAO;

	@Override
	public List<MenuDTO> getMenu() {
		 return menuDAO.getMenu();
		
	}

	

}
