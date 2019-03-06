<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check_value() {
		var f = document.admin_update_form;
		
		if(f.name.value == "" || f.name.value.length < 2){
			alert("이름을 다시 입력하세요");
			f.name.focus();
			
			return false;
		}
		
		if(f.tel.value == "" || f.tel.value.length < 10){
			alert("전화번호를 다시 입력하세요");
			f.tel.focus();
			
			return false;
		}
		
		if(f.password.length < 9){
			alert("비밀번호를 다시 입력하세요");
			f.password.focus();
			
			return false;
		}
		
		if(pw_check != 1){
			alert("비밀번호를 확인해 주세요.");
			f.password_check.focus();
			
			return false;
		}
		
		f.submit();
	}

	function checkPwd(){
		var pw1 = document.admin_update_form.password.value;
		var pw2 = document.admin_update_form.password_check.value;
		
		if(pw1!=pw2){
			document.getElementById('checkcheck').className="alert alert-danger";
			document.getElementById('checkcheck').innerHTML = "동일한 암호를 입력하세요.";
			pw_check = 0;
		}else{
			document.getElementById('checkcheck').className="alert alert-success";
			document.getElementById('checkcheck').innerHTML = "암호가 확인되었습니다.";
			pw_check = 1;
		}
	}
	
	function cancel(){
		location.href = "/brw/admin/users.br";
	}
</script>
<link href="/brw/WEB-INF/views/user/adminusermodify.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="col-md-8">
		<form name="admin_update_form" method="post" enctype="multipart/form-data">
			<h3 class="blog-post-title">
				ID
			</h3>
			<div>
				<input type="text" class="form-control search-wid" name="id" value="${admin.ID }" readonly>
			</div>
			<!-- 비밀번호 사이즈 9 ~ 20 -->
			<h3 class="blog-post-title">
				PASSWORD
			</h3>
			<div>
				<input type="password" class="form-control search-wid" name="password" onkeyup="checkPwd()" minlength="9" maxlength="20">
			</div>
			<h3 class="blog-post-title">
				PASSWORD CHECK
			</h3>
			<div>
				<input type="password" class="form-control search-wid" name="password_check" onkeyup="checkPwd()" minlength="9" maxlength="20">
			</div>
			<div id="checkcheck" class="alert alert-danger">최소 9글자 이상 입력하세요.</div>	
			<h3 class="blog-post-title">
				NAME
			</h3>
			<div>
				<input type="text" class="form-control search-wid" name="name" minlength="2" maxlength="20" value="${admin.NAME }">
			</div>
			<h3 class="blog-post-title">
				EMAIL
			</h3>
			<div>
				<input type="email" class="form-control search-wid" name="email" value="${admin.EMAIL }" readonly>
			</div>
			<h3 class="blog-post-title">
				TEL
			</h3>
			<div>
				<input type="text" class="form-control search-wid" name="tel" placeholder="ex)01012345678"  minlength="10" maxlength="12">
			</div>
			<h3 class="blog-post-title">
				PROFILE IMAGE
			</h3>
			<div>
				<input type="file" class="btn btn-primary btn-send-message" name="profile_image">
			</div>
			<h3 class="blog-post-title">
				ADMIN
			</h3>
			<div>
				<select name="admin" class="form-control">
					<option value=1>관리자</option>
					<option value=0>일반회원</option>
				</select>
			</div>			
			<h3 class="blog-post-title">
				EMAIL_MARKETING
			</h3>
			<div>
				<select name="email_marketing" class="form-control">
					<option value=1>수신</option>
					<option value=0>수신거부</option>
				</select>
			</div>
			<h3 class="blog-post-title">
				SMS_MARKETING
			</h3>
			<div>
				<select name="sms_marketing" class="form-control">
					<option value=1>수신</option>
					<option value=0>수신거부</option>
				</select>
			</div>
			<div style="padding-top: 20pt; padding-bottom: 20pt">
				<button type="button" class="btn btn-primary" onclick="check_value()">제출</button>
				<button type="reset" class="btn btn-default">리셋</button>
				<button type="button" class="btn btn-default" onclick="cancel()">취소</button>
			</div>
		</form>
	</div>
	</div>
</body>
</html>