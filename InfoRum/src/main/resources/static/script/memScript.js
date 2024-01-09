$(function () {

	//join.jsp
	$("#joinBtn").click(function(){
		let upw = $("#upw").val().trim();
		let reupw = $("#reupw").val().trim();

		if(upw != reupw){
			alert("비밀번호가 다릅니다.")
			$("#reupw").focus();
			return false;
		} 
	})
	
	$("#chkID").click(function(){
		let uid = $("#uid").val().trim();
		
		if(uid=="" || uid== null){
			alert("아이디를 입력하세요");
			$("#uid").focus();
		} else{
			location.href = "/chkID?uid="+uid;
		}
		
		
	})


		//tos.jsp
		
		$("#tosAllChk").click(function(){
			let chkState = $("#tosAllChk").prop("checked");
			
			$(".chkAgree").prop("checked",chkState)
		})
		
		$(".chkAgree").click(function(){
			let cnt=0;
			
			$(".chkAgree").each(function (i){
				let chk = $(".chkAgree").eq(i).prop("checked");
				
				if(chk){
					cnt++;
				}
			})
			
			if(cnt==3){
				$("#tosAllChk").prop("checked",true);
			} else{
				$("#tosAllChk").prop("checked",false);
			}
		})
		
		$("#tosAgreeBtn").click(function(){
			let chk1 = $("#chk1").prop("checked");
			let chk2 = $("#chk2").prop("checked");
			
			if(chk1 && chk2){
			 location.href="/join"
				
			}else{
				alert("필수항목을 체크해주세요");
				return false;
			}
			
		})
		
		//pwdChange.jsp
		
		$("#pwdChangeBtn").click(function(){
			let uid = $("#uid").val().trim();
			let uemail = $("#uemail").val().trim();
			let upw = $("#changeupw").val().trim();
			
			if(uid=="" || uid==null){
				alert("기존 아이디를 입력하세요");
				$("#uid").focus();
			} else if(uemail=="" || uemail==null){
				alert("기존 이메일을 입력하세요");
				$("#uemail").focus();
			} else if(upw=="" || upw==null){
				alert("변경할 비밀번호를 입력해주세요");
				$("#changeupw").focus();
			} else {				
				let con = confirm("비밀번호를 정말 변경하시겠습니까?");
					
					if(con){
						location.href = "/pwdChangeProc?uid="+uid+"&uemail="+uemail+"&upw="+upw;
					} else{
						alert("취소하셧습니다");
					}
			}
		})

});