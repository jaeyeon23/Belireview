<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<link href="/brw/resources/Jcss/join.css" rel="stylesheet"> 
	<style type="text/css">
		#sc_big{
			border: 1px solid #403e72;
		}
	</style>
</head>
<body>
	<div id="wrap">
	 <div id="content">
		<!-- <center><img src="/brw/resources/images/logos.jpg" width="150px" alt=""></center> -->
		<br><br><br>
        <!-- tg-text=title -->
        <h2 class="blind">빌리뷰 회원가입완료</h2>
        <div class="join_content">
            <div class="join_form">
                <form id="join_form" method="GET" action="/user2/V2Join.nhn?m=begin" >
                    <input type="hidden" id="token_sjoin" name="token_sjoin" value="uKgeb9OiD5AQjFM0">
                    <!-- 약관동의 -->
                    <div class="terms_p" id ="sc_big">
                        <p class="terms_chk_all">
								<span class="input_chk">
									${NAME}님! 회원가입이 완료되었습니다.<br>
									<hr>
									빌리뷰 가입을 환영합니다.<br>
									최신 소식부터 평까지 다양한 서비스를 누려보세요^^
								</span>
                        </p>
                           
                    </div>
                    <!-- //약관동의 -->

                   
                    <div class="btn_area double">
                        <span><!-- tg-text=terms_button_cancel --><a href="/brw/main.br" id="btnCancel" class="btn_type btn_default" role="button">메인으로</a></span>
                        <span><!-- tg-text=terms_button_agree --><a href="join.br" id="btnAgree" class="btn_type btn_primary" role="button">로그인</a></span>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <!-- //content -->
    </div>


</body>
</html>