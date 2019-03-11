<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frm" method="post" action="/brw/member/findPw.br">

<input type="hidden" name="check_find" value="i">
<div class="modal-search-privacy">
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="area-name active"><a href="#search-id" aria-controls="home" role="tab" data-toggle="tab" onclick="check_find('i')" aria-expanded="true"><h5>아이디 찾기</h5></a></li>
		<li role="presentation" class="street-address"><a href="#search-password" aria-controls="profile" role="tab" data-toggle="tab" onclick="check_find('p')" aria-expanded="false"><h5>비밀번호 찾기</h5></a></li>
	</ul>
	<div class="tab-content">
		<!-- search-id//end -->
		<div role="tabpanel" class="tab-pane" id="search-password">
			
			<div class="section-body list-horizontal">
				<div class="list-item">
					<div class="item-title col-xs-24 col-md-6">
						<strong>이름</strong>
					</div>
					<div class="item-contents hasCol col-xs-24 col-md-18">
						<div class="col-xs-20 col-lg-20 form-inline">
							<input type="text" class="form-control" name="pwname" size="28">
						</div>
					</div>
				</div>
				
				<div class="list-item">
					<div class="item-title col-xs-24 col-md-6">
						<strong>아이디</strong>
					</div>
					<div class="item-contents hasCol col-xs-24 col-md-18">
						<div class="col-xs-20 col-lg-20 form-inline">
							<input type="text" class="form-control" name="pwid" size="28">
						</div>
					</div>
				</div>
				
				<!-- list-item//end -->
				<div class="list-item">
					<div class="item-title col-xs-24 col-md-6">
						<label for="pcm-mobile"><strong>이메일</strong></label>
					</div>
						<div class="item-contents hasCol col-xs-24 col-md-18">
							<div class="col-xs-20 col-lg-20 form-inline">	
								<input name="pwemail" id="pwemail" class="form-control" size="28" type="email"> 
							</div>
						</div>
						<div class="text-primary col-xs-24">
							<p>초기화된 비밀번호를 이메일로 발송해 드립니다.</p>
						</div>
					</div>
					
				</div>
				<!-- list-item//end -->
			</div>
		</div>
	</div>
	<!-- tab-content//end -->
</div>
<div class="modal-button">
			<button type="submit" id="확인" value="확인"
				class="btn_type btn_primary">
				<span>아이디찾기</span>
			</button>
	</a>
</div>
</form>
<!-- 본인인증 스크립트 -->
<script>
function check_find(a){
	document.frm.check_find.value = a;
}

function popup_nice_open(){
	var f = document.frm;
	var check_find = f.check_find.value;
	var idname = f.idname.value;
	var pwname = f.pwname.value;
	var mid = f.mem_id.value;
	var idemail = f.idemail1.value+"@"+f.idemail2.value;
	var pwemail = f.pwemail1.value+"@"+f.pwemail2.value;
	console.log("로그 내용1"+pwemail);
	if(check_find == 'i'){//아이디찾기일때
		var mode = "find_id_chk";
		console.log("로그 내용2"+idemail);
		$.ajax({
	        type: "POST",
	        url: "/SIRORAGI/login/find",
	        data: ({mode:mode,idemail:idemail,idname:idname,check_find:check_find}),
	        //contentType: "text/plain; charset=euc-kr",
	        success: function(data) {
	        	console.log(data);
	        	if(data != 0){
	        		alert("가입하신 아이디는 "+ data +" 입니다.");
	        	}else{
	        		alert("해당정보로 가입된 아이디가 없습니다.");
	        		
	        		
	        		//window.open("loginForm","_self").close();
	        		//opener.open('about:blank','_self').close();
	        		
	        	}
/* 	        	
	        	if(data != null)    {
	            	/* console.log("로그 내용2"+data); 
	            } */
	        },
	        error: function(e){
	         alert('error' + e);
	        }
	    });		
		self.close();
		close();
	}else if(check_find == 'p'){//패스워드찾기일떄
		console.log("로그 내용2"+pwemail);
		var mode = "find_pw_chk";
		$.ajax({
	        type: "POST",
	        url: "/SIRORAGI/login/find",
	        data: ({mode:mode,pwemail:pwemail,mid:mid,pwname:pwname,check_find:check_find}),
	        //contentType: "text/plain; charset=euc-kr",
	        success: function(data) {
	        	if(data != 0){
	        		alert("가입하신 이메일로 비밀번호를 보냈습니다.");
	        	}else{
	        		alert("일치하는 정보가 없습니다.");
	        	}
/* 	        	
	        	if(data != null)    {
	            	/* console.log("로그 내용2"+data); 
	            } */
	        },
	        error: function(e){
	         alert('error' + e);
	        }
	    });		
		self.close();
	}
}

function g_popup_niceid(){
	window.open('', 'popup', 'width=500, height=461, toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,top=0,left=0');
	document.frm_main.action = "https://check.namecheck.co.kr/checkplus_new_model4/checkplus.cb";
	document.frm_main.target = "popup";
	document.frm_main.submit();
}
</script>
</body>
</html>