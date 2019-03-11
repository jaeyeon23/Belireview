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
<script type="text/javascript">
	function memberFindChk(){
		
		var mem = eval("document.findPwForm");
		
		if(mem.name.value=="") {
	        alert('이름을 입력하세요');
	        mem.name.focus();
	        return false;
	    }

	    if(mem.email.value=="") {
	        alert('이메일을 입력해 주세요.');
	        mem.email.focus();
	        return false;
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
					<img src="/brw/resources/images/logos.jpg" width="150px" alt="">
				</center>
				<br>
			</h1>
		</div>
		<!-- container -->
		<div id="container">
			<!-- content -->
			<div id="content">
				<div class="login_form">
						<div class="row_group">
							<form id="findPwForm" method="post" action="/brw/member/findPw.br" onsubmit="return memberFindChk()">
							<div class="join_row">
								<h3 class="join_title">
									<label for="id">아이디</label>
								</h3>
								<span class="ps_box box_right_space"> 
									<input type="text" id="id" name="id" title="아이디" class="int" maxlength="40">
								</span>
							</div>
							<div class="join_row">
								<h3 class="join_title">
									<label for="name">이름</label>
								</h3>
								<span class="ps_box box_right_space"> 
									<input type="text" id="name" name="name" title="이름" class="int" maxlength="40">
								</span>
							</div>
							<br>
							<div class="join_row">
								<h3 class="join_title">
									<label for="email">이메일</label>
								</h3>
								<span class="ps_box int_email box_right_space"> 
									<input type="text" id="email" name="email" maxlength="100" class="int" placeholder="이메일 주소 전체를 입력해주세요">
								</span>
								<br>
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
								<a href="http://localhost:8080/brw/member/loginForm.br">로그인</a>
								<span class="bar" aria-hidden="true">|</span> 
								<a href="http://localhost:8080/brw/main.br">메인으로</a>
							</center>
					</div>
				</div>
		</div>
	</div>
</body>
</html>