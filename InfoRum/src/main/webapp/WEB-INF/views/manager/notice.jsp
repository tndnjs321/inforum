<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>infoRum</title>
<link href="images/logo.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/style/noticeStyle.css?v">
</head>
<body>
	<!--  헤더템플릿 시작, iframe으로 변경 -->
	<%@ include file="../inc/headerTmp.jsp"%>
	<!--  헤더템플릿 끝 -->
	<div id="wrap">
		<section class="notice">
			<div class="page-title">
				<div class="container">
					<h3 class="notosanskr">공지사항</h3>
				</div>
				<%
				if (auth_session == 2) {
				%>
				<div id="button">
					<a href="/noticeWrite"><button class="btn btn-dark notosanskr">글쓰기</button></a>
				</div>
				<%
				}
				%>
				
			</div>
			<!-- board seach area -->
			<div id="board-search">
				<div class="container">
					<div class="search-window">
						<!-- 글쓰기 버튼을 우측으로 배치 -->
					</div>
				</div>
			</div>
			<!-- board list area -->
			<div id="board-list">
				<div class="container">
					<table class="board-table">
						<thead>
							<tr>
								<th scope="col" class="th-num notosanskr">번호</th>
								<th scope="col" class="th-title notosanskr"></th>
								<th scope="col" class="th-date notosanskr">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr>
									<td class="th-num notosanskr">${list.num}</td>
									<!-- 번호 -->
									<td class="th-title notosanskr"><a
										href="/noticeDetail?num=${list.num}" class="notosanskr">${list.title}</a></td>
									<!-- 제목 -->
									<td class="th-date notosanskr"><fmt:formatDate
											value="${list.regTM}" type="date" dateStyle="medium" /></td>
									<!-- 등록일 -->
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>

		</section>



	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="/script/noticeScript.js"></script>
</body>
</html>
