<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "rkkypWiwBEBwntMSFU8E", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8080/miniProject/", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	
naverLogin.init();
window.addEventListener('load', function () {
    naverLogin.getLoginStatus(function (status) {
 
    if (status) {
       
       
        var email = naverLogin.user.getEmail();
        var id = naverLogin.user.getId();
        var name = naverLogin.user.getName();
        
        console.log(naverLogin.accessToken.accessToken);
 
        $.ajax({
            type: 'post',
            url: '/miniProject/member/naverSave',
            data: {'n_email':email, 'n_id':id, 'n_name':name, 'accessToken' : naverLogin.accessToken.accessToken},
            dataType: 'text',
            success: function(result) {
                if(result=='ok') {
                	console.log('성공')
                    location.href="http://localhost:8080/miniProject/"; 
                } else if(result==null) {
                    console.log('실패')
                    location.href="http://localhost:8080/miniProject/";
                }
            },
            error: function(result) {
                console.log('오류 발생')
            }
        });
        
 
    } else {
        console.log("callback 처리에 실패하였습니다.");
    }
    });
});
</script>
</body>
</html>