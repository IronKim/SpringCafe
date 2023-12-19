package board.bean;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class CommentDTO {

	//seq
	private int commentseq;
	// 게시글seq
	private int seq;
    // 작성자 
    private String writer;
    // 댓글 
    private String text;
    // 작성일 
    private Timestamp logtime;
	
}
