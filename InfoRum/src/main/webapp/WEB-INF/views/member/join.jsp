<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
	String nowID = (String)session.getAttribute("nowID");
	String resTxt = (String)session.getAttribute("resTxt");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="/style/memStyle.css?v">
</head>
<body>
	<div id="wrap" class="memberWrap"> 
		<h1>회원가입</h1>
		
		<form action="joinProc">
		<div id="inputArea">
			<button type="button" id="chkID">아이디 중복체크</button>
			<span id="chkRes">${resTxt}</span> 
			<input type="text" placeholder="아이디" name="uid" id="uid" required maxlength="20" value="${nowID}"> 
			<input type="password" placeholder="비밀번호" name="upw" id="upw" required maxlength="20">
			<input type="password" placeholder="비밀번호 재확인" name="reupw" id="reupw" required maxlength="20">
			<input type="text" placeholder="닉네임" name="nickname" required maxlength="20">
			<input type="text" placeholder="이메일" name="uemail" required maxlength="20">
		</div>
		
		<div id="btnArea">
			<button id="joinBtn">가입하기</button>
		</div>
		
		
		</form>
	</div>
	<!-- div#wrap -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="/script/memScript.js"></script>
</body>
</html>    