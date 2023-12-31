package kakao.api;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomMessageService {

    @Autowired
    MessageService messageService;

    public void sendMessage(String token,String order) {
        DefaultMessageDto myMsg = new DefaultMessageDto();
        myMsg.setMobileUrl("http://localhost:8080/miniProject/order/send");
        myMsg.setObjType("text");
        myMsg.setWebUrl("http://localhost:8080/miniProject/order/send");
        myMsg.setText(order);
  
        messageService.sendToFriendMessage(token, myMsg);
    }
}
