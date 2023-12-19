package order.bean;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class OrderDTO {
    // 시퀀스넘버 
    private Integer seq;

    // 아이디 
    private String id;

    // 메뉴시퀀스 
    private String menuSeq;

    // 개수 
    private String cnt;

    // 총합 
    private Integer total;
    
    // 매장시퀀스 
    private String storeSeq;
    
    // 사용된 포인트
    private Integer pointUsed;
}
