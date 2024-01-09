<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String uid_session = (String)session.getAttribute("uid_session");
String nickname_session = (String)session.getAttribute("nickname_session");
// String category = request.getParameter("category");
String selectUserid = request.getParameter("userid");
// String nickname = request.getParameter("nickName");
String linkUrl = request.getRequestURI();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
<%-- 	<title><%= selectUserid %> 님의 타임라인 </title> --%>
	<title>${ userInfo.nickname } 님의 타임라인 </title>
	<link rel="stylesheet" href="/style/forumStyle.css?v">
</head>
<body>
	<div id="wrap" class="boardTimeline">
	
		<!--  헤더템플릿 시작, iframe으로 변경 -->
		<%@ include file="../inc/headerTmp.jsp" %>
    	<!--  헤더템플릿 끝 -->   
		
		
		<div id="timeLineHeader" class="dFlex">
			<div id="timeLineHeader_bg">
				
			</div>
			<div id="timelineArea" class="dFlex">
				<span class="profileTimeLine">
					<img src="images/board3.jpg" width="32" height="32">
				</span>
				<span>${ userInfo.nickname } (${ userInfo.uid })</span>
				<div id="postCntArea" class="dFlex">
					<span>총 게시물</span>
					<span class="postCnt">${ postCnt }</span>
				</div>
				<div id="joinTMArea" class="dFlex">
					<span >가입 날짜</span>
					<fmt:formatDate var="userRegTM" value="${ userInfo.regTM }" pattern="yyyy-MM-dd"/>
					<span class="joinTM">${ userRegTM }</span>
				</div>
			</div>
		</div>
		<main id="main">
			<!-- 게시글출력  -->
			<c:forEach var="list" items="${ list }">
			<div id="rowArea" class="listlowMain">
				<div id="userInfoArea" class="dFlex">
					<div id="userImgArea">
						<span class="profile">
							<img src="images/board3.jpg" width="32" height="32">
						</span>
					</div>
					<div id="userWirterArea">
						<span onclick="userTimelineHome('${ list.uid }')">${ list.nickname }</span>
						<span><fmt:formatDate value="${ list.regTM }" pattern="MM월dd일 a hh:mm"/></span>
					</div>
					<div id="userMoreArea" class="moreIco${ list.num }" onclick="moreSelect('${ list.num }')">
					<c:if test="${ list.uid == uid_session }">
						<img src="images/free-icon-more-2354557.png" alt="더보기">
						<ul>
							<li>수정</li>
							<li onclick="deletePost('${ list.category }','${ list.num }','${ list.uid }','<%=linkUrl%>')">삭제</li>
						</ul>
					</c:if>
					</div>
				</div>
				<div id="listContentArea" class="listContentArea${ list.num }">
					<span>${ list.content }</span>
				</div>
			<form id="upContentFrm" class="upContentFrm${ list.num }" action="updatePost">
				<div id="upcontentArea" class="upcontentArea">
					<input type="hidden" name="num" value="${ list.num }">
					<input type="hidden" name="uid" value="${ list.uid }">
					<input type="hidden" name="nickname" value="${ list.nickname }">
					<input type="hidden" name="category" value="${ list.category }">
					<input type="hidden" name="image" value="">
					<textarea id="content" name="content">${ list.content } </textarea>
					<input type="hidden" name="profile" value="">
					<input type="hidden" name="linkUrl" value="<%=linkUrl%>">
					<div id="updateBtnArea">
						<button type="submit">수정</button>
					</div>
				</div>
			</form>
			</div>
			</c:forEach>
			<!-- 게시글출력 끝 -->
			
			<div id="testarea" class="listlow">
			
			</div>
		</main>
		
	</div>
	<!-- div#wrap -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="/script/forumScript.js"></script>
</body>
</html>    