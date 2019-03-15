<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<html>
<head>
</head>
<body>
	<form name="memberDelete" action="userDelete.br" onsubmit="return memberDeleteChk()">
		<input type="hidden" name="id" value="${ID }">
		<div class="tbl_type_01">
			<center>
				<table>
					<br>
					<caption>비밀번호입력으로 회원탈퇴하기</caption>
					<br><br>
					<colgroup>
						<col style="width: 100px;" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">비밀번호</th>
							<td><input type="password" class="txt w220" name="password" id="password" /></td>
						</tr>
					</tbody>
				</table>
		</div>
		</center>
		<br>
		<div class="btn_type_04">
				<center>
					<input type="submit" value="탈퇴"></button>
				</center>
		</div>
		<br>
	</form>
	
<script type="text/javascript">
	function memberDeleteChk(){
		var pw = $("#password").val();		//1234
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
		
		if(document.memberDelete.password.value == ""){
			alert("비밀번호를 입력하세요.");
			document.memberDelete.password.focus();
			return false;
		}else if(pw_encrypt == false){
			alert('비밀번호를 확인해주세요.');
			return false;
		}
		alert('탈퇴가 완료되었습니다.');
		return true;
	}

</script>
</body>
</html>