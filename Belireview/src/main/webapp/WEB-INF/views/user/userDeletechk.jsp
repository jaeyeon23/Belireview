<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<html>
<head>
</head>
<body>
	<form name="memberDelete" action="userDelete.br" onsubmit="return memberDeleteChk()">
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
							<td><input type="password" class="txt w220" name="password" /></td>
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
		if(document.memberDelete.password.value == ""){
			alert("비밀번호를 입력하세요.");
			document.memberDelete.password.focus();
			return false;
		}
		return true;
	}
</script>
</body>
</html>