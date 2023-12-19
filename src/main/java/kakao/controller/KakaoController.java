package kakao.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kakao.api.CustomMessageService;
import kakao.api.GetToken;

@Component
@PropertySource("classpath:spring/token.properties")
@Controller
public class KakaoController {
	
	private String id = "3f565d247c5c13e62128504de6d8297d";
	private String secret = "kM3XRBf2m74OuRoEMED3rU7Xjum7kMSX";
			
	@Autowired
    CustomMessageService customMessageService;
	@Autowired
	GetToken getToken;
	
	@Value("${refresh.token}")
	private String refreshToken;
	
	@ResponseBody
	@RequestMapping("order/send")
	public void serviceStart(@RequestParam String order) {
		String token = getToken.refreshAccessToken(refreshToken, id, secret);
		customMessageService.sendMessage(token,order);//토큰 넣는곳
	}
	
	@ResponseBody
	@PostMapping("order/pay")
	public String pay(@RequestParam String id,String itemName,String cnt,String tot) {
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection con = (HttpURLConnection) address.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK da9def091df5428fb2160738d4803901");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoOutput(true);
			String param = "cid=TC0ONETIME&partner_order_id="+"ah"+"&partner_user_id="+id+
			"&item_name="+URLEncoder.encode(itemName,"utf-8")+"&quantity="+cnt+"&total_amount="+tot+"&tax_free_amount="+Integer.parseInt(tot)/10+
			"&approval_url=http://localhost:8080/miniProject/order/payOk"+
			"&cancel_url=http://localhost:8080/miniProject/order/payNo"+
			"&fail_url=http://localhost:8080/miniProject/order/payNo";
			OutputStream outputStream = con.getOutputStream();
			DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
			dataOutputStream.writeBytes(param);
			dataOutputStream.flush();
			dataOutputStream.close();
			
			int conResult = con.getResponseCode();
			System.out.println(conResult);
			InputStream inputStream;
			if (conResult == 200) {
				inputStream = con.getInputStream();
			} else {
				inputStream = con.getErrorStream();
			}
			
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			
			return bufferedReader.readLine();
		} catch (MalformedURLException e) {
			return "{'result':'fail'}";
		} catch (IOException e) {
			return "{'result':'fail'}";
		}
	}
	
	@ResponseBody
	@GetMapping("admin/token")
	public String tokenCreate(@RequestParam String code) {
		return getToken.Token(code,id,secret) + "\n\n\n token update success";
	}
	
}
