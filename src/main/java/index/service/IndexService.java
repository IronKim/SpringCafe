package index.service;

import java.util.List;

import board.bean.BoardDTO;
import menu.bean.MenuDTO;

public interface IndexService {

	List<MenuDTO> menu();

	List<BoardDTO> board();

	List<BoardDTO> notice();
}
