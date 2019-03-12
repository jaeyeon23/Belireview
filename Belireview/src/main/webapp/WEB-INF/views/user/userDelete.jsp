<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	window.onload = function(){
		var chk = ${check}
		//alert(chk);
		if(chk == 1){
			alert('비밀번호를 확인해주세요.');
			history.back();
		}
		if(chk == 0){
			alert('탈퇴가 완료되었습니다.');
		}
	}
</script>