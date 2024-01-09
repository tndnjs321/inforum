<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>비밀번호 변경</title>
	<link rel="stylesheet" href="/style/memStyle.css?v">
</head>
<body>
	<div id="wrap" class="memberWrap">
		<header id="headTxt">
			<span>비밀번호를 잊으셨나요?</span>
		</header>
		
		<main id="pwdCmain">
			<h3>변경할 비밀번호를 입력해주세요.</h3>
			
			<div id="pwdCArea">
				<input type="text" name="uid" id="uid" placeholder="기존의 아이디를 입력하세요">
				<input type="text" name="uid" id="uemail" placeholder="기존의 이메일을 입력하세요">
				<input type="password" name="upw" id="changeupw" placeholder="변경할 비밀번호를 입력하세요">
				
				<button type="button" id="pwdChangeBtn">비밀번호 재설정</button>
			</div>
		</main>
		
	</div>
	<!-- div#wrap -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="/script/memScript.js"></script>
</body>
</html>    