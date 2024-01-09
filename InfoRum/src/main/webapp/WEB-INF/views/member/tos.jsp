<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>회원가입 동의</title>
	<link rel="stylesheet" href="/style/memStyle.css?v">
</head>
<body>
	<div id="wrap" class="memberWrap">
		<div id="tosTxtArea">
			<span id="tosHeadSpan">
				<input type="checkbox" id="tosAllChk"> 이용약관 및 개인정보수집 및 이용, 마케팅 정보 수신에 모두 동의합니다.
			</span>
			
			<h2>[필수] 이용약관 동의</h2>
			<textarea rows="5" cols="" >
			<%@ include file="ind/txt1.jsp"%>
			</textarea>
			<span>이용약관에 동의하십니까? <input type="checkbox" class="chkAgree" id="chk1"> 동의함(필수)</span>
			
			<h2>[필수] 개인정보 수집 및 이용동의</h2>
			<textarea rows="5" cols="" >
			<%@ include file="ind/txt2.jsp"%>
			</textarea>
			<span>개인정보 수집 및 이용에 동의하십니까? <input type="checkbox" class="chkAgree" id="chk2"> 동의함(필수)</span>
			
			<h2>[선택] 마케팅 정보 수신 동의</h2>
			<textarea rows="5" cols="" >
			<%@ include file="ind/txt3.jsp"%>
			</textarea>
			<span>마케팅 정보 수신에 동의하십니까? <input type="checkbox" class="chkAgree" id="chk3"> 동의함(선택)</span>
		</div>
		
		<footer id="footerBtnArea" class="tosFooter dFlex">
			<button type="button" id="tosAgreeBtn">동의</button><button type="button" onclick="history.back()">취소</button>
		</footer>
	</div>
	<!-- div#wrap -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="/script/memScript.js"></script>
</body>
</html>    