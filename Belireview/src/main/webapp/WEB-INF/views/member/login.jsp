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
	if ('${message}' != "") {
		alert('${message}');
	}
</script>
<title>빌리뷰로그인</title>
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
				<div class="login_form">
					<legend class="blind">로그인</legend>
						<div class="row_group">
							<form id="loginForm" method="post" action="/brw/member/login.br">
							<div class="join_row">
								<span class="ps_box int_id"> 
									<input type="text" id="ID" name="ID" class="int"  maxlength="20" placeholder="아이디"> 
								<span class="error_next_box" id="idMsg" style="display: none" role="alert"></span>
							</div>
							<br>
							<div class="join_row">
								<span class="ps_box int_pass" id="pswd1Img"> 
								<input type="password" id="PASSWORD" name="PASSWORD" class="int" maxlength="20" placeholder="비밀번호"> 
								<span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
									<div class="ly_v2" id="err_capslock" style="display: none;">
										<div class="ly_box">
											<p>
												<strong>Caps Lock</strong>이 켜져 있습니다.
											</p>
										</div>
										<span class="sp ly_point"></span>
									</div>
								</span>
							</div>
							<div class="btn_area">
								<button type="submit" id="로그인" value="로그인"
									class="btn_type btn_primary">
									<span>로그인</span>
								</button>
							</div>
						</form>	
					</div>
			</div>
			
				<div class="position_a">
					<div class="find_info">
						<center>
							<a href="http://localhost:8080/brw/member/findIdForm.br">아이디 찾기</a> <span
								class="bar" aria-hidden="true">|</span> 
							<a href="http://localhost:8080/brw/member/findPwForm.br">비밀번호 찾기</a> <span
								class="bar" aria-hidden="true">|</span> 
							<a href="http://localhost:8080/brw/member/joinTerms.br">회원가입</a>
						</center>
					</div>
				</div>

		</div>
	</div>
</body>
</html>