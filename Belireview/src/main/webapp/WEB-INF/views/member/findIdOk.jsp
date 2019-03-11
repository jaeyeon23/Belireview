<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>
<br><br><br><br><br>

<div class="container">
  <h2>이메일 찾기 결과</h2>
  <hr>
  <form class="form-horizontal">
  <div class="col-xs-4">
 
	<p><center>${NAME}님의 아이디는 <strong>${ID}</strong>입니다.</center></p>

  <div align="right">
  <a href="http://localhost:8080/brw/member/loginForm.br">로그인</a>
 </div>
 </div>
 </form>
 <br>
</div>

<br><br><br><br><br>
</body>
</html>