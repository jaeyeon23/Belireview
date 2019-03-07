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
	<!-- <input type="hidden" id="email_marketing" name="email_marketing" value="1">
     -->
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
                        </span>
                        <span class="error_next_box" id="idMsg" style="display:none" role="alert"></span>
                    </div>

                    <div class="join_row">
                        <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                        <span class="ps_box int_pass" id="pswd1Img">
							<input type="password" id="password" name="password" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
                            <span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
						</span>
						<span class="error_next_box" id="pswd1Msg" style="display:none" role="alert"></span>
						
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
						<span class="error_next_box" id="nameMsg" style="display:none" role="alert"></span>
                    </div>
                    
                    <div class="join_row">
                        <h3 class="join_title"><label for="name">전화번호</label></h3>
                        <span class="ps_box box_right_space">
							<input type="text" id="tel" name="tel" title="전화번호"  placeholder="- 제외하고입력"  class="int" maxlength="40">
						</span>
						<span class="error_next_box" id="telMsg" style="display:none" role="alert"></span>
                    </div>
                   
					
					<div class="join_row join_mobile">
                            <h3 class="join_title"><label for="email">이메일 인증</label></h3>
                            <div class="int_mobile_area">
                                <span class="ps_box int_mobile">
                                	<input type="text" id="email" name="email" placeholder="이메일 입력" aria-label="이메일 입력" class="int" maxlength="60">
                                   <!--  <input type="tel" id="iphoneNo" name="iphoneNo" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16"> -->
                                </span>
                                <a href="#" class="btn_verify btn_primary" id="btnIpinSend" role="button">
                                    <span class="">인증번호 받기</span>
                                </a>
                            </div>
                            <div class="ps_box_disable box_right_space" id="iauthNoBox">
                                <input type="tel" id="iauthNo" name="iauthNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="iwa_verify" class="int" disabled maxlength="4">
                                <label id="iwa_verify" for="iauthNo" class="lbl">
                                    <span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span>
                                    <span class="input_code" id="iauthNoCode" style="display:none;"></span>
                                </label>
                            </div>
                            <span class="error_next_box" id="emailNoMsg" style="display:none" role="alert">필수 정보입니다.</span>
                            <span class="error_next_box" id="iauthNoMsg" style="display:none" role="alert">필수 정보입니다.</span>
                            <span class="error_next_box" id="ijoinMsg" style="display:none" role="alert">필수 정보입니다.</span>
                        </div>
				
                   
                  <!--   <div class="join_row join_email">
                        <h3 class="join_title"><label for="email">본인 확인 이메일<span class="terms_choice">(필수)</span></label></h3>
                        <span class="ps_box int_email box_right_space">
							<input type="text" id="email" name="email" maxlength="100" class="int" maxlength="100">
						</span>
                    </div>
                    <span class="error_next_box" id="emailMsg" style="display:none" role="alert"></span> -->
                   
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


<script type="text/JavaScript">
	var idFlag = false;
	var pwFlag = false;
	
	/* 아이디입력여부 */
	$("input[name = id]").blur(function() {
		var idFlag = false;
		checkId("first");
	});
	function checkId(event) {
        if(idFlag) return true;

        var id = $("#id").val();
        var oMsg = $("#idMsg");

        if ( id == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            return false;
        }else{
        	oMsg.slideUp();
        }
        
        /* 아이디중복여부 */
        $.ajax({
            type:"GET",
            url: "/user2/joinAjax.nhn?m=checkId&id=" + id ,
            success : function(data) {
                var result = data.substr(4);

                if (result == "Y") {
                    if (event == "first") {
                        showSuccessMsg(oMsg, "사용가능한 아이디입니다.");
                    } else {
                        hideMsg(oMsg);
                    }
                    idFlag = true;
                } else {
                    showErrorMsg(oMsg, "이미 사용중인 아이디입니다.");
                }
            }
        });
        /* 끝  */
        return true;
    }
	
	
	/* 비밀번호입력여부 */
	$("input[name = password]").blur(function() {
		var pwFlag = false;
		checkPassword();
	});
	function checkPassword() {
        if(pwFlag) return true;

        var password = $("#password").val();
        var oMsg = $("#pswd1Msg");

        if ( password == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            return false;
        }else{
        	oMsg.slideUp();
        }
        
        return true;
    }
	/* 비밀번호 일치여부 */
	$("input[name = pswd2]").blur(function() {
		checkPswd2();
	});
	function checkPswd2() {
        var password = $("#password");
        var pswd2 = $("#pswd2");
        
        var oMsg = $("#pswd2Msg");

        if ( pswd2.val() == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            return false;
        }
        
        if( pswd2.val() != password.val() ){
        	showErrorMsg(oMsg,"비밀번호가 불일치합니다.");
            return false;
        }else{
        	showSuccessMsg(oMsg,"일치합니다.");
        	return true;
        }
        return true;
    }
	
	
	/* 이름입력여부 */
	$("input[name = name]").blur(function() {
		checkName();
	});
	function checkName() {
        var name = $("#name").val();
        var oMsg = $("#nameMsg");

        if ( name == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            return false;
        }else{
        	oMsg.slideUp();
        }

        return true;
    }
	
	/* 전화번호입력여부 */
	$("input[name = tel]").blur(function() {
		checkTel();
	});
	function checkTel() {
        var tel = $("#tel").val();
        var oMsg = $("#telMsg");

        if ( tel == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            return false;
        }else{
        	oMsg.slideUp();
        }

        return true;
    }
	
	/* 이메일입력여부 */
	$("input[name = email]").blur(function() {
		checkEmail();
	});
	function checkEmail() {
        var email = $("#email").val();
        var oMsg = $("#emailNoMsg");

        if ( email == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            return false;
        }else{
        	oMsg.slideUp();
        }

        return true;
    }
	
	/* 메시지 출력 */
	function showErrorMsg(obj, msg) {
		obj.attr("class", "error_next_box");
		obj.html(msg);
		obj.slideDown();
	}
	function showSuccessMsg(obj, msg) {
		obj.attr("class", "error_next_box green");
		obj.html(msg);
		obj.slideDown();
	}

	function showAuthDefaultBox(oBox, oCode) {
		oBox.attr("class", "ps_box");
		oCode.html("");
		oCode.hide();
	}

	function showAuthSuccessBox(oBox, oCode, msg) {
		oBox.attr("class", "ps_box accord");
		oCode.html(msg);
		oCode.show();
	}

	function showAuthErrorBox(oBox, oCode, msg) {
		oBox.attr("class", "ps_box discord");
		oCode.html(msg);
		oCode.show();
	}
</script>



</body>
</html>













