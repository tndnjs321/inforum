<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>InfoRum</title>
	<link href="images/logo.png" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" href="/style/loginStyle.css?v">
</head>
<body>

	<!--  헤더템플릿 시작, iframe으로 변경 -->
	<%@ include file="../inc/headerTmp.jsp" %>
    <!--  헤더템플릿 끝 --> 
    
	<div id="wrap" class="memberWrap">
		<h1 class="notosanskr">로그인</h1>
		<form action="loginProc">
			<div id="inputArea">
				<input type="text" placeholder="아이디" name="uid" required>
				<input type="password" placeholder="비밀번호" name="upw" required>
			</div>
			
			<div id="btnArea">
				<button class="notosanskr">로그인</button>
			</div>
			
			<footer id="loginFooter" class="dFlex">
				<span class="notosanskr">비밀번호 찾기</span>
				<span class="notosanskr">|</span>
				<a href="tos"><span class="notosanskr">신규회원가입</span></a>
			</footer>
		</form>	
		
	</div>
	<!-- div#wrap -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</body>
</html>    