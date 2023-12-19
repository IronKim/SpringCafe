package board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.CommentDTO;
import board.service.BoardService;
import member.bean.MemberDTO;

@Controller
@RequestMapping(value="board")
public class BoardController {
	
	
	@Autowired
	private BoardService boardService;
	
	
	@GetMapping(value="boardWriteForm")
	public String boardWriteFrom() {
		return "/jsp/board/boardWriteForm";
	}
	@GetMapping(value="boardList")
	public String boardlist() {
		return "jsp/board/boardList";
	}
	
	@GetMapping(value="boardView")
	public String boardView(@RequestParam String pg, @RequestParam int seq, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("seq", seq);
		BoardDTO boardDTO = boardService.getBoardView(seq);
		model.addAttribute("writer", boardDTO.getWriter());
		return "jsp/board/boardView";
	}
	@GetMapping(value="boardUpdateForm")
	public String boardUpdateForm(@RequestParam String pg, @RequestParam int seq, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("seq", seq);
		return "jsp/board/boardUpdateForm";
	}
	
	
	
	@PostMapping(value="boardWrite")
	@ResponseBody
	public void boardWrite(@ModelAttribute BoardDTO boardDTO, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String writer = ((MemberDTO)session.getAttribute("memMemberDTO")).getId();
		
		boardDTO.setWriter(writer);

		boardService.boardWrite(boardDTO);
	}
	

	@PostMapping(value="getBoardList")
	@ResponseBody
	public Map<String, Object> getBoardList(@RequestParam(required=false, defaultValue="1") String pg,
			@RequestParam(required=false, defaultValue="100") String id){
		return boardService.getBoardList(pg,id);
	}
	
	@PostMapping(value="getBoardView")
	@ResponseBody
	public BoardDTO getBoardView(@RequestParam int seq, ModelMap model){
		BoardDTO boardDTO = boardService.getBoardView(seq);
		model.put("writer", boardDTO.getWriter());
		
		return boardDTO;
	}
	
	@PostMapping(value="boardUpdate")
	@ResponseBody
	public void boardUpdate(@ModelAttribute BoardDTO boardDTO) {

		boardService.boardUpdate(boardDTO);
	}
	
	@PostMapping(value="boardHit")
	@ResponseBody
	public void boardHit(@RequestParam int seq) {

		boardService.boardHit(seq);
	}
	
	@PostMapping(value="boardDelete")
	@ResponseBody
	public void boardDelete(@RequestParam int seq) {
		boardService.boardDelete(seq);
	}
	
	@PostMapping(value="commentWrite")
	@ResponseBody
	public void commentWrite(@ModelAttribute CommentDTO commentDTO, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String writer = ((MemberDTO)session.getAttribute("memMemberDTO")).getId();

		commentDTO.setWriter(writer);

		boardService.commentWrite(commentDTO);
	}
	

	@PostMapping(value = "getCommentList")
	@ResponseBody
	public List<CommentDTO> getCommentList(@RequestParam int seq,@RequestParam(required=false, defaultValue="0") int sc, ModelMap model) {
	    List<CommentDTO> commentList = boardService.getCommentList(seq,sc);
	    // model.put("writer", commentDTO.getWriter()); 

	    return commentList;
	}
	
	@PostMapping(value="commentDelete")
	@ResponseBody
	public void commentDelete(@RequestParam int commentseq) {
		boardService.commentDelete(commentseq);
	}
	
	@PostMapping(value="commentLastSeq")
	@ResponseBody
	public String commentLastSeq(@RequestParam int seq) {
		return boardService.commentLastSeq(seq);
	}
	
}
