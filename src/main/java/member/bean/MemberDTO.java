package member.bean;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class MemberDTO {
	// 시퀀스넘버 
    private int seq;
    // 아이디 
    private String id;
    // 비밀번호 
    private String pwd;
    // 이름 
    private String name;
    // 이메일 
    private String email;
    // 핸드폰번호 
    private String phoneNumber;
    // 주소 
    private String address;
    // 마일리지 
    private int point;
    // 사용 마일리지 
    private int pointUsed;
}
