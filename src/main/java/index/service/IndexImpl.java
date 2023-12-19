package index.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import index.dao.IndexDAO;
import menu.bean.MenuDTO;

@Service
public class IndexImpl implements IndexService {

	@Autowired
	private IndexDAO indexDAO;
	
	@Override
	public List<MenuDTO> menu() {
		List<MenuDTO> randomMenu = new ArrayList<MenuDTO>();
		List<MenuDTO> getMenu = indexDAO.menu();
		Random random = new Random();
		while(randomMenu.size() < 5) {
			MenuDTO menuDTO = getMenu.get(random.nextInt(getMenu.size()));
			int sw = 0;
			for(int i = 0;i < randomMenu.size();i++) if(randomMenu.get(i)==menuDTO) sw = 1;
			if(sw == 0) randomMenu.add(menuDTO);
		}
		return randomMenu;
	}

	@Override
	public List<BoardDTO> board() {
		return indexDAO.board();
	}
	@Override
	public List<BoardDTO> notice() {
		return indexDAO.notice();
	}
}
