package auth.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import auth.service.AuthService;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@PropertySource("classpath:spring/sms.properties")
@Controller
public class AuthController {
	
	@Value("${sms.APIKey}")
	private String APIKey;
	
	@Value("${sms.secretKey}")
	private String secretKey;
	
	@Value("${sms.fromNumber}")
	private String fromNumber;
	
	DefaultMessageService messageService;
	
	@Autowired
	AuthService authService;
	
	
	@GetMapping("sms")
	public String sms() {
		return "jsp/auth/sms";
	}
	
	//문자인증
	@PostMapping("smsSend")
	@ResponseBody
	public String smsSend(@RequestParam String tel) {
		if(messageService == null)
			messageService = NurigoApp.INSTANCE.initialize(APIKey, secretKey, "https://api.coolsms.co.kr");
		
		Message message = new Message();
		
		String code = randomRange(6);
		
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom(fromNumber);
        message.setTo(tel);
        message.setText("[SpringCafe] 인증번호는 " + code + " 입니다.");

        SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);
        
        return code;
	}
	
	// 인증번호 범위 지정
    public String randomRange(int digit) {
    	 Random rand  = new Random();
         String numStr = "";
         for(int i=0; i<digit; i++) {
             String ran = Integer.toString(rand.nextInt(10));
             numStr+=ran;
         }
         return numStr;
    }
	
	@GetMapping("email")
	public String email() {
		return "jsp/auth/email";
	}
	
	//이메일 인증
	@GetMapping("emailSend")
	@ResponseBody
	public String emailSend(String email) {
		return authService.joinEmail(email);
	}
	
}
