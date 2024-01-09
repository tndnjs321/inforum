<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.sql.Timestamp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>infoRum</title>
<link href="images/logo.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/style/inquiryStyle.css?v">
<script>
		function moveDetail(num) {
			location.href="./inquiryDetail?num="+num;
		}
	</script>
</head>
<body>

	<!--  헤더템플릿 시작, iframe으로 변경 -->
	<%@ include file="../inc/headerTmp.jsp"%>
	<!--  헤더템플릿 끝 -->


	<div id="wrap">

		<div id="header">
			<span class="notosanskr">1:1문의 게시판</span>
		</div>
		<div id="page">페이지:${page}/${allPage}</div>
		<table id="inquiryTbl">
			<thead>
				<tr id="theadTr">
					<td class="num theadNum">문의번호</td>
					<td class="title">제목</td>
					<td class="name">이름</td>
					<td class="regTm">날짜</td>
				</tr>
			</thead>
			<tbody>
			
					
				<c:forEach var="list" items="${list}">
					<tr class="tbdyTr" onclick="moveDetail(${list.num})">
						<td class="num">${list.num}</td>
						<td class="title tbdyTitle">${list.title}</td>
						<td class="name">${list.nickname}</td>
						<td class="regTm">
						            <fmt:formatDate value="${list.regTm}" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<div></div>
		</table>
		
		
			
		</div>
		<div style="display:flex;">
			<div>${startPage}</div>
			<div>${startPage+1}</div>
			<div>${startPage+2}</div>
			<div>${startPage+3}</div>
			<div>${startPage+4}</div>
		</div>


	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="/script/noticeScript.js"></script>
</body>

</html>
