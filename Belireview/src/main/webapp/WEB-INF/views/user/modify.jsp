<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정폼</title>
	    <link href="/brw/resources/Jcss/join.css" rel="stylesheet">
	    
</head>
<body>
<div id="wrap">
	<form id="join_form" name="join_form" method="post" action="#" onsubmit="return checkSubmit()">
	
	<input type="hidden" id="email_marketing" name="email_marketing" value="${email_marketing}">
    <input type="hidden" id="sms_marketing" name="sms_marketing" value="${sms_marketing}">    
    
    <!-- container -->
    <div id="container" role="main">
        <div id="content">
        	<center><img src="/brw/resources/images/logos.jpg" width="150px" alt=""></center>
        	<br><br>
            <div class="join_content">
                <!-- 아이디, 비밀번호 입력 -->
                <div class="row_group">
                	<font size="3" color="#403e72"><b>기본정보</b></font>
                    <div class="join_row join_mobile">
                        <h3 class="join_title"><label for="id">아이디</label></h3>
                        <div class="ps_box_disable box_right_space" >
                            <input type="text" id="id" name="id" value="${ID}" aria-describedby="iwa_verify" class="int" disabled maxlength="20">
                        </div>
                    </div>
                    
                     <!-- 이름 입력 -->
                <div class="row_group">
                    <!-- lang = ko_KR -->
                    <div class="join_row">
                        <h3 class="join_title"><label for="name">이름</label></h3>
                        <span class="ps_box box_right_space">
							<input type="text" id="name" name="name" value="${NAME}" class="int" maxlength="40">
						</span>
						<span class="error_next_box" id="nameMsg" style="display:none" role="alert"></span>
                    </div>
                    
                   
                    <div class="join_row join_mobile">
                            <h3 class="join_title"><label for="tel">전화번호</label></h3>
                            <div class="int_mobile_area">
                                <span class="ps_box_disable box_right_space">
                                	<input type="text" id="tel" name="tel" value="${TEL}" class="int" maxlength="10" disabled>
                                </span>
                                <a href="javascript:open_telBt();" class="btn_verify btn_primary" id="btnIpinSend" name="btnIpinSend" role="button">
                                    <span class="" id="btn_go" >수정</span>
                                    <span class="" id="btn_go_ok" >수정완료</span> 
                                </a>
                            </div>
                            <span class="error_next_box" id="telMsg" style="display:none" role="alert"></span>
                     </div>
                    
					
					<div class="join_row join_mobile">
                            <h3 class="join_title"><label for="email">이메일 인증</label></h3>
                            <div class="int_mobile_area">
                                <span class="ps_box int_mobile">
                                	<input type="text" id="email" name="email" value="${EMAIL}" class="int" maxlength="60">
                                </span>
                                <a href="javascript:email_code();" class="btn_verify btn_primary" id="btnIpinSend" name="btnIpinSend" role="button">
                                    <span class="" id="no_btn" >인증번호받기</span>
                                    <span class="" id="yes_btn" >인증완료</span>
                                    <!--  <span class="" id="yes_btn_go" >수정</span> -->
                                </a>
                            </div>
                            <div class="ps_box_disable box_right_space" id="iauthNoBox">
                                <input type="tel" id="iauthNo" name="iauthNo" placeholder="인증번호를 입력하세요" aria-label="인증번호를 입력하세요" aria-describedby="iwa_verify" class="int" disabled maxlength="7">
                            </div>
                            <span class="error_next_box" id="emailMsg" style="display:none" role="alert">필수 정보입니다.</span>
                      </div>
				
               		</div>
               		
               		
               		<hr>
					
                    <div class="join_row">
                        <h3 class="join_title"><label for="pswd1">비밀번호 변경</label></h3>
                        <span class="ps_box int_pass" id="pswd1Img">
							<input type="password" id="password" name="password" class="int" placeholder="새 비밀번호를 입력해주세요" aria-describedby="pswd1Msg" maxlength="20">
                            <span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
						</span>
                        <span class="ps_box int_pass_check" id="pswd2Img">
							<input type="password" id="pswd2" name="pswd2" class="int" placeholder="새 비밀번호를 한번 더 확인해 주세요" aria-describedby="pswd2Blind" maxlength="20">
						</span>
                        <span class="error_next_box" id="pswd2Msg" style="display:none" role="alert"></span>
                    </div>
              	  </div>
              	  <!-- // 아이디, 비밀번호 입력 -->
               		
               		<hr>
               		<font size="3" color="#403e72"><b>선택정보</b></font>
               		<h3 class="join_title"><label for="email">소식받기</label></h3>
              
              
                <div class="btn_area">
                	<input type="submit" id="btnJoin" class="btn_type btn_primary" value="회원정보수정" >
                </div>
            </div>
        </div>
    </div>
    <!-- // container -->
</form>
</div>


