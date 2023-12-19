package member.dao;

import member.bean.MemberDTO;

public interface MemberDAO {
	public void write(MemberDTO memberDTO);

	public int idCheck(String id);

	public MemberDTO login(String id, String pwd);

	public String pwdCheck(String pwd);

	public void update(MemberDTO memberDTO);

	public void delete(String id);

	

}
