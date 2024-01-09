<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String categoryTitle = "";
String categoryIcon = "";
if (category.equals("pet")){
	categoryIcon = "🐾";
	categoryTitle = "애완동물";
} else if (category.equals("love")){
	categoryIcon = "💕";
	categoryTitle = "연애";
} else if (category.equals("finance")){
	categoryIcon = "🤑";
	categoryTitle = "재테크";
} else if (category.equals("travel")){
	categoryIcon = "🛫";
	categoryTitle = "여행";
} else if (category.equals("game")){
	categoryIcon = "🎮";
	categoryTitle = "게임";
} else if (category.equals("sports")){
	categoryIcon = "⚽";
	categoryTitle = "스포츠";
}

%>    
    
<div id="boardTitle">
	<h1><%=categoryIcon%> <%= categoryTitle %> 포럼 <%=categoryIcon%></h1>
</div>