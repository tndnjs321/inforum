<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="list" items="${ list }">
<% 
String category = request.getParameter("category"); 
String linkUrl = request.getHeader("referer"); 
%>
<div id="rowArea" class="listrow" >
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
		<span onclick="userTimelineHome('${ list.uid }')">${ list.content }</span>
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
		<input type="hidden" name="linkUrl" value="<%=linkUrl %>">
		<div id="updateBtnArea">
			<button type="submit">수정</button>
		</div>
	</div>
	</form>
</div>
	
</c:forEach>

