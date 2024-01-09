<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./style/inquiryStyle.css">
<title>Insert title here</title>
</head>
<body>
    <div id="wrap">
        <div id="headerDetail">
            <span class="notosanskr">1:1 문의 게시판</span>
        </div>
        <div id="imgContainer">
            <img src="./images/prev.png" alt="" id="a" class="noticeImg" onclick="location.href='./inquiryDetail?num=${prevPage}'">
            <img src="./images/next.png" alt="" id="b" class="noticeImg" onclick="location.href='./inquiryDetail?num=${nextPage}'">
            <img src="./images/list.png" alt="" id="c" class="noticeImg" onclick="location.href='./inquiry?page=1'">
        </div>
        <div id="board">
            <div id="titleDetail">${inquiry.title}</div>
            <div id="boardHeader">
                <div id="circle"> <img id="profile" src="./images/profile.png"></div>
                <div id="container">
                        <div id="username">${inquiry.nickname}</div>
                    <div  id="text">
                        <div class="text">
                        	<fmt:formatDate value="${inquiry.regTm}" pattern="yyyy-MM-dd HH:mm:ss" />
                        </div>
                        <div class="text">조회</div>
                        <div class="text">${inquiry.readCnt}</div>
                    </div>
                </div>
                <div id="setting">
                    <img id="setting0" class="text" src="./images/comment.png">
                    <div id="setting1">댓글</div>
                    <span id="setting2">${inquiryDetail.size()}</span>
                    <img id="setting3" src="./images/setting.png">
                </div>
            </div>
            <div id="textArea">                
                <pre id="textContent" >
                    ${inquiry.content}
                </pre>
            </div>
            <img id="comment" src="./images/commentChat.png">
            <div id="commentText0">댓글</div>
            <div id="commentText1">${inquiryDetail.size()}</div>
            <div id="boardBottom">
                <div id="commentNotice">댓글</div>
                <div id="parentCommentArea">
                	<c:forEach var="item" items="${inquiryDetail}">
                		   
		                    <div id="circle2"> 
		                        <img id="profile2" src="./images/profile.png">
		                    </div>
	                    
	                    <div id="parentCommentNickname">${item.nickname}</div>
	                    <img id="parentCommentTool" src="./images/commentSetting.png">
	                    <div id="parentCommentContent">${item.content}</div>
	                    <img id="parnetCommentImg" src="./images/profile.png">
	                    <div id="parentCommentDate">
	                    <fmt:formatDate value="${item.regTm}" pattern="yyyy-MM-dd HH:mm:ss" />
	                    </div>
	                    <div id="parentCommentEnd"></div>
                    </c:forEach>
                </div>
                    
                <div id="commentArea">
                    <div id="commentUserName">윤준성</div>
                    <textarea id="commentText" placeholder="댓글을 남겨보세요"></textarea>
                    <div id="commentSubmitArea">
                    	<img id="camera" src="./images/camera.png">
                    	<div id="submit">등록</div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
</html>