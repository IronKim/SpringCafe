package menu.bean;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class MenuDTO {
	// 시퀀스넘버 
    private int seq;
    // 메뉴 고유 아이디 
    private int id;
    // 메뉴이름 
    private String name;
    // 가격 
    private String price;
    // 이미지 주소
    private String image;
    // 메뉴 설명 
    private String content;
}
