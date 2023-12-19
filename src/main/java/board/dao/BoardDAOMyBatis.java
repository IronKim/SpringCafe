package board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;
import board.bean.CommentDTO;




@Repository
@Transactional
public class BoardDAOMyBatis implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void boardwrite(BoardDTO boardDTO) {
	
		sqlSession.insert("boardSQL.boardWrite",boardDTO);
		
	}

	
	@Override
	
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("boardSQL.getBoardList", map);
	}
	/*
	public List<BoardDTO> getBoardList(BoardDTO boardDTO) {
	    return sqlSession.selectList("boardSQL.getBoardList", boardDTO);
	}
*/
	@Override
	public int getTotalA(String id) {
		return sqlSession.selectOne("boardSQL.getTotalA",id);
	}


	@Override
	public BoardDTO getBoardView(int seq) {
		return sqlSession.selectOne("boardSQL.getBoardView", seq);
	}


	@Override
	public void boardUpdate(BoardDTO boardDTO) {
		sqlSession.update("boardSQL.boardUpdate",boardDTO);
		
	}


	@Override
	public void boardDelete(int seq) {
		sqlSession.delete("boardSQL.boardDelete",seq);
		
	}


	@Override
	public void boardHit(int seq) {
		sqlSession.update("boardSQL.boardHit",seq);
		
	}


	@Override
	public void commentWrite(CommentDTO commentDTO) {
		sqlSession.insert("boardSQL.commentWrite",commentDTO);
		
	}


	@Override
	public List<CommentDTO> getCommentList(int seq,int sc) {
		Map<String, Integer> paramMap = new HashMap<>();
	    paramMap.put("seq", seq);
	    paramMap.put("offset", (sc*7));
	    paramMap.put("limit", 7);
	    return sqlSession.selectList("boardSQL.getCommentList", paramMap);
		//return sqlSession.selectList("boardSQL.getCommentList", seq);
	}


	@Override
	public void commentDelete(int commentseq) {
		sqlSession.delete("boardSQL.commentDelete",commentseq);
		
	}


	@Override
	public String commentLastSeq(int seq) {
		return sqlSession.selectOne("boardSQL.commentLastSeq",seq);
	}









}
