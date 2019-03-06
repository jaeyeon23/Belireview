<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	window.onload = function(){
		var chk = ${memberFindChk}
		//alert(chk);
		if(chk == -1){
			alert('이메일이 틀립니다.');
			history.back();
		}
		if(chk == 0){
			alert('가입되어 있지 않는 이름입니다');
			history.back();
		}
	}
</script>