package membership.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Component
@Controller
public class MembershipController {

	@GetMapping(value="membership/membership")
	public String membership() {
		return "jsp/membership/membership";
	}
	
	
//	 @ResponseBody
//	 @PostMapping(value="membership/grade") 
//	 public List<MemberDTO> grade() { 
//		 return membershipService.grade(); 
//	
//	 }
	
//	 @ResponseBody
//	 @PostMapping(value="membership/grade") 
//	 public String grade(HttpServletRequest request) {
//		 HttpSession session = request.getSession();
//		 
//		 String memberDTO = (String)session.getAttribute("memMemberDTO").toString();
//		 System.out.println(memberDTO);
//		 
//		 return memberDTO;
//	 }


}
