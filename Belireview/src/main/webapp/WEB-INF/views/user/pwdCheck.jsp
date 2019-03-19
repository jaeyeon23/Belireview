<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/brw/resources/Jcss/login.css" rel="stylesheet">

<script type="text/javascript">
	function checkPw(){
		var pw = $("#password").val();
		var pw_encrypt = null;
		
		$.ajax({
			url: "/brw/ajaxDelete.br",
			type: "POST",
			async : false,
			data:{
				password: pw
			},
			success: function(result){
				pw_encrypt = result;
			}
		});
		if(document.loginForm.password.value == ""){
			alert("비밀번호를 입력하세요.");
			document.loginForm.password.focus();
			return false;
		}else if(pw_encrypt == false){
			alert('비밀번호를 확인해주세요.');
			return false;
		}
		return true;
	} 
</script>
<title>유저패스워드 체킁!</title>
</head>
<body>
	<div id="wrap">
		<!-- header -->
		<div id="header" >
			<center>
				<h1>
					비밀번호확인 
				</h1>
				<font color="gray" size="2">회원님의 개인정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</font>
			</center>
		</div>
		<br>
		<!-- container -->
		<div id="container">
			<!-- content -->
			<div id="content">
				<div class="title" aria-live="assertive">
					<p></p>
				</div>
				<div class="login_form">
					<legend class="blind">로그인</legend>
						<div class="row_group">
							<form id="loginForm" name="loginForm" method="GET" action="userModify.br" onsubmit="return checkPw();">
							<input type="hidden" id="id" name="id" value="${ID}">
							<div class="join_row join_mobile">
                       			 <h3 class="join_title"><label for="id">아이디</label></h3>
                     			 <div class="ps_box_disable box_right_space" >
                            	  <input type="text" value="${ID}" aria-describedby="iwa_verify" class="int" disabled maxlength="20">
                        		</div>
                 		   </div>
							<br>
							<div class="join_row">
								<label for="password">비밀번호</label>
								<span class="ps_box int_pass" id="pswd1Img"> 
								<input type="password" id="password" name="password" class="int" maxlength="20" placeholder="비밀번호">
							</div>
							<div class="btn_area">
								<button type="submit" id="확인" value="확인" class="btn_type btn_primary">
									<span>확인</span>
								</button>
							</div>
						</form>	
					</div>
			</div>
		</div>
	</div>
</body>
</html>