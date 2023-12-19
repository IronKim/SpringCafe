package member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public void write(MemberDTO memberDTO) {
		memberDAO.write(memberDTO);
		
	}

	@Override
	public int idCheck(String id) {
		int cnt = memberDAO.idCheck(id);
		return cnt;
	}


	@Override
	public MemberDTO login(String id, String pwd) {
		
		return memberDAO.login(id, pwd);
	}

	@Override
	public String pwdCheck(String pwd) {
		String cnt = memberDAO.pwdCheck(pwd);
		return cnt;
	}
	
	@Override
	public void update(MemberDTO memberDTO) {
		memberDAO.update(memberDTO);

	}
	
	@Override
	public void delete(String id) {
		memberDAO.delete(id);

	}

}
