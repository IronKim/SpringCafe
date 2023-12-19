package member.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class KakaoProfile {

	private Long id;
	private String connected_at;
	private Properties properties;
	private KakaoAccount kakao_account;
	
	
	@Getter
	@Setter
	public class Properties {

		private String nickname;

	}
	
	@Getter
	@Setter
	public class KakaoAccount {

		private Boolean profile_nickname_needs_agreement;
		private Profile profile;
		private Boolean has_email;
		private Boolean email_needs_agreement;
		private Boolean is_email_valid;
		private Boolean is_email_verified;
		private String email;
		
		@Getter
		@Setter
		public class Profile {

			private String nickname;
		}
		
		
	}
	
}
