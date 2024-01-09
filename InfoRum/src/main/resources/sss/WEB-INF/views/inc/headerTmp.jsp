<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String uid_session2 = (String)session.getAttribute("uid_session");
	int auth_session = 0;
	
	if(uid_session2!=null){
	auth_session = (int)session.getAttribute("auth_session");	
}
%>
<link rel="stylesheet" href="../style/headerTmpStyle.css?v">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="../script/headerTmpScript.js"></script>


<body>
	<div class="header">
		<div class="header_inner clearfix dFlex">

			<div id="headerMenu">
				<a href="/"> 
					<img src="/images/menu_icon.png" width="45px">
				</a>
			</div>
			<div id="logo">
					<img src="/images/logo.png" width="150px">
			</div>
			<div id="headerIcon">
				
				<%if(uid_session2==null || uid_session2=="") {%>
				<a href="/"> 
					<img src="/images/Login_icon.png" width="45px">
				</a> 
				<%} else if(auth_session == 2) {%>
				<div id="loginStateMenu" class="dFlex">
				<span>시간</span>
				<button type="button">로그인 연장</button>
				<button id="logoutBtn" type="button" onclick="location.href='/logout'">로그아웃</button>
				<button type="button">나의 정보</button>
				<span>관리자님 환영합니다</span>			
				</div>
				
			<%} else{%>
				<div id="loginStateMenu" class="dFlex">
				<span>asd</span>
				<button type="button">로그인 연장</button>
				<button id="logoutBtn" type="button" onclick="location.href='/logout'">로그아웃</button>
				<button type="button" onclick="location.href='/myPage'">나의 정보</button>			
				</div>	
			<%} %>
				<a href="/"> 
					<img src="/images/home_icon.png" width="45px">
				</a>
				
				
			</div>
		</div>
	</div>
</body>