<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String uid_session = (String)session.getAttribute("uid_session");
String nickname_session = (String)session.getAttribute("nickname_session");
String category = request.getParameter("category");
String linkUrl = request.getRequestURI();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>여행 포럼</title>
	<link rel="stylesheet" href="/style/forumStyle.css?v">
</head>
<body>
	<div id="wrap" class="boardTimeline">
	
		<!--  헤더템플릿 시작, iframe으로 변경 -->
		<%@ include file="../inc/headerTmp.jsp" %>
    	<!--  헤더템플릿 끝 -->   
		
		
		<main id="main">
		<!-- 각 포럼 타이틀명  -->
		<%@ include file="../category/forumTitle/forumTitle.jsp" %>
		<!-- 각 포럼 타이틀명  -->
		<% if(uid_session != null) { %>
			<div id="writeArea">
				<form id="writeFrm">
					<div id="writeInfo" class="dFlex">
						<div id="userProfile">
							<span class="profile">
								<img src="images/board3.jpg" alt="">
							</span>
						</div>
						<div id="userName">
							<span><%= nickname_session %></span>
						</div>
					</div>
					<div id="contentArea">
						<input type="hidden" id="uid" name="uid" value="<%= uid_session %>">
						<input type="hidden" id="nickname" name="nickname" value="<%= nickname_session %>">
						<input type="hidden" id="category" name="category" value="<%= category %>">
						<textarea id="content" name="content" placeholder="무슨말을 전달하고 싶으세요 ?"></textarea>
					</div>
					<div id="writeBtnArea" class="dFlex">
						<button type="button" id="uploadImg">사진</button>
						<button type="button" id="writeBtn">게시</button>
					</div>
				</form>
			</div>
		<% } %>
			
			
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
					<input type="hidden" name="category" value="<%=category%>">
					<input type="hidden" name="image" value="">
					<textarea id="content" name="content">${ list.content } </textarea>
					<input type="hidden" name="profile" value="">
					<input type="hidden" name="linkUrl" value="<%=linkUrl %>">
					<div id="updateBtnArea">
						<button type="submit" >수정</button>
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