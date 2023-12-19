package store.bean;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class StoreDTO {
	// 시퀀스넘버 
    private int seq;
    // 가게이름 
    private String name;
    // 지역 
    private String region;
    // 매장 주소 
    private String address;
    // 매장전화번호 
    private String tel;
}
