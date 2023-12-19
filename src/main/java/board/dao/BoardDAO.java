package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;
import board.bean.CommentDTO;

public interface BoardDAO {

	public void boardwrite(BoardDTO boardDTO);

	public List<BoardDTO> getBoardList(Map<String, Integer> map);

	
	public int getTotalA(String id);

	public BoardDTO getBoardView(int seq);

	public void boardUpdate(BoardDTO boardDTO);

	public void boardDelete(int seq);

	public void boardHit(int seq);

	public void commentWrite(CommentDTO commentDTO);

	public List<CommentDTO> getCommentList(int seq, int sc);

	public void commentDelete(int commentseq);

	public String commentLastSeq(int seq);




}
