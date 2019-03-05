<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	    <link href="/brw/resources/Jcss/join.css" rel="stylesheet">
	    
</head>
<body>
<div id="wrap">
	<form id="join_form" name="join_form" method="post" action="join.br">

    <!-- container -->
    <div id="container" role="main">
        <div id="content">
        	<center><img src="/brw/resources/images/logos.jpg" width="150px" alt=""></center>
        	<br><br>
            <!-- tg-text=title -->
            <h2 class="blind">빌리뷰 회원가입</h2>
            <div class="join_content">
                <!-- 아이디, 비밀번호 입력 -->
                <div class="row_group">
                    <div class="join_row">
                        <h3 class="join_title"><label for="id">아이디</label></h3>
                        <span class="ps_box int_id">
							<input type="text" id="id" name="id" class="int" title="ID" maxlength="20">
                           <!--  <span class="step_url">@naver.com</span></span> -->
                        <span class="error_next_box" id="idMsg" style="display:none" role="alert"></span>
                    </div>

                    <div class="join_row">
                        <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                        <span class="ps_box int_pass" id="pswd1Img">
							<input type="password" id="password" name="password" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
                            <span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
						</span>
						
                        <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                        <span class="ps_box int_pass_check" id="pswd2Img">
							<input type="password" id="pswd2" name="pswd2" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" maxlength="20">
						</span>
                        <span class="error_next_box" id="pswd2Msg" style="display:none" role="alert"></span>
                    </div>
                </div>
                <!-- // 아이디, 비밀번호 입력 -->

                <!-- 이름 입력 -->
                <div class="row_group">
                    <!-- lang = ko_KR -->
                    <div class="join_row">
                        <h3 class="join_title"><label for="name">이름</label></h3>
                        <span class="ps_box box_right_space">
							<input type="text" id="name" name="name" title="이름" class="int" maxlength="40">
						</span>
                    </div>
                    
                    <div class="join_row">
                        <h3 class="join_title"><label for="name">전화번호</label></h3>
                        <span class="ps_box box_right_space">
							<input type="text" id="tel" name="tel" title="전화번호"  placeholder="- 제외하고입력"  class="int" maxlength="40">
						</span>
                    </div>
                   

                   
                    <div class="join_row join_email">
                        <h3 class="join_title"><label for="email">본인 확인 이메일<span class="terms_choice">(필수)</span></label></h3>
                        <span class="ps_box int_email box_right_space">
							<input type="text" id="email" name="email" maxlength="100" class="int" maxlength="100">
						</span>
                    </div>
                    <span class="error_next_box" id="emailMsg" style="display:none" role="alert"></span>
                </div>
              
              
                <div class="btn_area">
                	<input type="submit" id="btnJoin" class="btn_type btn_primary" value="가입하기" >
                <!-- 	<button type="button" id="btnJoin" class="btn_type btn_primary"><span>가입하기</span></button>   onclick="javascript:checkSubmit()"
                 --></div>
            </div>
        </div>
    </div>
    <!-- // container -->
</form>
</div>
<!-- 

<script type="text/javascript">
	$(document).ready(function() {
		$("#btnJoin").click(function() {
			document.join_form.action = "${path}join.br";
			document.join_form.submit();
		});
		
	});
</script> -->


</body>
</html>