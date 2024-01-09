$(function () {
	// url 주소 가져오기
	let url = window.location.search;
	let category = "";
	let userid = "";
	if (url.includes("category")){
//		console.log("url에 카테고리들어감: " + url);
		category = url.substring(10, url.length);
	} 
	if(url.includes("userid")){
//		console.log("url에 userid 받아짐 : " + url);
		userid = url.substring(8, url.length);
	}
//	console.log("url : " + url);
//	console.log("category : " + category);
//	console.log("userid : " + userid)
	
	// 게시물 비동기통신 무한스크롤 시작
    let loading = false;
    let endContent = $(".listlowMain").length; // 초기 게시물 수

    function debounce(func, delay) {
        let timer;
        return function () {
            clearTimeout(timer);
            timer = setTimeout(func, delay);
        };
    }

    function loadMoreContent() {
        if ($(window).scrollTop() + $(window).innerHeight() >= $('body').prop('scrollHeight')) {
            if (!loading) {
                loading = true;
                $.ajax({
                    type: "get",
                    url: "/list",
                    data: {
						"userid" : userid,
                        "category": category,
                        "param1": endContent,
                        "param2": "5"
                    },
                    dataType: "html",
                    async: true,
                    success: function (data) {
                        endContent = endContent + 5;
                        $("#testarea").append(data);
                        loading = false;
                    },
                    error: function () {
                        console.log("비동기 통신 실패");
                        loading = false;
                    }
                });
            }
        }
    }
    const debouncedLoadMore = debounce(loadMoreContent, 250); // 250ms 딜레이로 디바운스 적용
    $(window).on('scroll', debouncedLoadMore);
    // 게시물 비동기통신 무한스크롤 끝
    
    
    // 게시판 글 사진 클릭 이벤트
    $("#uploadImg").click(function(){
		console.log("게시글 사진 클릭");
		alert("작업중");
	});
    
    // 게시판 글 게시 이벤트
    $("#writeBtn").click(function(){
		$("#writeFrm").attr("action","/writerProc");
		$(this).attr("type","submit");
	});
	
	// 글수정 상태에서 수정 버튼 클릭이벤트 (타임라인과 게시판 구분하여처리)
	
	$("#editBtn").click(function(){
		alert("수정 버튼클릭");
		let url = window.location.pathname;
		let userID = window.location.search;
		let useridValue = "userTimeline?userid="+userID.substring(8,userID.length)
		alert(useridValue);
		if (url.substring(1,url.length) == "userTimeline") {
			$("#upContentFrm").attr("action",useridValue);
//			alert("타임라인임")
			$(this).attr("type","submit");
		} else {
			$("#upContentFrm").attr("action","updatePost");
			alert("타임라인 아님")
			$(this).attr("type","submit");
	}
	});
    
});

// 글쓴이유저 더보기 클릭이벤트
function moreSelect(param) {
//	console.log("param : " + param)
	let clickMore = ".moreIco"+param;
	console.log(clickMore);
//	let clickMore2 = $(clickMore).find("li");
//	console.log(clickMore2);
	$(clickMore+">ul>li").css("display","block");
	$(clickMore+">ul>li").hover(function(){
		$(clickMore+">ul>li").css("display","block");
		let upContentFrm = $(clickMore).parent().next().next().attr("id");
//		console.log("upContentFrm.next : " + upContentFrm.attr("id"))
		$(clickMore+">ul>li:nth-child(1)").click(function(){
			console.log("수정클릭");
			let listContentArea = "."+$(clickMore).parent().next().attr("id");
			$("."+upContentFrm+param+">.upcontentArea").css("display","block");
//			console.log($(listContentArea+param).find("#content"));
			$(listContentArea+param).css("display","none");
			$(listContentArea+param+" textarea").attr("autofocus", "autofocus");
		});

	}, function(){
		$(clickMore+">ul>li").css("display","none");
	})

}

 // 글 삭제 버튼 클릭 이벤트
function deletePost(category,param,uid,url) {
//	alert("삭제이벤트");
	console.log("category : " + category);
	console.log("param : " + param);
	let delCheck = confirm("해당게시물을 삭제하시겠습니까?")
	if (delCheck) {				
		location.href= "/deletePost?category="+category+"&num="+param+"&userid="+uid+"&linkUrl="+url;
	} else {
		alert("삭제가 취소 되었습니다.")
	}
}

// 게시글에서 사용자 닉네임 클릭시 이벤트
function userTimelineHome(selectuid) {
	location.href="/userTimeline?userid="+selectuid;
	console.log(selectuid);
}