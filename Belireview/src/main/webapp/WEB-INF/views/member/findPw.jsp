<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/brw/resources/Jcss/login.css" rel="stylesheet">

<script type="text/javascript">
	if ('${message}' != "") {
		alert('${message}');
	}
	
</script>	
<script>

/* 메시지 출력 */
function showErrorMsg(obj, msg) {
	obj.attr("class", "error_next_box");
	obj.html(msg);
	obj.slideDown();
}
function showSuccessMsg(obj, msg) {
	obj.attr("class", "error_next_box green");
	obj.html(msg);
	obj.slideDown();
}

$(document).ready(function(){
	$("input[name = pwid]").blur(function() {
		checkId();
	});
	
	$("input[name = pwname]").blur(function() {
		checkName();
	});
	
	$("input[name = pwemail]").blur(function() {
		checkEmail();
	});
	
});
function checkId() {
    var id = $("#pwid").val();
    var oMsg = $("#idMsg");

    if ( id == "") {
        showErrorMsg(oMsg,"아이디를 입력해주세요.");
        return false;
    }else{
    	oMsg.slideUp();
    }

    return true;
}
function checkName() {
    var name = $("#pwname").val();
    var oMsg = $("#nameMsg");

    if ( name == "") {
        showErrorMsg(oMsg,"이름을 입력해주세요.");
        return false;
    }else{
    	oMsg.slideUp();
    }

    return true;
}

function checkEmail() {
    var email = $("#pwemail").val();
    var oMsg = $("#emailMsg");

    if ( email == "") {
        showErrorMsg(oMsg,"이메일을 입력해주세요.");
        return false;
    }else{
    	oMsg.slideUp();
    }

    return true;
}

</script>
<title>아이디찾기</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<h1>
				<center>
					<img src="/brw/resources/images/logo3.png" width="150px" alt="">
				</center>
			</h1>
		</div>
		<!-- container -->
		<div id="container">
			<!-- content -->
			<div id="content">
				<div class="login_form">
						<div class="row_group">
							<form id="findPwForm" method="post" action="/brw/member/findPw.br">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<div class="join_row">
								<h3 class="join_title">
									<label for="name">아이디</label>
								</h3>
								<span class="ps_box box_right_space"> 
									<input type="text" id="pwid" name="pwid" title="아이디" class="int" maxlength="40">
								</span>
								<span class="error_next_box" id="idMsg" style="display:none" role="alert"></span>   
							</div>
							<div class="join_row">
								<h3 class="join_title">
									<label for="name">이름</label>
								</h3>
								<span class="ps_box box_right_space"> 
									<input type="text" id="pwname" name="pwname" title="이름" class="int" maxlength="40">
								</span>
								<span class="error_next_box" id="nameMsg" style="display:none" role="alert"></span>   
							</div>
							<div class="join_row">
								<h3 class="join_title">
									<label for="name">이메일</label>
								</h3>
								<span class="ps_box box_right_space"> 
									<input type="text" id="pwemail" name="pwemail" class="int" maxlength="100" placeholder="이메일 주소 전체를 입력해주세요">
								</span>
								<span class="error_next_box" id="emailMsg" style="display:none" role="alert"></span>   
								<br><br>
								<div class="text-primary col-xs-24">
								<center><p>초기화된 비밀번호를 이메일로 발송해 드립니다.</p></center>
								</div>
							</div>	
							<div class="btn_area">
								<button type="submit" id="비밀번호 찾기" value="비밀번호 찾기"
									class="btn_type btn_primary">
									<span>비밀번호찾기</span>
								</button>
							</div>
						</form>	
					</div>
			</div>		
				<div class="position_a">
					<div class="find_info">
							<center>
								<a href="/brw/member/loginForm.br">로그인</a>
								<span class="bar" aria-hidden="true">|</span> 
								<a href="/brw/main.br">메인으로</a>
							</center>
					</div>
				</div>
		</div>
	</div>
</body>
</html>