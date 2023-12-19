package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.bean.CommentDTO;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private BoardPaging boardPaging;
	
	
	@Override
	public void boardWrite(BoardDTO boardDTO) {
		if(!boardDTO.getId().equals("200")) boardDTO.setId("100");
		boardDAO.boardwrite(boardDTO);
		
	}



	
	

	@Override
	public Map<String, Object> getBoardList(String pg,String id) {
		
		//1페이지당 3개씩
		int endNum = (Integer.parseInt(pg) - 1) * 10;
		int startNum = 10;
		
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("id", Integer.parseInt(id));
		
		List<BoardDTO> list = boardDAO.getBoardList(map);
		
		
		//페이징 처리
		int totalA = boardDAO.getTotalA(id) ; //총 글수 
		//int totalP = (totalA + pageSize - 1)/pageSize; //총 페이지 수
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(totalA);

		boardPaging.makePagingHTML();
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("boardPaging", boardPaging);
		
		return map2;
		
		
	}


	@Override
	public BoardDTO getBoardView(int seq) {
		return boardDAO.getBoardView(seq);
	}






	@Override
	public void boardUpdate(BoardDTO boardDTO) {
		boardDAO.boardUpdate(boardDTO);
	}






	@Override
	public void boardDelete(int seq) {
		boardDAO.boardDelete(seq);
		
	}






	@Override
	public void boardHit(int seq) {
		boardDAO.boardHit(seq);
	}






	@Override
	public void commentWrite(CommentDTO commentDTO) {
		boardDAO.commentWrite(commentDTO);
		
	}






	@Override
	public List<CommentDTO> getCommentList(int seq,int sc) {
		
		return boardDAO.getCommentList(seq,sc);
	}






	@Override
	public void commentDelete(int commentseq) {
		boardDAO.commentDelete(commentseq);
		
	}






	@Override
	public String commentLastSeq(int seq) {
		return boardDAO.commentLastSeq(seq);
	}





















	
}
