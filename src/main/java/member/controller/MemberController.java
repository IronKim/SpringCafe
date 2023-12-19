package member.controller;



import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import member.bean.KakaoProfile;
import member.bean.MemberDTO;
import member.bean.OAuthToken;
import member.service.MemberService;

@Controller
@RequestMapping(value = "member")
public class MemberController {

	 @Autowired
	 private MemberService memberService;
	
	 @GetMapping("loginForm") 
	 public String loginForm() {
		 return "jsp/member/loginForm";
	 }
	 @PostMapping("writeForm") 
	 public String writeForm(HttpServletRequest request, ModelMap model) {
		 String email1 = request.getParameter("userEmail1");
		 String email2 = request.getParameter("userEmail2");
		 String tel = request.getParameter("tel");

		 if(email1 !=null) {
			 model.put("email1", email1);
			 model.put("email2", email2);
		 }
		 
		 if(tel !=null) {
			 if(tel.matches(".*-.*")) {
				tel = tel.replaceAll("-", "");
			 }
			 model.put("tel1", tel.substring(0, 3));
			 model.put("tel2", tel.substring(3, 7));
			 model.put("tel3", tel.substring(7));
		 }
		 
		 return "jsp/member/writeForm";
	 } 
	 @PostMapping("write") 
	 @ResponseBody
	 public void write(@ModelAttribute MemberDTO memberDTO) {
		 System.out.println(memberDTO.toString());
		 memberService.write(memberDTO);
	 }
	 @RequestMapping(value = "idCheck")
	 @ResponseBody
	 public int idCheck(@RequestParam("id")String id) {
		 int cnt = memberService.idCheck(id);
		 return cnt;
	 }
	 
	 @RequestMapping(value = "login", method = RequestMethod.POST)
	 @ResponseBody
	 public boolean login(@RequestParam String id, @RequestParam String pwd, HttpServletRequest req){
		 HttpSession session = req.getSession();

		 MemberDTO memberDTO = memberService.login(id, pwd);

		 System.out.println(memberDTO);
		 if(memberDTO != null) {
			 session.setAttribute("memMemberDTO", memberDTO);
			 return true;
		 }
		 
		return false;
		 
		 
	 }
	 
	 @GetMapping("myPage") 
	 public String myPage() {
		 return "jsp/member/myPage";
	 } 
	 
	 @GetMapping("pwdCheck") 
	 public String pwdCheck(HttpServletRequest req) {
		 HttpSession session = req.getSession();
		 if(session.getAttribute("kakaoToken") != null) {
			 return "jsp/member/updateForm";
		 }
		 
		 if(session.getAttribute("n_Token") != null) {
			 return "jsp/member/updateForm";
		 }
		 
		 return "jsp/member/pwdCheck";
		 
		 
	 } 
	 
	 @PostMapping("pwdCheck")
	 @ResponseBody
	 public String pwdCheck(@RequestParam("pwd")String pwd) {
		 String cnt = memberService.pwdCheck(pwd);
		 
		 return cnt;
	 }
	 
	 @GetMapping("updateForm") 
	 public String updateForm() {
		 return "jsp/member/updateForm";
	 } 
	 
	 @PostMapping("update") 
	 @ResponseBody
	 public void update(@ModelAttribute MemberDTO memberDTO, HttpServletRequest req) {
		 HttpSession session = req.getSession();
		 System.out.println(memberDTO.toString());
		 memberService.update(memberDTO);
		 if(memberDTO != null) {
			 session.removeAttribute("memMemberDTO");
			 session.setAttribute("memMemberDTO", memberDTO);
		 }
	 }
	 