<script type="text/JavaScript">
	$('#yes_btn').hide(); /* 인증완료버튼을 숨겨둠 */
	
	$('#btn_go_ok').hide(); /* 수정완료버튼을 숨겨둠 */
	
	
	/* 가입버튼 클릭시 가입조건 만족 여부를 알려줄 스크립터 전역변수 */
	var id_ok ="";
	var password_ok ="";
	var email_ok ="";
	var name_ok="";
	var tel_ok="";
	
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
        	$.post("checkId.br", {id:id} ,function(data){
        		if (data==1){
        			showErrorMsg(oMsg,"이미 등록된 아이디입니다.");
                    return false;
        		} else {
        			showSuccessMsg(oMsg, "사용가능한 아이디입니다.");
        			id_ok= "ok"; 
        		}
        	});	
        }
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
        	password_ok ="ok";
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
        	name_ok ="ok";
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
        	tel_ok = "ok";
        }

        return true;
    }
	
	/* 이메일입력여부 */
	$("input[name = email]").blur(function() {
		checkEmail();
	});
	function checkEmail() {
        var email = $("#email").val();
        var oMsg = $("#emailMsg");

        if ( email == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            return false;
        }else{
        	oMsg.slideUp();
        }

        return true;
    }
	

	/* 이메일인증 */
	function email_code(){
		var auth_email = $("#email").val(); //회원가입누를때 이메일 바꿔 내는것을 방지 ||인증을 받은 이메일 자바스크립트의 전역변수에 넣기
		var email = $("#email").val();
		var oMsg = $("#emailMsg");

		$.ajax({
			type : "POST",
			url : "email_auth.br",
			data : ({
				mode : "email_code",
				email : email
			}),
			success : function(data) {
				console.log(data);
				if (data != 0) {
					showErrorMsg(oMsg,"이미 가입된 이메일 입니다. 다른이메일을 입력해주세요");
				} else {
					showSuccessMsg(oMsg, "인증번호를 요청하신 이메일로 발송했습니다.");
					var auth2 = document.getElementById("iauthNo"); /* 이메일인증번호를 보낼 시 인증번호input칸이 풀린다 이유: 이메일값과 인증번호값을 넣지않고 회원가입을 하는것을 막기위해 */
					auth2.removeAttribute("disabled"); /* 인증번호 input칸의 disabled속성을 삭제 */
				}

				if (data != null) {
					console.log("로그 내용2" + data);
				}
			},
			error : function(e) {
				showErrorMsg(oMsg,"알맞은 이메일로 인증해주세요.");
			}
		});

	}
	
	
	/* 인증번호 일치여부 */
	$("input[name = iauthNo]").blur(function() {
		member_send();
	});
	function member_send() {
		var email = $("#email").val();
		var auth = $("#iauthNo").val();
		var oMsg = $("#emailMsg");
		
		$.ajax({
			type : "POST",
			url : "email_auth_success.br",
			data : ({
				email : email,
				auth : auth
			}),
			success : function(data) {
				console.log("로그 내용1");
				if (data == 1) {
					showSuccessMsg(oMsg,"인증이 완료되었습니다.");
					var auth2 = document.getElementById("iauthNo"); /* 인증창닫기위해서  */
					auth2.setAttribute("disabled", "disabled"); /* 인증완료 후 인증창 닫힘 */
					
					var auth3 = document.getElementById("email"); /* 인증창닫기위해서  */
				    auth3.setAttribute("disabled", "disabled"); /* 인증완료 후 이메일변경불가 닫힘 */
					

					$('#no_btn').hide(); /* 인증번호에서 */
					$('#yes_btn').show(); /* 인증완료로 바꿈 */
					$("#btnIpinSend").click(function(event){ 
         				   event.preventDefault(); // a링크 이동막음
         				   showSuccessMsg(oMsg,"이미 인증이 완료되었습니다.");
     				}); 
					
					email_ok ="ok";


				} else {
					showErrorMsg(oMsg, "인증번호가 맞지않습니다. 다시 입력하세요.");
					f.auth.value = "";
					console.log("로그 내용3");
				}
			},
			error : function(e) {
				showErrorMsg(oMsg,"잠시후 다시 시도해주세요.");
			}
		});
	}

	/* 이메일인증끝 */

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

	
	
	/* 가입하기를 눌렀을때 */
	function checkSubmit(){
		var join_form = document.join_form;
		if ( id_ok == "") {
			alert('아이디를 확인해주세요.');
			return false;
		} else if (password_ok == "") {
			alert('비밀번호를 다시 확인해주세요.');
			return false;
		} else if (name_ok == "") {
			alert("이름을 확인해주세요.");
			return false;
		} else if (tel_ok == "") {
			alert("전화번호를 확인해주세요.");
			return false;
		} else if (email_ok == "") {
			alert("이메일인증을 완료해주세요.");
			return false;
		} else {
			var auth5 = document.getElementById("email"); /* disabled일 경우 값이 null이되므로 가입조건이 모두만족하면  */
			auth5.removeAttribute("disabled"); /* 이메일 input칸의 disabled속성을 삭제하여 넘겨줌 */

			return true;
		}
	}
	
	
	
	/* 회원수정용 추가 스크립트 시작*/
	/* 전화번호 수정버튼 클릭시 버튼 활성화 */
	function open_telBt() {
			var oMsg = $("#telMsg");
		
			/* if ( "#btn_go_ok" == hide) {
			 */	
				showSuccessMsg(oMsg,"새로운번호를 입력해주세요.");
				var bb1 = document.getElementById("tel");
				bb1.removeAttribute("disabled"); 
				$('#btn_go_ok').show(); 
				$('#btn_go').hide();
				
				/* var auth3 = document.getElementById("email"); 
				auth3.setAttribute("disabled", "disabled"); 
					

				$('#no_btn').hide(); 
				$('#yes_btn').show(); 
				$("#btnIpinSend").click(function(event){ 
         		   event.preventDefault(); 
         		   showSuccessMsg(oMsg,"이미 인증이 완료되었습니다.");
     			}); 
					
					email_ok ="ok";  */


			/* }  */
	}
</script>



</body>
</html>













