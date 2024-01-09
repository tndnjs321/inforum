<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String uid_session = (String)session.getAttribute("uid_session");
	int auth_session = 0;
	
	if(uid_session!=null){
	auth_session = (int)session.getAttribute("auth_session");	
	}
// 	out.print(uid_session);
%>    
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>InfoRum</title>
	<link href="images/logo.png" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" href="/style/style.css?v">
	<!-- Link Swiper's CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>

<body>
	<div id="wrap">
		<div id="header">
			<div id="list" >
				<span id="notice" class="notosanskr">공지사항</span>
				<span class="notosanskr">문의사항</span>	
			</div>
			<%if(uid_session == "" || uid_session == null){ %>
			<div id="login">
				<img id="loginIcon" src="/images/Login_icon.png" width="45px">
			</div>
			<%} else if(auth_session == 2) {%>
				<div id="loginStateMenu" class="dFlex">
				<span>시간</span>
				<button type="button">로그인 연장</button>
				<button id="logoutBtn" type="button" onclick="location.href='/logout'">로그아웃</button>
				<button type="button">나의 정보</button>
				<span>관리자님 환영합니다</span>			
				</div>
				
			<%} else{%>
				<div id="loginStateMenu" class="dFlex">
				<span>asd</span>
				<button type="button">로그인 연장</button>
				<button id="logoutBtn" type="button" onclick="location.href='/logout'">로그아웃</button>
				<button type="button" onclick="location.href='/myPage'">나의 정보</button>			
				</div>	
			<%} %>
			<div id="logo">
				<img src="../images/Logo.png">
				<span class="notosanskr">우리들의 정보 공유 게시판!</span>
				<span class="notosanskr">당신만이 가진 이야기를 공유해주세요.</span>
			</div>

			<!-- Swiper -->
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="../images/background1.jpg" alt="">
					</div>
					<div class="swiper-slide">
						<img src="../images/background2.jpg" alt="">
					</div>
					<div class="swiper-slide">
						<img src="../images/background3.jpg" alt="">
					</div>

				</div>

				<div class="autoplay-progress" style="display: none;">
					<svg viewBox="0 0 48 48">
						<circle cx="24" cy="24" r="20"></circle>
					</svg>
					<span></span>
				</div>
			</div>
		</div>

		<div id="gallery">
			<div id="board" class="dFlex">
				<div id="board1" class="board">				
					<div class="board_text">					
						<div class="textboard">
							<span class="notosanskr">애완동물</span>
							<br>
							<span class="notosanskr">너와 나의 펫 이야기, 수 많은 아이들의 이야기가 당신을 기다리고 있습니다.</span>
						</div>
					</div>
				</div>

				<div id="board2" class="board">
				<div class="board_text">					
						<div class="textboard">
							<span class="notosanskr">연애</span>
							<br>
							<span class="notosanskr">꽃의 꽃잎마다 다양한 이야기와 추억이 있습니다. 여러분의 사랑 이야기도 이곳에서 피워보세요.</span>
						</div>
					</div>
				</div>
				<div id="board3" class="board">
				<div class="board_text">					
						<div class="textboard">
							<span class="notosanskr">재태크</span>
							<br>
							<span class="notosanskr">이곳은 씨앗을 어떻게 키울지, 어떻게 더 많은 수확을 할 수 있을지 함께 공유하는 공간입니다.</span>
						</div>
					</div>
				</div>
			</div>
			
			<div id="board" class="dFlex">
				<div id="board4" class="board">
				<div class="board_text">					
						<div class="textboard">
							<span class="notosanskr">여행</span>
							<br>
						
							<span class="notosanskr">여행은 끝이 없습니다. 각자의 발걸음, 그 여행의 순간을 이곳에서 함께 나눠봐요.</span>
						</div>
					
					</div>
				</div>
				<div id="board5" class="board">
				<div class="board_text">					
						<div class="textboard">
							<span class="notosanskr">게임</span>
							<br>
							
							<span class="notosanskr">당신의 캐릭터, 전략, 그리고 경험을 모두와 공유하며 더 즐거운 게임 세상을 만들어봐요.</span>
						</div>
					
					</div>
				</div>
				<div id="board6" class="board">
				<div class="board_text">					
						<div class="textboard">
							<span class="notosanskr">스포츠</span>
							<br>
							
							<span class="notosanskr">땀방울 하나하나에는 이야기가 담겨 있습니다. 승리와 패배, 스포츠의 진정한 매력을 느껴보세요.</span>
						</div>
					
					</div>
				</div>
			</div>
		</div>

		<div id="footer">
			<div id="text">
				<span class="notosanskr">관리자 정보</span>
				<span class="notosanskr">Team. Ezen</span>
				<span class="notosanskr">Tel. 010-1234-5678</span>
			</div>
		</div>

	</div>
	<!-- div#wrap -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="/script/script.js"></script>

	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		const progressCircle = document.querySelector(".autoplay-progress svg");
		const progressContent = document.querySelector(".autoplay-progress span");
		var swiper = new Swiper(".mySwiper", {
			spaceBetween: 30,
			centeredSlides: true,
			autoplay: {
				delay: 4000,
				disableOnInteraction: false
			},
			pagination: {
				el: ".swiper-pagination",
				clickable: true
			},
			navigation: {
				nextEl: ".swiper-button-next",
				prevEl: ".swiper-button-prev"
			},
			on: {
				autoplayTimeLeft(s, time, progress) {
					progressCircle.style.setProperty("--progress", 1 - progress);
					progressContent.textContent = `${Math.ceil(time / 1000)}s`;
				}
			}
		});
	</script>
</body>

</html>