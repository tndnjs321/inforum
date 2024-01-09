<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>

<title>infoRum</title>
<link href="images/logo.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/style/noticeStyle.css?v">
</head>
<body>

<!--  헤더템플릿 시작, iframe으로 변경 -->
   <%@ include file="../inc/headerTmp.jsp"%>
   <!--  헤더템플릿 끝 -->


   <div id="wrap3">
   
      <div id="title3">
         <span>${detail.title}</span>
      </div>
      <hr style="border: 15px solid #f9f7f9; margin: 15px 0px;">
      <div id="content3">
         <span>${detail.content}</span>
      </div>
      <div id="button3">
         <a href="notice"><button>목록</button></a>
         <button>수정</button>
         <a href="/noticeDelete?num=${detail.num}"><button>삭제</button></a>
      </div>
      
   </div>



   <!-- div#wrap -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   <script src="/script/script.js"></script>
</body>
</html>




