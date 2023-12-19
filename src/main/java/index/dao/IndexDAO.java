package index.dao;

import java.util.List;

import board.bean.BoardDTO;
import menu.bean.MenuDTO;

public interface IndexDAO {
	public List<MenuDTO> menu();

	public List<BoardDTO> board();

	List<BoardDTO> notice();
}
