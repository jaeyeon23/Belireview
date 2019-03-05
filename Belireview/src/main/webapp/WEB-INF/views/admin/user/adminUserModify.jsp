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
	function checkPwd(){
		var pw1 = document.userinput.m_password.value;
		var pw2 = document.userinput.m_password_check.value;
		if(pw1!=pw2){
			document.getElementById('checkcheck').className="alert alert-danger";
			document.getElementById('checkcheck').innerHTML = "동일한 암호를 입력하세요.";
			pw_check=0;
		}else{
			document.getElementById('checkcheck').className="alert alert-success";
			document.getElementById('checkcheck').innerHTML = "암호가 확인되었습니다.";
			pw_check=1;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<table class="table" align="center">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>EMAIL</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${admin.ID }</td>
					<td>${admin.NAME }</td>
					<td>${admin.EMAIL }</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>