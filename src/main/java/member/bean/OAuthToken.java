package member.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OAuthToken {
	private String access_token;
	private String token_type;
	private String refresh_token;
	private String id_token;
	private int expires_in;
	private String scope;
	private int refresh_token_expires_in;
}
