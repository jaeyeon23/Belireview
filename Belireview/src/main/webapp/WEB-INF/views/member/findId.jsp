<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/brw/resources/Jcss/join.css" rel="stylesheet">

<!-- <script type="text/javascript">
	if ('${message}' != "") {
		alert('${message}');
	}
	
</script> -->	
<script type="text/javascript">
	function memberFindChk(){
		
	var mem = eval("document.findIdForm");
		
		if(mem.name.value=="") {
	        alert('이름이 머에옇');
	        mem.name.focus();
	        return false;
	    }

	    if(mem.email.value=="") {
	        alert('이메일이 머에옇.');
	        mem.email.focus();
	        return false;
	    }
		return true;
	}
	
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
		/* 이름입력여부 */
		$("input[name = name]").blur(function(){
			checkName();
		});
		function checkName() {
	        var name = $("#name").val();
	        var oMsg = $("#nameMsg");
	
	        if ( name == "") {
	            showErrorMsg(oMsg,"필수 정보입니다.");
	            return false;
	        }else{
	        	oMsg.slideUp();
	        	name_ok ="ok";
	        }
	
	        return true;
	    }
	});
	
	
</script>
<title>아이디찾기</title>
</head>
<body>
	<div id="wrap">
		<!-- header -->
		<div id="header">
			<h1>
				<center>
					<img src="/brw/resources/images/logos.jpg" width="150px" alt="">
				</center>
				<br>
			</h1>
		</div>
		<!-- container -->
		<div id="container">
			<!-- content -->
			<div id="content">
				<div class="title" aria-live="assertive">
					<p></p>
				</div>
				<form id="findIdForm" method="post" action="/brw/member/findIdOk.br" onsubmit="return memberFindChk()">
				<div class="login_form">
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<label for="name">이름</label>
							</h3>
							<span class="ps_box box_right_space"> 
								<input type="text" id="name" name="name" title="이름" class="int" maxlength="40">
							</span>
							<span class="error_next_box" id="nameMsg" style="display:none" role="alert"></span>
						</div>
						<br>
						<div class="join_row join_email">
							<h3 class="join_title">
								<label for="email">이메일</label>
							</h3>
							<span class="ps_box int_email box_right_space"> 
								<input type="text" id="email" name="email" maxlength="100" class="int" maxlength="100" placeholder="이메일 주소 전체를 입력해주세요">
							</span>
						</div>
						<div class="btn_area">
							<button type="submit" id="아이디 찾기" value="아이디찾기"
								class="btn_type btn_primary">
								<span>확인</span>
							</button>
						</div>
					</div>
				</div>
			</form>	
				<div class="position_a">
					<div class="find_info">
							<center>
								<a href="http://localhost:8080/brw/member/findPwForm.br">비밀번호 찾을까 말까?</a> 
								<span class="bar" aria-hidden="true">|</span> 
								<a href="http://localhost:8080/brw/member/loginForm.br">로그인</a>
							</center>
					</div>
				</div>

		</div>
	</div>
</body>
</html>