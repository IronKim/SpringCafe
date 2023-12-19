package index.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import board.bean.BoardDTO;
import index.service.IndexService;
import menu.bean.MenuDTO;

@Component
@Controller
public class IndexController {

	@Autowired
	private IndexService indexService;
	
	@PostMapping(value="index/menu")
	@ResponseBody
	public List<MenuDTO> menu(){
		return indexService.menu();
	}
	@PostMapping(value="index/board")
	@ResponseBody
	public List<BoardDTO> board(){
		return indexService.board();
	}
	@PostMapping(value="index/notice")
	@ResponseBody
	public List<BoardDTO> notice(){
		return indexService.notice();
	}
}
