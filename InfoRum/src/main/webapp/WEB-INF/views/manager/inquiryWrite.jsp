<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ezen.infoRum.svc.ManagerSvcImp" %>
<%@ page import="com.ezen.infoRum.dao.ManagerDao" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./script/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="./style/summernote-lite.css">
<link rel="stylesheet" href="./style/inquiryStyle.css?v">

</head>
<body>
    <div id="wrap">
        <div id="header">
            <span class="notosanskr">1:1 문의 게시판</span>
        </div>
        <div id="board">
            <div id="query">1대1 문의</div>
            <button id="writeButton" onclick="boardWrite()">글쓰기</button>
            <div id="title">
                <textarea id="titleText" placeholder="제목을 입력해 주세요."></textarea>
            </div>
        </div>
        <div id="board2">
            <form method="post">
                <textarea id="summernote" name="editordata"></textarea>
              </form>
        </div>
        
</body>
<script src="./script/inquiryWrite.js"></script>
<script src="./script/summernote-lite.js"></script>
<script src="./script/summernote-ko-KR.min.js"></script>
</html>