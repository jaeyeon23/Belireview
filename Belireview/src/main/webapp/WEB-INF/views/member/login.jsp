<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
    <div id="u_skip">
        <a href="#content" onclick="document.getElementById('content').tabIndex=-1;document.getElementById('content').focus();return false;"><span>본문으로 바로가기</span></a>
    </div>
	<!-- header -->
	<div id="header">
		<h1><a href="http://www.naver.com" class="sp h_logo" onclick="nclks('log.naver',this,event)">
			<span class="blind">NAVER</span></a>
		</h1>
	</div>
	<!-- //header -->
	<!-- container -->
	<div id="container">
		<!-- content -->
		<div id="content">
			<div class="title" aria-live="assertive">
				<p></p>
			</div>
				<form id="frmNIDLogin" name="frmNIDLogin" target="_top" autocomplete="off" action="https://nid.naver.com/nidlogin.login" method="POST" onsubmit="return confirmSplitSubmit();">
				<fieldset class="login_form">
					<legend class="blind">로그인</legend>
					<div class="id_area">
						<div class="input_row" id="id_area">
							<span class="input_box">
								<label for="id" id="label_id_area" class="lbl" style="display: block;">아이디</label>
								<input type="text" id="id" name="id" accesskey="L" placeholder="아이디" class="int" maxlength="41" value="">
							</span>
							<button type="button" disabled="" title="delete" id="id_clear" class="wrg">삭제</button>
						</div>
						<div class="error" id="err_empty_id" style="display:none" aria-live="assertive"></div>
					</div>
					<div class="pw_area">
						<div class="input_row" id="pw_area">
							<span class="input_box">
								<label for="pw" id="label_pw_area" class="lbl">비밀번호</label>
								<input type="password" id="pw" name="pw" placeholder="비밀번호" class="int" maxlength="16" onkeypress="capslockevt(event);getKeysv2();" onkeyup="checkShiftUp(event);" onkeydown="checkShiftDown(event);">
							</span>
							<button type="button" disabled="" title="delete" id="pw_clear" class="wrg">삭제</button>
							<div class="ly_v2" id="err_capslock" style="display:none;">
								<div class="ly_box">
									<p><strong>Caps Lock</strong>이 켜져 있습니다.</p>
								</div>
								<span class="sp ly_point"></span>
							</div>
						</div>
						<div class="error" id="err_empty_pw" style="display:none" aria-live="assertive"></div>
					</div>
					<input type="submit" title="로그인" alt="로그인" value="로그인" class="btn_global" onclick="nclks('log.login',this,event)">
				</fieldset>
			</form>
			<div class="position_a">
				<div class="find_info">
					<a target="_blank" id="idinquiry" href="https://nid.naver.com/user/help.nhn?todo=idinquiry">아이디 찾기</a> <span class="bar" aria-hidden="true">|</span> <a target="_blank" id="pwinquiry" href="https://nid.naver.com/nidreminder.form">비밀번호 찾기</a> <span class="bar" aria-hidden="true">|</span> <a target="_blank" id="join" href="https://nid.naver.com/user/join.html?lang=ko_KR">회원가입</a>
				</div>
			</div>
		</div>
		<!-- //content -->
	</div>
	<!-- //container -->
	<!-- footer -->
	<div id="footer">
	</div>
	<!-- //footer -->
</div>
<script type="text/javascript" src="/login/js/common.all.js?141216"> </script>
<script type="text/javascript">
var session_keys = "";
var pc_keyboard_close="<span class=\"sp\">PC 키보드 닫기</span>";
var pc_keyboard_open="<span class=\"sp\">PC 키보드 보기</span>";
var view_char="한글 보기";
var view_symbol="특수기호 보기";

