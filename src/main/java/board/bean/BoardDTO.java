package board.bean;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class BoardDTO {
	// 시퀀스넘버 
    private int seq;
	// 제목 
    private String subject;
    // 내용 
    private String content;
    // 조회수 
    private String hit;
    // 작성자 
    private String writer;
    // 작성일 
    private Timestamp logtime;
    // 분류코드
    private String id;
}
