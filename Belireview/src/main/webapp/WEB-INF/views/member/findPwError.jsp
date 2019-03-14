<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	window.onload = function(){
		var chk = ${memberFindChk}
		if(chk == 0){
			alert('일치하는 정보가 존재하지 않습니다.');
			history.back();
		}
	}
</script>