	 @PostMapping("delete") 
	 @ResponseBody
	 public void delete(@RequestParam String id, HttpServletRequest req) {
		 HttpSession session = req.getSession();
		 
		 String token = (String)session.getAttribute("kakaoToken");
		 String ntoken = (String)session.getAttribute("n_Token");
		 
		 
		 if(token != null) {
			 RestTemplate rt = new RestTemplate();
			 
			 String target_id = ((MemberDTO)session.getAttribute("memMemberDTO")).getPwd();
			 
			 HttpHeaders headers = new HttpHeaders();
			 headers.add("Content-Type", "application/x-www-form-urlencoded");
			 headers.add("Authorization","Bearer " + token);
			 
			 MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			 params.add("target_id_type", "user_id");
			 params.add("target_id", target_id);
			 
				
			HttpEntity<MultiValueMap<String, String>> unlinkRequest = new HttpEntity<>(params, headers);
			 
			
			ResponseEntity<String> response = rt.exchange(
					"https://kapi.kakao.com/v1/user/unlink", 
					HttpMethod.POST, 
					unlinkRequest, 
					String.class 
			);
				
		 }
		 if (ntoken != null) {
			try {
		        String revokeUrl = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=rkkypWiwBEBwntMSFU8E&client_secret=BGYP3upLvT&access_token="+ntoken+"&service_provider=NAVER";
		        URL url = new URL(revokeUrl);
		        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		        connection.setRequestMethod("GET");

		        int responseCode = connection.getResponseCode();
		        if (responseCode == 200) {
		            // 토큰 폐기에 성공한 경우
		            System.out.println("토큰이 성공적으로 폐기되었습니다.");
		        } else {
		            // 토큰 폐기에 실패한 경우
		            System.out.println("토큰 폐기에 실패하였습니다.");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
		 
		 
		 session.invalidate();
		 memberService.delete(id);
	 }
	 
	 
	 @GetMapping(value = "authForm")
	 public String authForm() {
		 return "jsp/member/authForm";
	 }
	 
	 @GetMapping("auth/kakao/callback")
	 public String kakaoCallback(String code, HttpServletRequest req) {
		 
		 RestTemplate rt = new RestTemplate();
		 
		 HttpHeaders headers = new HttpHeaders();
		 headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		 
		 MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			params.add("grant_type", "authorization_code");
			params.add("client_id", "c4a0be65c83d074e043a3662d1fe649f");
			params.add("redirect_uri", "http://localhost:8080/miniProject/member/auth/kakao/callback");
			params.add("code", code);
			params.add("prompt", "login");
			
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
		
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token", 
				HttpMethod.POST, 
				kakaoTokenRequest, 
				String.class 
		);
		
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		
		try {
			oauthToken= objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		RestTemplate rt2 = new RestTemplate();
		 
		 HttpHeaders headers2 = new HttpHeaders();
		 headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		 headers2.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		 	
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);
		
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me", 
				HttpMethod.POST, 
				kakaoProfileRequest2, 
				String.class 
		);
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		
		try {
			kakaoProfile= objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		 
		String id = "Kakao" + kakaoProfile.getProperties().getNickname();
		String pwd = String.valueOf(kakaoProfile.getId());
		String name = kakaoProfile.getProperties().getNickname();
		String email = kakaoProfile.getKakao_account().getEmail() != null ? kakaoProfile.getKakao_account().getEmail() : "";
		
		HttpSession session = req.getSession();
		
		MemberDTO memberDTO = null;
		
		memberDTO = memberService.login(id, pwd);
		
		if(memberDTO == null) {
			
			memberDTO = new MemberDTO();
			
			memberDTO.setId( id);
			memberDTO.setPwd(pwd);
			memberDTO.setName(name);
			memberDTO.setEmail(email);
			memberDTO.setPhoneNumber("");
			memberDTO.setAddress("");
			
			memberService.write(memberDTO);
		}
		session.setAttribute("memMemberDTO", memberDTO);
		session.setAttribute("kakaoToken", oauthToken.getAccess_token());
		
		return "redirect:/";
	 }
	 
	 @GetMapping("auth/naver/callback")
	 public String naverCallback() {
		 
		 
		return "jsp/member/callback";
		 
	 }
	 @RequestMapping(value="naverSave", method=RequestMethod.POST)
	 @ResponseBody
	    public String naverSave(HttpServletRequest req, @RequestParam("n_email") String n_email,@RequestParam("n_id") String n_id, 
	    		@RequestParam("n_name") String n_name, @RequestParam String accessToken) {
		 HttpSession session = req.getSession();
		 
 
		 String id = "Naver" + n_name;
		 String pwd = n_name;
		 String name = n_name;
		 String email = n_email;
			
			MemberDTO memberDTO = null;
			
			memberDTO = memberService.login(id, pwd);
			
			if(memberDTO == null) {
				
				memberDTO = new MemberDTO();
				
				memberDTO.setId(id);
				memberDTO.setPwd(pwd);
				memberDTO.setName(name);
				memberDTO.setEmail(email);
				memberDTO.setPhoneNumber("");
				memberDTO.setAddress("");

				
				memberService.write(memberDTO);
		 
	    
	    }
			session.setAttribute("memMemberDTO", memberDTO);
			session.setAttribute("n_Token", accessToken);
			
			return "ok";

	    }
	 
	// 로그아웃
	@PostMapping("logout")
	@ResponseBody
	public void logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		
		//String ntoken = (String)session.getAttribute("n_Token");
		String token = (String)session.getAttribute("kakaoToken");
		String id = ((MemberDTO)session.getAttribute("memMemberDTO")).getPwd();
		
		if(token != null) {
			RestTemplate rt = new RestTemplate();
			
			HttpHeaders headers = new HttpHeaders();
			 headers.add("Authorization", "Bearer " + token);
			
			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			params.add("target_id_type", "user_id");
			params.add("target_id", id);
				
			HttpEntity<MultiValueMap<String, String>> kakaoLogoutRequest = new HttpEntity<>(params, headers);
			
			ResponseEntity<String> response = rt.exchange(
					"https://kapi.kakao.com/v1/user/logout", 
					HttpMethod.POST, 
					kakaoLogoutRequest, 
					String.class 
			);
		}

		
		session.invalidate();
		
	}
}
