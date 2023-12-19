package board.service;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;
import board.bean.CommentDTO;

public interface BoardService {

	public void boardWrite(BoardDTO boardDTO);

	public Map<String, Object> getBoardList(String pg, String id);

	public BoardDTO getBoardView(int seq);

	public void boardUpdate(BoardDTO boardDTO);

	public void boardDelete(int seq);

	public void boardHit(int seq);

	public void commentWrite(CommentDTO commentDTO);

	public List<CommentDTO> getCommentList(int seq, int sc);

	public void commentDelete(int commentseq);

	public String commentLastSeq(int seq);




}