addInputEvent('id', 'id_area');
addInputEvent('pw', 'pw_area');
initSmartLevel();
var login_chk = $('login_chk');
if(login_chk.attachEvent) {
	login_chk.attachEvent("onchange", function(){persist_usage();});
} else if (login_chk.addEventListener) {
	login_chk.addEventListener("change", function(){persist_usage();}, false);
}
function persist_usage()
{
	var login_chk = $("login_chk");
	if (login_chk.checked==true)
	{
		show("persist_usage");
		hide('onetime_usage');
		view_onetimeusage = false;
	}
	else
	{
		hide("persist_usage");
	}
}
var view_onetimeusage = false;
function viewOnetime()
{
	if (view_onetimeusage)
	{
		hide('onetime_usage');
		view_onetimeusage = false;
	}
	else
	{
		hide("persist_usage");
		show('onetime_usage');
		view_onetimeusage = true;
	}
}
try{
	if (navigator.appVersion.toLowerCase().indexOf("win") != -1) {
		$('id').style.imeMode = "disabled";
		document.msCapsLockWarningOff = true;
	}
}catch(e) {}
try{
	if ( $('id').value.length == 0 )
	{
		$('id').focus();
	}
	else
	{
		$('pw').focus();
	}
}catch (e){}
function selectItemByValue(elmnt, value){
	isSet = false;
	for(var i=0; i < elmnt.options.length; i++)
	{
		if(elmnt.options[i].value === value) {
			elmnt.selectedIndex = i;
			isSet = true;
			break;
		}
	}
	if (!isSet)
		elmnt.selectedIndex=1;
}
try {
selectItemByValue(locale_switch, 'ko_KR');
}catch (e){}
var id_error_msg="아이디를 입력해주세요.";
var pw_error_msg="비밀번호를 입력해주세요.";
var inSubmitProgress = false;
function confirmSplitSubmit()
{
        if (inSubmitProgress) {
                return false;
        }
        inSubmitProgress = true;
        var id = $("id");
        var pw = $("pw");
        var encpw = $("encpw");
        
        if(id.value == "") {
                show("err_empty_id");
                $("err_empty_id").innerHTML=id_error_msg;
                hide("err_empty_pw");
                $("err_empty_pw").innerHTML="";
                hide("err_common_pw1");
                hide("err_common");
                id.focus();
                inSubmitProgress = false;
                return false;
        } else if(pw.value == "") {
                show("err_empty_pw");
                $("err_empty_pw").innerHTML=pw_error_msg;
                hide("err_empty_id");
                $("err_empty_id").innerHTML="";
                hide("err_common_pw1");
                hide("err_common");
                pw.focus();
                inSubmitProgress = false;
                return false;
        }
        try{
                $("ls").value = localStorage.getItem("nid_t");
        }catch(e){}
        return encryptIdPwSplit();
}
function encryptIdPwSplit() {
        var id = $("id");
        var pw = $("pw");
        var encpw = $("encpw");
        var rsa = new RSAKey;

        if (keySplit(session_keys)) {
                rsa.setPublic(evalue, nvalue);
                try{
                        encpw.value = rsa.encrypt(
                                getLenChar(sessionkey) + sessionkey +
                                getLenChar(id.value) + id.value +
                                getLenChar(pw.value) + pw.value);
                } catch(e) {
                        inSubmitProgress = false;
                        return false;
                }
                $('enctp').value = 1;

                setTimeout(function() {
                        $("id").value = "";
                        $("pw").value = "";
                        $("bvsd").value = "timeout";
                        $('frmNIDLogin').submit();
                }, 5000);
                try {
                        if (bvsd){
                                bvsd.f(function(a) {
                                        $("id").value = "";
                                        $("pw").value = "";
                                        $("bvsd").value = a;
                                        $('frmNIDLogin').submit();
                                });
                        }
                } catch (e) {
                        $("id").value = "";
                        $("pw").value = "";
                        $("bvsd").value = "error1|"+e.name+"|"+e.message;;
                        $('frmNIDLogin').submit();
                }
        }
        else
        {
                getKeyByRuntimeIncludeSplit();
        }
        inSubmitProgress = false;
        return false;
}
function getKeyByRuntimeIncludeSplit() {
        try {
                var keyjs  = document.createElement('script');
                keyjs.type = 'text/javascript';
                keyjs.src = '/login/ext/keys_js3.nhn';
                document.getElementsByTagName('head')[0].appendChild(keyjs);
        } catch (e) {
        }
}
</script>
<script type="text/javascript" src="/login/js/bvsd.1.3.4.min.js"></script>
<script type="text/javascript">
var porperties = {
	keyboard: [{
		id: "id"
	}, {
		id: "pw",
		secureMode: true
	}],
	modeProperties: {
		mode: 4
	}
};
bvsd = new sofa.Koop(porperties);


</script>
<script type="text/javascript" src="https://nid.naver.com/login/js/lcs_nclicks.js?dt=20190122"></script>
<script type="text/javascript"> 
lcs_do(); 
var g_ssc = "nid.login_kr";
var ccsrv = "cc.naver.com";
</script>
<div id="nv_stat" style="display:none;">20</div>

</body>
</html>