<div align="center" >
<img src="https://github.com/IronKim/SpringCafe/blob/main/src/main/webapp/WEB-INF/image/1.png?raw=true">
</div>

# SpringCafe(9/25 ~ 10/13)
비트캠프 미니프로젝트 (주제: 카페)

<div align="center">

  ### Languages
  <div>
    <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white"/>
    <img src="https://img.shields.io/badge/CSS-1572B6?style=flat&logo=css3&logoColor=white"/>
    <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white"/>
    <img src="https://img.shields.io/badge/Java-007396?style=flat-square&logo=Java&logoColor=white"/>
  </div>

<br>

  ### Technologies
  <div>
    <img src="https://img.shields.io/badge/Git-F05032?style=flat&logo=GIT&logoColor=white"/>
    <img src="https://img.shields.io/badge/SpringLegacy-6DB33F?style=flat&logo=spring&logoColor=white"/>
    <img src="https://img.shields.io/badge/mysql-4479A1?style=flat&logo=mysql&logoColor=white"/>
    <img src ="https://img.shields.io/badge/mybatis-000000?&logo=jpa&logoColor=white"/>
    <img src="https://img.shields.io/badge/JQuery-0769AD?style=flat&logo=jquery&logoColor=white"/>
    <img src="https://img.shields.io/badge/BootStrap-7952B3?style=flat&logo=bootstrap&logoColor=white"/>
    <img src="https://img.shields.io/badge/JSP-F05032?style=flat&logo=JSP&logoColor=white"/>
    
  </div>

<br>

  ### Tools
  <div>
    <img src="https://img.shields.io/badge/STS3-6DB33F?style=flat&logo=spring&logoColor=white"/>
    <img src="https://img.shields.io/badge/NaverCloud-03C75A?style=flat&logo=Naver&logoColor=white"/>
    <img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white"/>
    <img src="https://img.shields.io/badge/Slack-4A154B?style=flat&logo=slack&logoColor=white"/>
    <img src="https://img.shields.io/badge/lombok-red?style=flat"/>
  </div>

## 팀장

[김재철](https://github.com/IronKim)

### 팀원
  
  [김진아](https://github.com/fantazina)
  [명인호](https://github.com/inho1019)
  [문이빈](https://github.com/yibeen)
  [박종현](https://github.com/whdgusdl)
  [정선경](https://github.com/tjsrud18)
  [한도연](https://github.com/DoYeonHan)

<br>
</div>

# 메인페이지
<img src="https://github.com/IronKim/SpringCafe/blob/main/main.png?raw=true">

  - 부트스트랩을 이용한 캐러셀 구현
  - 새로 고침시 메뉴가 랜덤으로 나오게 구현

# 회원가입 페이지
<img src="https://github.com/IronKim/SpringCafe/blob/main/sign_up.png?raw=true">

  - 회원가입시 본인인증 (이메일 인증과 문자 인증)
  - javamailsender를 이용한 이메일 인증, 쿨에스엠에스 API를 이용한 SMS 인증

# 로그인 페이지
<img src="https://github.com/IronKim/SpringCafe/blob/main/login.png?raw=true">

  - 카카오와 네이버의 API를 이용하여 소셜 로그인 구현
  - 보안 문자를 구현하여 무단 로그인 시도의 접근을 방지

# 채팅
<img src="https://github.com/IronKim/SpringCafe/blob/main/chat.png?raw=true">

  - Polling 방식을 이용해 실시간 채팅 구현 
  - 사이트 이용 중에도 인라인 채팅이 가능하도록 구현

# 매장 찾기
<img src="https://github.com/IronKim/SpringCafe/blob/main/storeSearch.png?raw=true">

  - 지도를 클릭하면 해당 매장들이 나오도록 구현
  - 매장 찾기 검색란에 매장 이름을 입력하면 해당 이름이 들어간 매장만 나오도록 구현

# 메뉴
<img src="https://github.com/IronKim/SpringCafe/blob/main/menu.png?raw=true">

  - 부트스트랩을 이용해 카드 스타일 형식 구현
  - 왼쪽 사이드바에서 버튼을 누르면 해당 카테고리로 스크롤이 이동
  - 메뉴를 누르면 자세한 정보가 나오며 주문 버튼을 누르면 주문창으로 이동과 함께 해당 메뉴가 장바구니에 담김

# 메뉴
<img src="https://github.com/IronKim/SpringCafe/blob/main/order1.png?raw=true">

  - 지역 선택, 매장 선택, 메뉴 선택시 결제 창이 나오며 카카오페이와 카드결제 선택가능

# 카카오 페이 결제
<img src="https://github.com/IronKim/SpringCafe/blob/main/order2.png?raw=true">

  - QR코드 또는 핸드폰 번호를 입력후 카카오톡을 통해 결제 요청이 사용자에게 전송
  - 카카오톡을 통해 결제 응답을 보내고, 최종적으로 결제 완료
  - 카카오페이 API를 이용해 구현

# 카드 결제
<img src="https://github.com/IronKim/SpringCafe/blob/main/order3.png?raw=true">

  - 카드사를 선택하고 QR또는 카드 번호를 입력을 통해 주문요청하면 최종 결제 승인란이 나오고 최종결제 승인시 결제 완료
  - NHN KCP API를 이용하여 구현

결제가 완료되면 결제 내역과 함께 사용자에게 포인트가 적립

# 마이페이지
<img src="https://github.com/IronKim/SpringCafe/blob/main/mypage.png?raw=true">

  - 누적 포인트, 사용 포인트, 회원등급, 주문 내역 확인
  - 정보 수정 버튼을 누르면 비밀번호를 입력하여 본인 확인을 거치고, 정보 수정 페이지로 이동
  - 아이디를 제외한 모든 정보 수정 가능
  - 탈퇴 버튼을 누르면 두번의 확인을 거치고, 최종적으로 회원 탈퇴가 완료

# 멤버십 페이지
<img src="https://github.com/IronKim/SpringCafe/blob/main/membership.png?raw=true">

  - 다음 등급으로 승급하기 위한 추가 결제 금액을 게이지와 함께 직관적으로 확인 가능

# 게시판 페이지
<img src="https://github.com/IronKim/SpringCafe/blob/main/borad.png?raw=true">

  - 로그인한 회원에게만 글쓰기 버튼이 보이며 글쓰기가 가능
  - 게시글은 페이징 처리되어 페이지 버튼을 이용하여 다른 페이지로 이동 가능
  - 작성글의 제목을 클릭하면 조회수가 증가하며, 글 내용과 댓글 확인 가능
  - 댓글이 많은 글의 경우 스크롤이 생성되며, 스크롤을 내리면 추가 댓글이 로딩



