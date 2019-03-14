<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/brw/resources/Jcss/userdelete.css" rel="stylesheet">  
<link href="/brw/resources/Jcss/login.css" rel="stylesheet">

<title>회원탈퇴</title>
</head>
<body>
	<div id="content">
		<div class="c_header">
			<center><h2>탈퇴 안내</h2></center>
			<br>
			<p class="contxt">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
		</div>
		<br>
		<div class="section_delete">
			<div class="h_dropout">
				사용하고 계신 아이디<strong>(${ID})</strong>는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</div>
			<div class="h_dropout">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</div>
			<p class="dropout_dsc">
				회원정보 및 영화, 드라마, 광고 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
				<br><br>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
			</p>
			<table cellspacing="0" border="1" summary="탈퇴 후 회원정보 및 개인형 서비스 이용기록 삭제 안내" class="tbl_type">
				<caption>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</caption><br>
				<colgroup>
					<col width="145">
					<col width="*">
				</colgroup>
				<tbody id="tblBullet1">
					<tr style="display: table-row;">
						<th scope="row">영화</th>
						<td>리뷰 댓글 및 별점 삭제</td>
					</tr>
					<tr style="display: table-row;">
						<th scope="row">드라마</th>
						<td>리뷰 댓글 및 별점 삭제</td>
					</tr>

					<tr style="display: table-row;">
						<th scope="row">광고</th>
						<td>리뷰 댓글 및 별점 삭제</td>
					</tr>
				</tbody>	
				</table>
				<br>
					<form name="fm" id="fm" method="post"
						action="/brw/user/userDeletechk.br">
						<div class="btn_area_w">
							<p class="btn_area">
								<button type="submit" class="btn_type btn_primary" >
									<span>탈퇴하기</span>
								</button>
							</p>
						</div>
					</form>
				</div>
			</div>
</body>
</html>
