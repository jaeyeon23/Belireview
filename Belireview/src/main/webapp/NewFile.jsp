<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />
<title>시계</title>
<script type="text/javascript">
	function printTime() {
		var clock = document.getElementById("clock");
		var now = new Date();
		clock.innerHTML = 
			now.getFullYear() + "년 "+
			(now.getMonth()+1) + "월 "+
			now.getDate() +"일 "+
			now.getHours() +"시 "+
			now.getMinutes() +"분 "+
			now.getSeconds() +"초";
		setTimeout("printTime()", 1000);
	}
	window.onload = function() {
		printTime();
	}
	</script>
</head>
<body>
	현재 시간은
	<span id="clock"></span> 입니다.
</body>
</html>
