package chat.bean;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class ChatDTO {
	// 시퀀스넘버 
    private int seq;
    // 이름
    private String name;
    // userSeq 
    private String userSeq;
    // content
    private String content;
    // 시간
    private String logtime;
}
