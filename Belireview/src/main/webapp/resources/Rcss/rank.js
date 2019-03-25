var thumbName = "thumb/thn_";
//var thumbName = "";
var thumbMainName = "thumbMain/thn_";
var imgUrl = "http://kobis.or.kr";  //"http://kobis.or.kr";
var strUa = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36";
var posterNm = [];
var officePage = 1;		// 해외박스오피스 페이지번호


function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3)
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) {
    	obj=obj.style; 
    	v=(v=='mainshow')?'visible':(v=='mainhide')?'hidden':v;}
    obj.visibility=v; }
  
}

//박스오피스 탭 기능
function fnBoxMovieTab(n){
	if(n == 5){
	document.getElementById("boxMovieTab1").style.display = "none";
	document.getElementById("boxMovieTab1").style.height = "0px";
	document.getElementById("boxMovieTab2").style.display = "none";
	document.getElementById("boxMovieTab2").style.height = "0px";
	document.getElementById("boxMovieTab3").style.display = "none";
	document.getElementById("boxMovieTab3").style.height = "0px";
	document.getElementById("boxMovieTab4").style.display = "none";
	document.getElementById("boxMovieTab4").style.height = "0px";
	document.getElementById("boxMovieTab5").style.display = "block";
	document.getElementById("boxMovieTab5").style.height = "340px";
	} else if (n == 4) {
	document.getElementById("boxMovieTab1").style.display = "none";
	document.getElementById("boxMovieTab1").style.height = "0px";
	document.getElementById("boxMovieTab2").style.display = "none";
	document.getElementById("boxMovieTab2").style.height = "0px";
	document.getElementById("boxMovieTab3").style.display = "none";
	document.getElementById("boxMovieTab3").style.height = "0px";
	document.getElementById("boxMovieTab4").style.display = "block";
	document.getElementById("boxMovieTab4").style.height = "340px";
	document.getElementById("boxMovieTab5").style.display = "none";
	document.getElementById("boxMovieTab5").style.height = "0";
	} else if (n == 3) {
	document.getElementById("boxMovieTab1").style.display = "none";
	document.getElementById("boxMovieTab1").style.height = "0px";
	document.getElementById("boxMovieTab2").style.display = "none";
	document.getElementById("boxMovieTab2").style.height = "0px";
	document.getElementById("boxMovieTab3").style.display = "block";
	document.getElementById("boxMovieTab3").style.height = "340px";
	document.getElementById("boxMovieTab4").style.display = "none";
	document.getElementById("boxMovieTab4").style.height = "0px";
	document.getElementById("boxMovieTab5").style.display = "none";
	document.getElementById("boxMovieTab5").style.height = "0";
	} else if (n == 2) {
	document.getElementById("boxMovieTab1").style.display = "none";
	document.getElementById("boxMovieTab1").style.height = "0px";
	document.getElementById("boxMovieTab2").style.display = "block";
	document.getElementById("boxMovieTab2").style.height = "340px";
	document.getElementById("boxMovieTab3").style.display = "none";
	document.getElementById("boxMovieTab3").style.height = "0px";
	document.getElementById("boxMovieTab4").style.display = "none";
	document.getElementById("boxMovieTab4").style.height = "0px";
	document.getElementById("boxMovieTab5").style.display = "none";
	document.getElementById("boxMovieTab5").style.height = "0";
	} else {
	document.getElementById("boxMovieTab1").style.display = "block";
	document.getElementById("boxMovieTab1").style.height = "340px";
	document.getElementById("boxMovieTab2").style.display = "none";
	document.getElementById("boxMovieTab2").style.height = "0px";
	document.getElementById("boxMovieTab3").style.display = "none";
	document.getElementById("boxMovieTab3").style.height = "0px";
	document.getElementById("boxMovieTab4").style.display = "none";
	document.getElementById("boxMovieTab4").style.height = "0px";
	document.getElementById("boxMovieTab5").style.display = "none";
	document.getElementById("boxMovieTab5").style.height = "0";
	}
}

//포스터 제목
function fnMovieNm(n,str){
	$("#mainpictureNm"+n).val(string_cut(str, 12));
}

function fnPosterNm(n){
	$("#mainpictureNm"+n).val(posterNm[n]);
}

//숫자 포멧
function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (var i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}


//금액 콤마
function commify(n) {
	  var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
	  n += '';                          // 숫자를 문자열로 변환
	  while (reg.test(n))
	    n = n.replace(reg, '$1' + ',' + '$2');
	  return n;
}

//문자열 처리
function string_cut(str, len) {
	var strCut="";
	if( (str == null) || (str == "") )
		return "";
	if(str.length <= len)
		strCut = str.substr(0, len);
	else
		strCut = str.substr(0, len)+"...";
    return strCut;
}
function string_cut2(str, len) {
	var strCut="";
	if( (str == null) || (str == "") )
		return "";
	if(str.length <= len)
		strCut = str.substr(0, len);
	else
		strCut = str.substr(0, len)+" . . .";
    return strCut;
}

function initMainTabMu(tabIdx){
	$("#total").hide();
	$("#area").hide();
	$("#cinema").hide();
	$("#"+tabIdx).show();
}

function fn_goPage(idx){
	if(idx == "1"){
		if($("#total").css("display") == "block")
			top.location.href="/kobis/business/stat/them/findNationalityShareList.do";
		else if($("#area").css("display") == "block")
			top.location.href="/kobis/business/stat/them/findAreaShareList.do";
		else if($("#cinema").css("display") == "block")
			top.location.href="/kobis/business/mast/thea/findTheaterCodeList.do";
	}
	else if(idx == "2"){
		if($("#diversity").css("display") == "block")
			top.location.href="/kobis/business/mast/mvie/findDiverMovList.do?sPlanCd=00";
		else if($("#plan").css("display") == "block")
			top.location.href="/kobis/business/mast/mvie/findDiverMovList.do?sPlanCd=01";
		else if($("#caption").css("display") == "block")
			top.location.href="/kobis/business/mast/mvie/findDiverMovList.do?sPlanCd=02";
	}
}

function fn_OpenmovieList(obj){
	$(obj).unbind('error').attr('onerror','');
	$(obj).attr("src","/kobis/web/comm/images/no_img.jpg");
	$(obj).attr("style","height:129px;width:90px;");
}


/* 창 닫기 */
function wrap_layer_close(n){

	var infoOffset1 = $("#wrap_layer_1").offset();
	var infoOffset2 = $("#wrap_layer_2").offset();
	var infoOffset3 = $("#wrap_layer_3").offset();
	var infoOffset4 = $("#wrap_layer_4").offset();

	$("#wrap_layer_"+n).css("display","none");

		$("#wrap_layer_1").offset({
			 top : infoOffset1.top,
             left : infoOffset1.left
          });

		$("#wrap_layer_2").offset({
			 top : infoOffset2.top,
             left : infoOffset2.left
          });
		$("#wrap_layer_3").offset({
			 top : infoOffset3.top,
             left : infoOffset3.left
          });
		$("#wrap_layer_4").offset({
			 top : infoOffset4.top,
             left : infoOffset4.left
          });

		if (layer_chk()<1 ){
		$("#layerBoxs").css("display","none");
		$("#wrap_layer").css("display","none");
		}
}

function setCookie(sel){

	wrap_layer_close(sel);

	$.ajax({
		type: "GET",
		url: "setCookie.do",
		dataType: "json",
		contentType: "application/json+sua",
		cache: false, // 이벤트 발생시마다 서버와 통신함
		data:{notify:encodeURIComponent("ok"),seqNo: $("#notiSeqNo"+sel).val()},
		success:function(data){
			//location.href="/kobis/business/main/main.do";
		},error:function(data){
			//location.href="/kobis/business/main/main.do";
		}
	});
}

/* 공지사항 창 채크*/
function layer_chk(){

	var chk_cnt = 1;
	var chk_result = 0;
	for (chk_cnt=1;chk_cnt<5;chk_cnt++){
		if (document.getElementById("wrap_layer_"+chk_cnt).style.display != "none") {
			chk_result++;
		}
	}
	return chk_result;
}


function fn_moveRankBox(idx){

	if($("[id^=rankBox]").length <= 6){
		$("#rollMain").smoothDivScroll("destroy");
		var $rankBox7_ = $("#rankBox1").clone();
		$rankBox7_.attr("id","rankBox7");
		$("#scrollableArea").append($rankBox7_);
		var $rankBox8_ = $("#rankBox2").clone();
		$rankBox8_.attr("id","rankBox8");
		$("#scrollableArea").append($rankBox8_);
		var $rankBox9_ = $("#rankBox3").clone();
		$rankBox9_.attr("id","rankBox9");
		$("#scrollableArea").append($rankBox9_);
		rollMain("N");
	}

	$("#rollMain").smoothDivScroll("stopAutoScroll");
	$("#rollMain").smoothDivScroll("recalculateScrollableArea");
	$("#rollMain").smoothDivScroll("restoreOriginalElements");
	$("#rollMain").smoothDivScroll("moveToElement", "number", idx);
}
function rollMain(useJeventYn){
	if(useJeventYn == "Y"){
		$("#topLayerBlack1").mouseover(function(){
			$("#rollMain").smoothDivScroll("stopAutoScroll");
		});
		$("#topLayerBlack1").mouseout(function(){
			$("#rollMain").smoothDivScroll("startAutoScroll");
		});
	}
	else{
		$("#topLayerBlack1").unbind("mouseover");
		$("#topLayerBlack1").unbind("mouseout");
	}
	$("#rollMain").smoothDivScroll({
		autoScroll: "onstart" ,
		autoScrollDirection: "endlessloopright",
		autoScrollStep: 1,
		autoScrollInterval: 5000,
		autoScrollStep: 326,
		startAtElementId: "rankBox1",
		visibleHotSpots: "always"
	});

	$("#rollMain").smoothDivScroll({autoScroll_endlessloopright: function(eventObj, data) {
		var strId = data["attrId"];
		var intId = parseInt(strId.substr(strId.length-1))+1;
		if(intId > 6)
			intId = 1;

			for(var i=1; i<=6; i++){
				$("#topLayer"+i+"Btn").attr("src","/kobis/web/comm/images/common/main_layer_off.png");
			}
			$("#topLayer"+intId+"Btn").attr("src","/kobis/web/comm/images/common/main_layer_on.png");
		}
	});

	$("#rollMain").smoothDivScroll({movedToElementNumber: function(eventObj, data) {
			for(var i=1; i<=6; i++){
				$("#topLayer"+i+"Btn").attr("src","/kobis/web/comm/images/common/main_layer_off.png");
			}
			$("#topLayer"+data["elementNumber"]+"Btn").attr("src","/kobis/web/comm/images/common/main_layer_on.png");
		}
	}) ;

	/*
	$cycleCtrl = $("#rollMain").cycle({
        fx: "scrollHorz",//scrollHorz, scrollLeft, choose your transition type, ex: fade, scrollUp, shuffle, etc...
        timeout : strTimeout,//6000,
        sync:    true,
        easeIn:  'linear',
        easeOut: 'linear',
    	next:$("#topLayer1Btn"),
    	prev:$("#topLayer2Btn"),
    	prevNextClick:function(isNext, zeroBasedSlideIndex, slideElement){
    		if(isNext){
	    		$("#topLayer1Btn").attr("src","/kobis/web/comm/images/common/main_layer_on.png");
				$("#topLayer2Btn").attr("src","/kobis/web/comm/images/common/main_layer_off.png");
    		}
    		else if(zeroBasedSlideIndex==1){
	    		$("#topLayer2Btn").attr("src","/kobis/web/comm/images/common/main_layer_on.png");
				$("#topLayer1Btn").attr("src","/kobis/web/comm/images/common/main_layer_off.png");
    		}
    		$cycleCtrl.cycle('pause');
    	},
    	before:function(currSlideElement, nextSlideElement, options, forwardFlag){
    		if($(nextSlideElement).attr("id")=="topLayerBlack1"){
	    		$("#topLayer1Btn").attr("src","/kobis/web/comm/images/common/main_layer_on.png");
				$("#topLayer2Btn").attr("src","/kobis/web/comm/images/common/main_layer_off.png");
    		}
    		else if($(nextSlideElement).attr("id")=="topLayerBlack2"){
	    		$("#topLayer2Btn").attr("src","/kobis/web/comm/images/common/main_layer_on.png");
				$("#topLayer1Btn").attr("src","/kobis/web/comm/images/common/main_layer_off.png");
    		}
    	}
    });
	*/
}

function fn_movieSearch(){
	top.location.href="/kobis/business/mast/mvie/searchMovieList.do?sMovName="+$("#sMovName").val();;
}

$(function(){

	$("[name=wideareaAll]").click(function(){
	     if ( $("[name=wideareaAll]").is(":checked") ){
	          $('input[name=wideareaCd]').attr("checked",true)
	           fn_areaImageChk(this.value)
	     } else {
	    	  $('input[name=wideareaCd]').attr("checked",false)
	    	   fn_areaImageChk(this.value)
	     }
	});

	 	$("[name=wideareaCd]").click(function(){
		     if ( $("input[name=wideareaCd]:checkbox:checked").length == 16) {
		    	 $('input[name=wideareaAll]').attr("checked",true)
		    	 fn_areaImageChk(this.value)
		     } else {
		    	 $('input[name=wideareaAll]').attr("checked",false)
		    	 fn_areaImageChk(this.value)
		     }
	});

	//KOBIS 전광판 탭 초기화
	initTabMu("menu", "E", 1);
	//다양성 텝 메뉴 초기화
	initTabMu("menu2", "D", 1);

	var now = new Date();

	//공지사항
	var cnt;
	for (cnt=1;cnt<5;cnt++){
	$("#wrap_layer_"+cnt).css("display","none");
	$("#wrap_layer_"+cnt).css("z-index", "auto");
	//$("#wrap_layer_"+cnt).css("z-index", 9999);
	}


	//최신 개봉작
	$.ajax({
		type : "POST",
		url  : "searchMainLastestOpenning.do",
		dataType : "json",
		beforeSend: function(xhr){
			$("#mainLastestOpenning").prepend("<div id=\"mainLastestOpenning_img\" style=\"width:265px;height:185px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
			$("thead","#mainLastestOpenning").hide();
		},
		success : function(data){
			var evenIdx=true;
			$("#mainLastestOpenning_img","#mainLastestOpenning").remove();
			$("thead","#mainLastestOpenning").show();
			$("#lastestOpenning").remove("li");
			var strArg="";
			$.each(data, function(){
				if(evenIdx){
					evenIdx = false;
					strArg += "<tr class=\"mainlist_bg1\">";
				}
				else{
					evenIdx = true;
					strArg += "<tr class=\"mainlist_bg2\">";
				}
				strArg += "<td class=\"mainlist1\" title=\""+this["mvienm"]+"\"><a class=\"mainlist1_over\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\" alt=\""+this["mvienm"]+"\">"+string_cut(this["mvienm"],12)+"</a><br><em>"+FDate(this["opendt"],'.')+"</em></td>";
				strArg += "<td class=\"mainlist2\">"+this["yrank"]+"</td>";
				strArg += "<td class=\"mainlist3\">"+commify(this["scnt"])+"명</td>";
				strArg += "<td class=\"mainlist4\">"+commify(this["scrncnt"])+"</td>";
				strArg += "</tr>";
				strArg += "<tr>";
				strArg += "<td colspan=\"4\" class=\"mainlist_dot\"></td>";
				strArg += "</tr>";
			});
			if(data.length == 0) {
				strArg += "<tr><td colspan=\"4\" style=\"text-align:center;\" class=\"mainlist1\">최신 개봉 영화가 없습니다.</td></tr>";
			}
			$("#lastestOpenning").append(strArg);
		}
	});

	//개봉 예정작
	$.ajax({
		type : "POST",
		url  : "searchMainOpenBeMovie.do?dummy="+now.getSeconds(),
		dataType : "json",
		beforeSend: function(xhr){
			$("#mainOpenmovieList").prepend("<div id=\"mainOpenmovieList_img\" style=\"width:265px;height:185px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
		},
		success : function(data){
			$("#mainOpenmovieList_img","#mainOpenmovieList").remove();
			$("#openBeMovie").remove("li");
			$.each(data, function(i){
				var strArg="";
				var count=i+1;
				strArg += "<li class=\"mainschedule"+count+"\"><div><ul>";
				strArg += "<li class=\"mainschedule_h\"><a href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"');return false;\"><img src=\""+imgUrl+this["fileSaveLoct"]+thumbName+this["sysFileNm"]+"\" onerror=\"fn_OpenmovieList(this);\" alt=\"개봉 예정작\" /></a></li>";
				strArg += "<li class=\"mainschedule4\">"+this["openDt"]+"</li>";
				if (this["movieNm"].length < 8) {
					strArg += "<li class=\"mainschedule5\" title=\""+this["movieNm"]+"\"><a href=\"#none\" class=\"mainschedule6\" onclick=\"mstView('movie','"+this["movieCd"]+"');return false;\">"+this["movieNm"]+"</a></li>";
				} else {
					strArg += "<li class=\"mainschedule5_L\" title=\""+this["movieNm"]+"\"><a href=\"#none\" class=\"mainschedule6\" onclick=\"mstView('movie','"+this["movieCd"]+"');return false;\">"+string_cut(this["movieNm"],16)+"</a></li>";
				}
			    strArg += "</ul></div></li>";
				$("#openBeMovie").append(strArg);
			});
		}
	});

	//KOBIS 전광판(총관객수)
	$.ajax({
		type : "POST",
		url  : "searchMainKobisTotAudiCnt.do",
		dataType : "json",
		beforeSend: function(xhr){
			$("#total").prepend("<div id=\"total_ingimg\" style=\"width:265px;height:135px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
		},
		success : function(data){
			$.each(data, function(){
				$("#total_ingimg","#total").remove();
				$("#total").remove("ul");
				var strArg="";
				strArg += "<table cellpadding=\"0\" cellspacing=\"0\">";
				strArg += "<tr class=\"maintapbox_bg1\">";
				strArg += "<td class=\"maintapbox3\"><img src=\"/kobis/web/comm/images/main/img_day.gif\" alt=\"일(Day)\"></td>";
				strArg += "<td class=\"maintapbox5\">"+this["dayMmdd"]+"</td>";
				strArg += "<td class=\"maintapbox6\">"+commify(this["dayAudiCnt"])+"명</td>";
				strArg += "</tr>";
				strArg += "<tr><td colspan=\"3\" class=\"maintapbox_dot\"></td></tr>";
				strArg += "<tr class=\"maintapbox_bg2\">";
				strArg += "<td class=\"maintapbox4\"><img src=\"/kobis/web/comm/images/main/img_week.gif\" alt=\"주(Week)\"></td>";
				strArg += "<td class=\"maintapbox5\">"+this["weekMmdd"]+"~"+this["weekDd"]+"(주간)<br>"+this["weekendMmdd"]+"~"+this["weekendDd"]+"(주말)</td>";
				strArg += "<td class=\"maintapbox6\">"+commify(this["weekAudiCnt"])+"명<br>"+commify(this["weekendAudiCnt"])+"명</td>";
				strArg += "</tr>";
				strArg += "<tr><td colspan=\"3\" class=\"maintapbox_dot\"></td></tr>";
				strArg += "<tr class=\"maintapbox_bg1\">";
				strArg += "<td class=\"maintapbox3\"><img src=\"/kobis/web/comm/images/main/img_month.gif\" alt=\"월(Month)\" /></td>";
				strArg += "<td class=\"maintapbox5\">"+this["monthMmdd"]+"~"+this["monthDd"]+"</td>";
				strArg += "<td class=\"maintapbox6\">"+commify(this["monthAudiCnt"])+"명</td>";
				strArg += "</tr>";
				strArg += "<tr><td colspan=\"3\" class=\"maintapbox_dot\"></td></tr>";
				strArg += "<tr class=\"maintapbox_bg2\">";
				strArg += "<td class=\"maintapbox3\"><img src=\"/kobis/web/comm/images/main/img_year.gif\" alt=\"년(Year)\" /></td>";
				strArg += "<td class=\"maintapbox5\">"+this["yearYyyy"]+"년</td>";
				strArg += "<td class=\"maintapbox6\">"+commify(this["yearAudiCnt"])+"명</td>";
				strArg += "</tr>";
				strArg += "<tr><td colspan=\"3\" class=\"maintapbox_dot\"></td></tr>";				
				strArg += "</table>";
				strArg += "<p class=\"maintapbox13\"><font style=\"text-decoration: underline;\">년(Year) 통계</font>는 전일자까지의 마감통계와 금일 실시간 발권데이터를 합한 수치임</p>";

				$("#total").append(strArg);
			});
		}
	});

	//KOBIS 전광판(지역별)
	$.ajax({
		type : "POST",
		url  : "searchMainKobisWideArea.do",
		dataType : "json",
		beforeSend: function(xhr){
			$("#area").prepend("<div id=\"area_ingimg\" style=\"width:265px;height:135px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
		},
		success : function(data){
			var groupIdx=0;
			var strArg="";
			$("#area_ingimg","#area").remove();
			$.each(data, function(){
				var strRank = String(this["rank"]);
				if(strRank.length <= 1)
					strRank = "0"+strRank;
				if(groupIdx < 6){
					if(groupIdx == 0){
						$("#area").remove("#areaSubDiv");
						strArg += "<div id=\"areaSubDiv\" class=\"titbox\"><em>주간 지역별 관객 점유율</em> | <span>"+this["startDate"]+" ~ "+this["endDate"]+"</span></div>";
						strArg += "<ul>";
						strArg += "<li class=\"frst\">";
					}
					strArg += "<p style='height:18px;'><span style=\"float:left;font-size:11px;\">"+strRank+"."+this["wideareaNm"]+"</span><span style=\"float:right;margin-right:7px;\">"+this["cntShare"]+"</span></p>";
				}
				else if((groupIdx < 12) && (groupIdx >= 6)){
					if(groupIdx == 6){
						strArg += "</li>";
						strArg += "<li class=\"secnd\">";
					}
					strArg += "<p style='height:18px;'><span style=\"float:left;font-size:11px;\">"+strRank+"."+this["wideareaNm"]+"</span><span style=\"float:right;margin-right:7px;\">"+this["cntShare"]+"</span></p>";
				}
				else{
					if(groupIdx == 12){
						strArg += "</li>";
						strArg += "<li class=\"last\">";
					}
					strArg += "<p style='height:18px;'><span style=\"float:left;font-size:11px;\">"+strRank+"."+this["wideareaNm"]+"</span><span style=\"float:right;margin-right:7px;\">"+this["cntShare"]+"</span></p>";
				}
				groupIdx++;
			});
			if(data.length == 0){
				strArg += "<ul><li><br/><span>지역별 관객 점유율 주간 데이터가 없습니다.</span></li></ul>";
			}
			else{
				strArg += "</li>";
				strArg += "</ul>";
			}
			$("#area").append(strArg);
		}
	});

	//KOBIS 전광판(연동영화관)
	$.ajax({
		type : "POST",
		url  : "searchMainKobisJoinTheater.do",
		dataType : "json",
		beforeSend: function(xhr){
			$("#cinema").prepend("<div id=\"cinema_ingimg\" style=\"width:265px;height:135px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
		},
		success : function(data){
			var strArg="";
			$("#cinema_ingimg","#cinema").remove();
			$("#cinema").remove("id!=cinema");
			$.each(data, function(){
				strArg += "<div class=\"titbox\"><span>"+this["curDate"]+"년 "+this["monDate"]+"."+this["dayDate"]+" 현재</span></div>";
				strArg += "<div class=\"cscreen\">";
				strArg += "<div>영화관입장권통합전산망은<br /> 전국영화관의 발권데이터를 실시간 집계처리하여<br /> 각종 통계정보를 제공하고 있으며,<br /></div>";
				strArg += "<br />";
				strArg += "<span>현재 <em><strong>"+commify(this["theaCnt"])+"</strong></em>&nbsp;개 영화관,&nbsp;&nbsp; <strong style=\"color:#e40203;\">"+commify(this["joinCnt"])+"</strong></em2>&nbsp;개 스크린 연동중에 있음</span>";
				strArg += "</div>";
				strArg += "<p>전국기준으로 휴관 및 폐관 중인 영화상영관 제외</p>";
				$("#cinema").append(strArg);
			});
		}
	});

	//다양성 영화(다양성) 탭
	$.ajax({
		type : "POST",
		url  : "searchMainDiverMovie.do",
		dataType : "json",
		beforeSend: function(xhr){
			$("#diverMovie").prepend("<div id=\"diverMovie_ingimg\" style=\"width:657px;height:250px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
		},
		success : function(data){
			var strArg="";
			var movieCd="";
			var curPage="";
			var totalPage="";
			var totalMovie="";
			$("#diverMovie_ingimg","#diverMovie").remove();
			$("#diverMovie").remove("id!=diverMovie");
			$.each(data, function(){
				var synop = this["synop"].replace(new RegExp("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "g"), "");
				strArg += "<ul class=\"maindiversity\">";
				strArg += "<li class=\"maindiversity1\"><a href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"');return false;\"><img src=\""+imgUrl+this["fileSaveLoct"]+thumbName+this["sysFileNm"]+"\" onerror=\"fn_OpenmovieList(this);\" alt=\"영화 포스터\" /></a></li>";
				strArg += "<li>";
				strArg += "<div class=\"maind1\" title=\""+this["movieNm"]+"\"><a href=\"#none\" class=\"maind_over\" onclick=\"mstView('movie','"+this["movieCd"]+"')\"><span class=\"maind1\">"+string_cut(this["movieNm"],10)+"</span></a></div>";
				strArg += "<div class=\"maind2\"><ul>";
				strArg += "<li>장르 : "+this["repGenreNm"]+"</li>";
				strArg += "<li>개봉일 : "+this["openDt"]+"</li>";
				strArg += "<li>제작국가 : "+this["repNationNm"]+"</li>";
				strArg += "<li>감독명 : "+this["directorNm"]+"</li>";
				if (this["theaCnt"] == null) {
					strArg += "<li>상영영화상영관 : -</li></ul>";
				} else {
					strArg += "<li>상영영화상영관 : "+commify(this["theaCnt"])+"개 / "+commify(this["scrnCnt"])+"개 스크린</li></ul>";
				}
				strArg += "</div>";
				strArg += "</li>";
				strArg += "</ul>";
				strArg += "<div class=\"maindiversity2\">";
				strArg += string_cut(synop,195)
				strArg += "</div>";
				movieCd = this["movieCd"];
				curPage = this["curPage"];
				totalPage = this["totalPage"];
			});

			totalMovie = data.length;

			if(data.length == 0){
				strArg += "<ul class=\"maindiversity\">";
				strArg += "<li><div class=\"maindiversity3\">현재 상영중인 다양성 영화가 없습니다.</div></li>";
				strArg += "</ul>";
			}

			$("#diverMovie").append(strArg);

			//다양성영화 상영영화상영관
			$.ajax({
				type : "POST",
				url  : "searchMainDiverMovieTheater.do?movieCd="+movieCd,
				dataType : "json",
				beforeSend: function(xhr){
					$("#mainDiverMovieTheater").prepend("<div id=\"diverMovieTheater_ingimg\" style=\"width:265px;height:135px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
					$("thead","#mainDiverMovieTheater").hide();
				},
				success : function(data){
					var strArg="<tr><td colspan=\"3\" class=\"mainlist2_dot\"></td></tr>";
					var strArgPage="";
					var totalCount="";
					var evenIdx=true;
					$("#diverMovieTheater_ingimg","#mainDiverMovieTheater").remove();
					$("thead","#mainDiverMovieTheater").show();
					$("#diverMovieTheater").remove("id!=diverMovieTheater");
					$.each(data,  function(i){

						if(evenIdx){
							evenIdx = false;
							strArg += "<tr class=\"mainlist2_bg1\">";
						}
						else{
							evenIdx = true;
							strArg += "<tr class=\"mainlist2_bg2\">";
						}
						strArg += "<td class=\"mainlist2_1\"><a href=\"/kobis/business/mast/thea/findTheaterSchedule.do?theaCd="+this["theaCd"]+"&wideareaCd="+this["wideareaCd"]+"&basareaCd="+this["basareaCd"]+"\" class=\"mainlist2_over\"><span title=\""+this["theaNm"]+"\">"+string_cut(this["theaNm"],10)+"</span></a></td>";
						//strArg += "<td class=\"mainlist2_1\"><a href=\"#none\" class=\"mainlist2_over\" onclick=\"javascript:fn_detail(event, $(this), '"+this["theaCd"]+"');return false;\"><span title=\""+this["theaNm"]+"\">"+string_cut(this["theaNm"],12)+"</span></a></td>";
						strArg += "<td class=\"mainlist2_2\"><span title=\""+this["theaStat"]+"\">"+this["theaStat"]+"</span></td>";
						//strArg += "<td class=\"mainlist2_2\"><span title=\""+this["movieCnt"]+"\">"+this["movieCnt"]+"</span></td>";
						strArg += "<td class=\"mainlist2_3\"><span title=\""+this["mngNm"]+"\">"+string_cut(this["mngNm"],12)+"</span></td>";
						strArg += "</tr>";
						strArg += "<tr><td colspan=\"3\" class=\"mainlist2_dot\"></td></tr>";
					});

					totalCount = data.length;

					if(totalCount == 0){
						strArg += "<tr><td colspan=\"3\" class=\"mainlist2_4\">다양성 영화 상영영화상영관이 없습니다.</td></tr>";
						strArg += "<tr><td colspan=\"3\" class=\"mainlist2_dot\"></td></tr>";
					}

					$("#diverMovieTheater").append(strArg);

					if(totalMovie != 0){
						strArgPage += "<ul>";
						strArgPage += "<li class=\"mainbtn1\">";
						strArgPage += "<a href=\"#\" onclick=\"goDiverMoviePage('" + curPage + "','" + totalPage + "','next');return false;\"><img src=\"/kobis/web/comm/images/main/btn_next.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_next_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_next.png'\" alt=\"다음 페이지\"></a>";
						strArgPage += "</li>";
						strArgPage += "<li class=\"mainbtn1\">";
						strArgPage += "<a href=\"#\" onclick=\"goDiverMoviePage('" + curPage + "','" + totalPage + "','prev');return false;\"><img src=\"/kobis/web/comm/images/main/btn_pre.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_pre_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_pre.png'\" alt=\"이전 페이지\"></a>";
						strArgPage += "</li>";
						strArgPage += "<li class=\"mainbtn2\"><span class=\"mainnumber1\">" + curPage + "</span> <span class=\"mainnumber2\">/</span> <span class=\"mainnumber3\">" + totalPage + "</span></li>";
						strArgPage += "</ul>";

						$("#diverMovieTheaterPage").append(strArgPage);
					}
				}
			});
		}
	});

	//다양성 영화(기획전/회고전/재상영) 탭
	$.ajax({
		type : "POST",
		url  : "searchMainPlanType.do",
		dataType : "json",
		beforeSend: function(xhr){
			$("#planType").prepend("<div id=\"planType_ingimg\" style=\"width:265px;height:135px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
		},
		success : function(data){
			var strArg="<tr><td colspan=\"4\" class=\"mainlist2_dot\"></td></tr>";
			var strArgPage="";
			var curPage="";
			var totalPage="";
			var evenIdx=true;
			$("#planType_ingimg","#planType").remove();
			$("#planType").remove("id!=planType");
			$.each(data, function(){

				if(evenIdx){
					evenIdx = false;
					strArg += "<tr class=\"mainlist2_bg1\">";
				}
				else{
					evenIdx = true;
					strArg += "<tr class=\"mainlist2_bg2\">";
				}

				strArg += "<td class=\"mainB_list1\"><a href=\"#none\" class=\"mainB_list_over\" onclick=\"mstView('movie','"+this["movieCd"]+"')\"><span title=\""+this["movieNm"]+"\">"+string_cut(this["movieNm"],30)+"</span></a></td>";
				strArg += "<td class=\"mainB_list2\">"+gfn_null(this["prdtYear"])+"</td>";
				strArg += "<td class=\"mainB_list3\">";
				if (this["showStartDt"] == null && this["showEndDt"] == null && this["scheduleStdt"] == null){
					strArg += "미상영";
				} else if (this["scheduleStdt"] == this["currentDt"]) {
					strArg += "상영중";
					strArg += "( <em>" + FDate(this["scheduleStdt"],'.')+"</em> ~ <em>" + FDate(this["scheduleEndt"],'.')+"</em> )";
				} else if (this["scheduleStdt"] != null) {
					strArg += "상영예정";
					strArg += "( <em>" + FDate(this["scheduleStdt"],'.')+"</em> ~ <em>" + FDate(this["scheduleEndt"],'.')+"</em> )";
				} else {
					strArg += "상영종료";
				}
				strArg += "</td>";
				strArg += "<td class=\"mainB_list4\">"+gfn_null(this["gubunNm"])+"</td>";
				strArg += "</tr>";
				strArg += "<tr><td colspan=\"4\" class=\"mainlist2_dot\"></td></tr>";
				curPage = this["curPage"];
				totalPage = this["totalPage"];
			});
			if(data.length == 0){
				strArg += "<tr><td colspan=\"4\" class=\"mainB_list5\">다양성 영화( 기획전 / 회고전 / 재상영 )이 없습니다.</td></tr>";
				strArg += "<tr><td colspan=\"4\" class=\"mainlist2_dot\"></td></tr>";
			}

			$("#planType").append(strArg);

			if(data.length != 0) {
				strArgPage += "<ul>";
				strArgPage += "<li class=\"mainbtn1\">";
				strArgPage += "<a href=\"#\" onclick=\"goMainPlanTypePage('" + curPage + "','" + totalPage + "','next');return false;\"><img src=\"/kobis/web/comm/images/main/btn_next.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_next_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_next.png'\" alt=\"다음 페이지\"></a>";
				strArgPage += "</li>";
				strArgPage += "<li class=\"mainbtn1\">";
				strArgPage += "<a href=\"#\" onclick=\"goMainPlanTypePage('" + curPage + "','" + totalPage + "','prev');return false;\"><img src=\"/kobis/web/comm/images/main/btn_pre.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_pre_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_pre.png'\" alt=\"이전 페이지\"></a>";
				strArgPage += "</li>";
				strArgPage += "<li class=\"mainbtn2\"><span class=\"mainnumber1\">" + curPage + "</span> <span class=\"mainnumber2\">/</span> <span class=\"mainnumber3\">" + totalPage + "</span></li>";
				strArgPage += "</ul>";
				$("#planTypePage").append(strArgPage);
			}
		}
	});

	//다양성 영화(자막/더빙) 탭
	$.ajax({
		type : "POST",
		url  : "searchMainCaption.do",
		dataType : "json",
		beforeSend: function(xhr){
			$("#subCaption").prepend("<div id=\"subCaption_ingimg\" style=\"width:265px;height:135px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
		},
		success : function(data){
			var strArg="<tr><td colspan=\"4\" class=\"mainlist4_dot\"></td></tr>";
			var strArgPage="";
			var curPage="";
			var totalPage="";
			var evenIdx=true;
			$("#subCaption_ingimg","#subCaption").remove();
			$("#subCaption").remove("id!=subCaption");
			$.each(data, function(){

				if(evenIdx){
					evenIdx = false;
					strArg += "<tr class=\"mainlist4_bg1\">";
				}
				else{
					evenIdx = true;
					strArg += "<tr class=\"mainlist4_bg2\">";
				}

				strArg += "<td class=\"mainC_list1\"><a href=\"#none\" class=\"mainC_list_over\" onclick=\"mstView('movie','"+this["movieCd"]+"')\"><span title=\""+this["movieNm"]+"\">"+string_cut(this["movieNm"],20)+"</span></a></td>";
				strArg += "<td class=\"mainC_list2\">"+gfn_null(this["prdtYear"])+"</td>";
				strArg += "<td class=\"mainC_list3\">";
				if (this["showStartDt"] == null && this["showEndDt"] == null && this["scheduleStdt"] == null){
					strArg += "미상영";
				} else if (this["scheduleStdt"] == this["currentDt"]) {
					strArg += "상영중";
					strArg += "( <em>" + FDate(this["scheduleStdt"],'.')+"</em> ~ <em>" + FDate(this["scheduleEndt"],'.')+"</em> )";
				} else if (this["scheduleStdt"] != null) {
					strArg += "상영예정";
					strArg += "( <em>" + FDate(this["scheduleStdt"],'.')+"</em> ~ <em>" + FDate(this["scheduleEndt"],'.')+"</em> )";
				} else {
					strArg += "상영종료";
				}
				strArg += "</td>";
				strArg += "<td class=\"mainC_list4\">"+string_cut(this["showTypeNm"],40)+"</td>";
				strArg += "</tr>";
				strArg += "<tr><td colspan=\"4\" class=\"mainlist4_dot\"></td></tr>";
				curPage = this["curPage"];
				totalPage = this["totalPage"];
			});
			if(data.length == 0){
				strArg += "<tr><td colspan=\"4\" class=\"mainC_list5\">다양성 영화( 자막 / 더빙 )가 없습니다.</td></tr>";
				strArg += "<tr><td colspan=\"4\" class=\"mainlist4_dot\"></td></tr>";
			}

			$("#subCaption").append(strArg);

			if(data.length != 0) {
				strArgPage += "<ul>";
				strArgPage += "<li class=\"mainbtn1\">";
				strArgPage += "<a href=\"#\" onclick=\"goSubCaptionPage('" + curPage + "','" + totalPage + "','next');return false;\"><img src=\"/kobis/web/comm/images/main/btn_next.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_next_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_next.png'\" alt=\"다음 페이지\"></a>";
				strArgPage += "</li>";
				strArgPage += "<li class=\"mainbtn1\">";
				strArgPage += "<a href=\"#\" onclick=\"goSubCaptionPage('" + curPage + "','" + totalPage + "','prev');return false;\"><img src=\"/kobis/web/comm/images/main/btn_pre.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_pre_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_pre.png'\" alt=\"이전 페이지\"></a>";
				strArgPage += "</li>";
				strArgPage += "<li class=\"mainbtn2\"><span class=\"mainnumber1\">" + curPage + "</span> <span class=\"mainnumber2\">/</span> <span class=\"mainnumber3\">" + totalPage + "</span></li>";
				strArgPage += "</ul>";
				$("#subCaptionPage").append(strArgPage);
			}
		}
	});

	//제작중 영화
	$.ajax({
		type : "POST",
		url  : "searchMainInProductionMovie.do",
		dataType : "json",
		beforeSend: function(xhr){
			$("#inProductionMovie").prepend("<div id=\"inProductionMovie_img\" style=\"width:265px;height:185px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
			$("thead","#inProductionMovie").hide();
		},
		success : function(data){
			var strArg="<tr><td colspan=\"3\" class=\"mainlist3_dot\"></td></tr>";
			var strArg2="";
			var strArgPage="";
			var strNameLst="";
			var evenIdx=true;
			var evenFlag=true;
			var nmCnt=0;
			var curPage="";
			var totalPage="";
			$("#inProductionMovie_img","#inProductionMovie").remove();
			$("thead","#inProductionMovie").show();
			$("#inProductionMovie").remove("id!=inProductionMovie");
			$.each(data, function(){
				strNameLst = "";
				strArg2 = "";
				nmCnt=0;
				var varNm = this["directorNm"];

				if(evenIdx){
					evenIdx = false;
					strArg += "<tr class=\"mainlist3_bg1\">";
				}
				else{
					evenIdx = true;
					strArg += "<tr class=\"mainlist3_bg2\">";
				}

				strArg += "<td class=\"mainlist3_1\"><a href=\"#none\" class=\"mainlist3_over\" onclick=\"mstView('movie','"+this["movieCd"]+"')\"><span title=\""+this["movieNm"]+"\">"+string_cut(this["movieNm"],15)+"</span></a></td>";
				strArg += "<td class=\"mainlist3_2\">";

				if(varNm != null){
					var nmArray = varNm.split("^");
					for(var i=0; i<nmArray.length; i+=2){
						if(nmCnt < 1)
							strArg2 += "<a href=\"#none\" class=\"mainlist3_over\" onclick=\"mstView('people','"+nmArray[i+1]+"')\">"+string_cut(nmArray[i],3)+"</a>";

						strNameLst += nmArray[i];
						if(nmArray.length > i+2)
							strNameLst += ",";
						nmCnt++;
					}
					strArg += "<span style=\"width:82px;\" title=\""+strNameLst+"\">";
					strArg += strArg2;
					if(nmCnt > 1)
						strArg += " (외"+(nmCnt-1)+"명)";
					strArg += "</span>";
				}
				strArg += "</td>";
				strArg += "<td class=\"mainlist3_3\">"+this["moviePrdtNm"]+"</td>";
				strArg += "</tr>";
				strArg += "<tr><td colspan=\"3\" class=\"mainlist3_dot\"></td></tr>";
				evenFlag = (evenFlag==true)?false:true;
				strArg2 = "";
				curPage = this["curPage"];
				totalPage = this["totalPage"];
			});

			if(data.length == 0) {
				strArg += "<tr><td colspan=\"3\" class=\"mainlist3_4\">제작중인 영화가 없습니다.</td></tr>";
				strArg += "<tr><td colspan=\"3\" class=\"mainlist3_dot\"></td></tr>";
			}

			$("#inProductionMovie").append(strArg);

			if(data.length != 0) {
				strArgPage += "<ul>";
				strArgPage += "<li class=\"mainbtn1\">";
				strArgPage += "<a href=\"#\" onclick=\"goInProductionMoviePage('" + curPage + "','" + totalPage + "','next');return false;\"><img src=\"/kobis/web/comm/images/main/btn_next.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_next_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_next.png'\" alt=\"다음 페이지\"></a>";
				strArgPage += "</li>";
				strArgPage += "<li class=\"mainbtn1\">";
				strArgPage += "<a href=\"#\" onclick=\"goInProductionMoviePage('" + curPage + "','" + totalPage + "','prev');return false;\"><img src=\"/kobis/web/comm/images/main/btn_pre.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_pre_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_pre.png'\" alt=\"이전 페이지\"></a>";
				strArgPage += "</li>";
				strArgPage += "<li class=\"mainbtn2\"><span class=\"mainnumber1\">" + curPage + "</span> <span class=\"mainnumber2\">/</span> <span class=\"mainnumber3\">" + totalPage + "</span></li>";
				strArgPage += "</ul>";
				$("#inProductionMoviePage").append(strArgPage);
			}
		}
	});

	//공지사항
	$.ajax({
		type : "POST",
		url  : "searchMainBoard.do",
		dataType : "json",
		beforeSend: function(xhr){
			$("#noticeBoardBox").prepend("<div id=\"noticeBoard_img\" style=\"width:313px; height:94px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
			$("thead","#noticeBoard").hide();
		},
		success : function(data){
			var strArg="";
			$("#noticeBoard_img","#noticeBoardBox").remove();
			$("thead","#noticeBoard").show();
			$("#noticeBoard").remove("id!=noticeBoard");
			$.each(data, function(){
				strArg += "<li class=\"mainnotice\" title=\""+this["boardTitle"]+"\">";

				strArg += "<div><ul><li class=\"mainleft\"><span class=\"mainbull\">&bull;</span><a class=\"mainnotice1\" href=\"/kobis/business/comm/ntfy/findCustomerNotify.do?seqNo="+this["seqNo"]+"&pageIndex=1\">"+string_cut(this["boardTitle"],20)+"</a></li>";

				strArg += "<li><span class=\"mainnotice_day\">";

				if(this["newIcon"] != null){
					strArg += "<img src=\"/kobis/web/comm/images/main/n.png\" align=\"absmiddle\">";
				}

				strArg += "&nbsp;["+this["updDttm"]+"]</span></li></ul></div></li>";
			});
			if(data.length == 0)
				strArg += "<li class=\"mainnotice1\"></br></br>등록된 공지가 없습니다.</br></br></br></li>";
			$("#noticeBoard").append(strArg);
		}
	});

	//KOBIS 전광판(국적별)
	$.ajax({
		type : "POST",
		url  : "searchMainKobisNation.do",
		dataType : "json",
		beforeSend: function(xhr){
			$("#nationalityBox").prepend("<div id=\"nationality_ingimg\" style=\"width:385px; height:94px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
			$("thead","#nationality").hide();
		},
		success : function(data){
			var strArg="";
			var isFirstGroup=true;
			var groupIdx=0;
			$("#nationality_ingimg","#nationalityBox").remove();
			$("#nationality").remove("id!=nationality");
			$.each(data, function(){

				if(isFirstGroup){
					strArg += "<div class=\"mainnational1\"><ul>";
					strArg += "<li class=\"mainnational_t1\">";
					strArg += "<img src=\"/kobis/web/comm/images/main/national1.gif\">";
					strArg += "</li>";
					$.each(this, function(){
						if(groupIdx==0){
							strArg += "<li class=\"mainnational_t2\">"+this["startDate"]+" ~ "+this["endDate"]+"</li></ul></div>";
							strArg += "<div class=\"mainnational2\"><ul>";
						}
						if(this["repGb"] == "KOR"){
							strArg += "<li class=\"mainnational\">한국 "+this["cntShare"]+"</li>";
							strArg += "<li class=\"mainnational_box1\"></li>";
							strArg += "<li class=\"mainnational_boxbg1\" style=\"width:"+this["cntSize"]+"px;\"></li>";
						}
						else if(this["repGb"] == "FOR"){
							strArg += "<li class=\"mainnational_box\"></li>";
							strArg += "<li class=\"mainnational_boxbg2\" style=\"width:"+this["cntSize"]+"px;\"></li>";
							strArg += "<li class=\"mainnational_box2\"></li>";
							strArg += "<li class=\"mainnational\">외국"+this["cntShare"]+"</li>";
						}
						groupIdx++;
					});
					strArg += "</ul></div>";
					isFirstGroup = false;
					groupIdx=0;
				}
				else{
					strArg += "<div class=\"mainranking1\"><ul>";
					strArg += "<li class=\"mainranking2\">";
					strArg += "<div class=\"mainranking3\"><ul>";
					$.each(this, function(){
						strArg += "<li class=\"mainranking4\" title=\""+this["repNationNm"]+"\">" + this["rank"]+". "+string_cut(this["repNationNm"],3)+" "+this["cntShare"]+"</li>";
					});
					strArg += "</ul></div></li></ul></div>";
				}
			});

			$("#nationality").append(strArg);
		}
	});

	rollMain("Y");
	
//일일 박스오피스
$.ajax({
	type : "POST",
	url  : "searchMainDailyBoxOffice.do",
	dataType : "json",
	beforeSend: function(xhr){
		$("#dailyBoxOffice").prepend("<div id=\"dailyBoxOffice_ingimg\" style=\"width:300px;height:240px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
	},
	success : function(data){ 
		var date="";
		var strArg="";
		var strArg2="";
		$("#dailyBoxOffice_ingimg","#dailyBoxOffice").remove();
		$("#dailyBoxOffice").remove("table");
		$("#dailyBoxOfficeDate").remove("table");
		$.each(data, function(){

			if(Number(this["rank"]) == 1){
				date = this["startDate"];
				strArg2 = "<table><tr><td>" + date + "</td></tr></table>";

				$("[name=posterLinkPart1]").attr("onclick","mstView('movie','"+this["movieCd"]+"')");
				$("#mainPosterPart1").attr("src","/kobis/web/comm/images/main/poster_A01.png");

				if (this["fileSaveLoct"] != "") {
				$("#mainPosterImg1").attr("src",imgUrl+this["fileSaveLoct"]+thumbMainName+this["sysFileNm"]);
				posterNm[1] = this["movieNm"];
				fnMovieNm('1',this["movieNm"]);
				}
			}

			$("#imgPoster"+this["rownum"]).attr("src",imgUrl+this["fileSaveLoct"]+thumbMainName+this["sysFileNm"]);

			//마우스오버
		      strArg +="<div class=\"maindata\" id=\"maindata" + this["rownum"] +  "\">";
		      strArg +="<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
		      strArg +="<tr onmouseover=\"MM_showHideLayers('poster" +  this["rownum"] + "','','mainshow','maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('1','"+this["movieNm"]+"');\" onmouseout=\"MM_showHideLayers('poster" +  this["rownum"] + "','','mainhide','maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('1');\">";
		      strArg +="<td class=\"maindata1\"><img src=\"/kobis/web/comm/images/main/nember_A" +  leadingZeros(this["rownum"],2) + "_on.png\" alt=\""+this["rank"]+"위 \"></td>";
		      strArg +="<td class=\"maindata2\"><a style=\"color:#bdea0a;\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";

		      if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],10);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],12);
		      } else {
			      strArg +=string_cut(this["movieNm"],10);
		      }

		      strArg += "</a></td>";

		      strArg +="<td class=\"maindata3\">" + commify(this["salesAmt"]) + "원</td><td class=\"maindata4\">"+commify(this["audiCnt"])+"명</td>";
		      strArg +="<td><div><ul><li class=\"maindata5\">";

		    		if(this["rankOldAndNew"] == "NEW"){//신규진입
						strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\"></li>";
					}
					else if( Number(this["rankInten"]) > 0 ){//순위 상승
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"maindata6\">"+Number(this["rankInten"])+"</li>";
					}
					else if ( Number(this["rankInten"]) < 0 ){//순위 하락
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"maindata6\">"+Number(this["rankInten"])*-1+"</li>";
					}
					else{//순위 유지
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"maindata6\">"+Number(this["rankInten"])+"</li>";
					}

		      strArg +="</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('poster" +  this["rownum"] + "','','mainshow','maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('1','"+this["movieNm"]+"');\" onmouseout=\"MM_showHideLayers('poster" +  this["rownum"] + "','','mainhide','maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('1');\">";
		      strArg +="<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%\" height=\"2\"></td></tr></table></div>";


			//기본
			strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
			strArg += "<tr onmouseover=\"MM_showHideLayers('poster" +  this["rownum"] + "','','mainshow','maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('poster" +  this["rownum"] + "','','mainhide','maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('1');\">";
			strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_A" +  leadingZeros(this["rownum"],2) + ".png\" alt=\""+this["rank"]+"위 \"></td>";
			strArg += "<td class=\"mainmovie5\"><a style=\"color:#ffffff;\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";


			 if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],10);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],12);
		      } else {
			      strArg +=string_cut(this["movieNm"],10);
		      }

			strArg += "</a></td>";

			strArg += "<td class=\"mainmovie6\">" + commify(this["salesAmt"]) + "원</td><td class=\"mainmovie7\">"+commify(this["audiCnt"])+"명</td>";
			strArg += "<td><div><ul><li class=\"mainmovie8\">";


				if(this["rankOldAndNew"] == "NEW"){//신규진입
					strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
				}
				else if( Number(this["rankInten"]) > 0 ){//순위 상승
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				}
				else if ( Number(this["rankInten"]) < 0 ){//순위 하락
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])*-1+"</li>";
				}
				else{//순위 유지
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				}

			strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('poster" +  this["rownum"] + "','','mainshow','maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('poster" +  this["rownum"] + "','','mainhide','maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('1');\">";
			strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%\" height=\"2\"></td></tr></table>";
		});
			$("#dailyBoxOffice").append(strArg);
			$("#dailyBoxOfficeDate").append(strArg2);
	}
});


//주말 박스오피스
$.ajax({
	type : "POST",
	url  : "searchMainWeekEndBoxOffice.do",
	dataType : "json",
	beforeSend: function(xhr){
		$("#weekEndBoxOffice").prepend("<div id=\"weekEndBoxOffice_ingimg\" style=\"width:300px;height:240px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
	},
	success : function(data){
		var sDate="";
		var eDate="";
		var strArg="";
		var strArg2="";
		$("#weekEndBoxOffice_ingimg","#weekEndBoxOffice").remove();
		$("#weekEndBoxOffice").remove("table");
		$("#weekEndBoxOfficeDate").remove("table");
		$.each(data, function(){

			//1위는 ul Class on한다.
			if(Number(this["rank"]) == 1){
				sDate = this["startDate"];
				eDate = this["endDate"];
				if(sDate != "" && eDate != "")
				strArg2 = "<table><tr><td>" + sDate + " ~ " + eDate+ "</td></tr></table>";
			}

			$("#2imgPoster"+this["rownum"]).attr("src",imgUrl+this["fileSaveLoct"]+thumbMainName+this["sysFileNm"]);

			//마우스오버
		      strArg +="<div class=\"B_data\" id=\"2maindata" + this["rownum"] +  "\">";
		      strArg +="<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
		      strArg +="<tr onmouseover=\"MM_showHideLayers('2poster" +  this["rownum"] + "','','mainshow','2maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('1','"+this["movieNm"]+"')\" onmouseout=\"MM_showHideLayers('2poster" +  this["rownum"] + "','','mainhide','2maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('1');\">";
		      strArg +="<td class=\"B_data1\"><img src=\"/kobis/web/comm/images/main/nember_B" +  leadingZeros(this["rownum"],2) + "_on.png\" alt=\""+this["rank"]+"위 \"></td>";
		      strArg +="<td class=\"B_data2\"><a style=\"color:#03d8b8;\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";

		      if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],10);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],12);
		      } else {
			      strArg +=string_cut(this["movieNm"],10);
		      }


    			strArg += "</a></td>";


		      strArg +="<td class=\"B_data3\">" + commify(this["salesAmt"]) + "원</td><td class=\"B_data4\">"+commify(this["audiCnt"])+"명</td>";
		      strArg +="<td><div><ul><li class=\"B_data5\">";

		    		if(this["rankOldAndNew"] == "NEW"){//신규진입
						strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
					}
					else if( Number(this["rankInten"]) > 0 ){//순위 상승
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"B_data6\">"+Number(this["rankInten"])+"</li>";
					}
					else if ( Number(this["rankInten"]) < 0 ){//순위 하락
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"B_data6\">"+Number(this["rankInten"])*-1+"</li>";
					}
					else{//순위 유지
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"B_data6\">"+Number(this["rankInten"])+"</li>";
					}

		      strArg +="</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('2poster" +  this["rownum"] + "','','mainshow','2maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('1','"+this["movieNm"]+"')\" onmouseout=\"MM_showHideLayers('2poster" +  this["rownum"] + "','','mainhide','2maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('1');\">";
		      strArg +="<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%\" height=\"2\"></td></tr></table></div>";


			//기본
			strArg += "<table class=\"mainover2\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
			strArg += "<tr onmouseover=\"MM_showHideLayers('2poster" +  this["rownum"] + "','','mainshow','2maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('2poster" +  this["rownum"] + "','','mainhide','2maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('1');\">";
			strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_B" +  leadingZeros(this["rownum"],2) + ".png\" alt=\""+this["rank"]+"위 \"></td>";
			strArg += "<td class=\"mainmovie5\"><a style=\"color:#ffffff;\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";


			 if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],10);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],12);
		      } else {
			      strArg +=string_cut(this["movieNm"],10);
		      }


			strArg += "</a></td>";

			strArg += "<td class=\"mainmovie6\">" + commify(this["salesAmt"]) + "원</td><td class=\"mainmovie7\">"+commify(this["audiCnt"])+"명</td>";
			strArg += "<td><div><ul><li class=\"mainmovie8\">";


				if(this["rankOldAndNew"] == "NEW"){//신규진입
					strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\"  class=\"mainarrow1\">";
				}
				else if( Number(this["rankInten"]) > 0 ){//순위 상승
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				}
				else if ( Number(this["rankInten"]) < 0 ){//순위 하락
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])*-1+"</li>";
				}
				else{//순위 유지
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				}

			strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('2poster" +  this["rownum"] + "','','mainshow','2maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('2poster" +  this["rownum"] + "','','mainhide','2maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('1');\">";
			strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%\" height=\"2\"></td></tr></table>";
		});
			$("#weekEndBoxOffice").append(strArg);
			$("#weekEndBoxOfficeDate").append(strArg2);
	}
});


//다양성 일일 박스오피스
$.ajax({
	type : "POST",
	url  : "searchMainDiverMov.do",
	dataType : "json",
	beforeSend: function(xhr){
		$("#diverMovOffice").prepend("<div id=\"diverMovOffice_ingimg\" style=\"width:300px;height:240px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
	},
	success : function(data){
		var date="";
		var strArg="";
		var strArg2="";
		$("#diverMovOffice_ingimg","#diverMovOffice").remove();
		$("#diverMovOffice").remove("table");
		$("#diverMovOfficeDate").remove("table");
		$.each(data, function(){

			if(Number(this["rank"]) == 1){
				date = this["startDate"];
				strArg2 = "<table><tr><td>" + date + "</td></tr></table>"

				$("[name=posterLinkPart2]").attr("onclick","mstView('movie','"+this["movieCd"]+"')");
				$("#mainPosterPart2").attr("src","/kobis/web/comm/images/main/poster_C01.png");
				if (this["fileSaveLoct"] != "") {
				$("#mainPosterImg2").attr("src",imgUrl+this["fileSaveLoct"]+thumbMainName+this["sysFileNm"]);
				posterNm[2] = this["movieNm"];
				fnMovieNm('2',this["movieNm"]);
				}
			}

			$("#3imgPoster"+this["rownum"]).attr("src",imgUrl+this["fileSaveLoct"]+thumbMainName+this["sysFileNm"]);

			//마우스오버
		      strArg +="<div class=\"C_data\" id=\"3maindata" + this["rownum"] +  "\">";
		      strArg +="<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
		      strArg +="<tr onmouseover=\"MM_showHideLayers('3poster" +  this["rownum"] + "','','mainshow','3maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('2','"+this["movieNm"]+"');\" onmouseout=\"MM_showHideLayers('3poster" +  this["rownum"] + "','','mainhide','3maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('2');\">";
		      strArg +="<td class=\"C_data1\"><img src=\"/kobis/web/comm/images/main/nember_C" +  leadingZeros(this["rownum"],2) + "_on.png\" alt=\""+this["rank"]+"위 \"></td>";
		      strArg +="<td class=\"C_data2\"><a style=\"color:#ce88ff;\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";

		      if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],10);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],12);
		      } else {
			      strArg +=string_cut(this["movieNm"],10);
		      }


		      strArg += "</a></td>";

		      strArg +="<td class=\"C_data3\">" + commify(this["salesAmt"]) + "원</td><td class=\"C_data4\">"+commify(this["audiCnt"])+"명</td>";
		      strArg +="<td><div><ul><li class=\"C_data5\">";

		    		if(this["rankOldAndNew"] == "NEW"){//신규진입
						strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
					}
					else if( Number(this["rankInten"]) > 0 ){//순위 상승
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"C_data6\">"+Number(this["rankInten"])+"</li>";
					}
					else if ( Number(this["rankInten"]) < 0 ){//순위 하락
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"C_data6\">"+Number(this["rankInten"])*-1+"</li>";
					}
					else{//순위 유지
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"C_data6\">"+Number(this["rankInten"])+"</li>";
					}

		      strArg +="</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('3poster" +  this["rownum"] + "','','mainshow','3maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('2','"+this["movieNm"]+"');\" onmouseout=\"MM_showHideLayers('3poster" +  this["rownum"] + "','','mainhide','3maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('2');\">";
		      strArg +="<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%\" height=\"2\"></td></tr></table></div>";


			//기본
			strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
			strArg += "<tr onmouseover=\"MM_showHideLayers('3poster" +  this["rownum"] + "','','mainshow','3maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('3poster" +  this["rownum"] + "','','mainhide','3maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('2');\">";
			strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_C" +  leadingZeros(this["rownum"],2) + ".png\" alt=\""+this["rank"]+"위 \"></td>";
			strArg += "<td class=\"mainmovie5\"><a style=\"color:#ffffff;\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";

			 if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],10);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],12);
		      } else {
			      strArg +=string_cut(this["movieNm"],10);
		      }


	       strArg += "</a></td>";

			strArg += "<td class=\"mainmovie6\">" + commify(this["salesAmt"]) + "원</td><td class=\"mainmovie7\">"+commify(this["audiCnt"])+"명</td>";
			strArg += "<td><div><ul><li class=\"mainmovie8\">";


				if(this["rankOldAndNew"] == "NEW"){//신규진입
					strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
				}
				else if( Number(this["rankInten"]) > 0 ){//순위 상승
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				}
				else if ( Number(this["rankInten"]) < 0 ){//순위 하락
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])*-1+"</li>";
				}
				else{//순위 유지
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				}

			strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('3poster" +  this["rownum"] + "','','mainshow','3maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('3poster" +  this["rownum"] + "','','mainhide','3maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('2');\">";
			strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%\" height=\"2\"></td></tr></table>";

		});

			$("#diverMovOffice").append(strArg);
			$("#diverMovOfficeDate").append(strArg2);
	}

});


//다양성 주말 박스오피스
$.ajax({
	type : "POST",
	url  : "searchMainWeekEndDiverMov.do",
	dataType : "json",
	beforeSend: function(xhr){
		$("#weekEndDiverMovOffice").prepend("<div id=\"weekEndDiverMovOffice_ingimg\" style=\"width:300px;height:240px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
	},
	success : function(data){
		var sDate="";
		var eDate="";
		var strArg="";
		var strArg2="";
		$("#weekEndDiverMovOffice_ingimg","#weekEndDiverMovOffice").remove();
		$("#weekEndDiverMovOffice").remove("table");
		$("#weekEndDiverMovOfficeDate").remove("table");
		$.each(data, function(){

			//1위는 ul Class on한다.
			if(Number(this["rank"]) == 1){
				sDate = this["startDate"];
				eDate = this["endDate"];
				if(sDate != "" && eDate != "")
				strArg2 = "<table><tr><td>" + sDate + " ~ " + eDate+ "</td></tr></table>";
			}

			$("#4imgPoster"+this["rownum"]).attr("src",imgUrl+this["fileSaveLoct"]+thumbMainName+this["sysFileNm"]);

			//마우스오버
		      strArg +="<div class=\"D_data\" id=\"4maindata" + this["rownum"] +  "\">";
		      strArg +="<table class=\"mainover2\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
		      strArg +="<tr onmouseover=\"MM_showHideLayers('4poster" +  this["rownum"] + "','','mainshow','4maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('2','"+this["movieNm"]+"')\" onmouseout=\"MM_showHideLayers('4poster" +  this["rownum"] + "','','mainhide','4maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('2');\">";
		      strArg +="<td class=\"D_data1\"><img src=\"/kobis/web/comm/images/main/nember_D" +  leadingZeros(this["rownum"],2) + "_on.png\" alt=\""+this["rank"]+"위 \"></td>";
		      strArg +="<td class=\"D_data2\"><a style=\"color:#f472f1;\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";

		      if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],10);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],12);
		      } else {
			      strArg +=string_cut(this["movieNm"],10);
		      }


	          strArg += "</a></td>";

	          strArg +="<td class=\"D_data3\">" + commify(this["salesAmt"]) + "원</td><td class=\"D_data4\">"+commify(this["audiCnt"])+"명</td>";
		      strArg +="<td><div><ul><li class=\"D_data5\">";

		    		if(this["rankOldAndNew"] == "NEW"){//신규진입
						strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
					}
					else if( Number(this["rankInten"]) > 0 ){//순위 상승
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"D_data6\">"+Number(this["rankInten"])+"</li>";
					}
					else if ( Number(this["rankInten"]) < 0 ){//순위 하락
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"D_data6\">"+Number(this["rankInten"])*-1+"</li>";
					}
					else{//순위 유지
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"D_data6\">"+Number(this["rankInten"])+"</li>";
					}

		      strArg +="</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('4poster" +  this["rownum"] + "','','mainshow','4maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('2','"+this["movieNm"]+"')\" onmouseout=\"MM_showHideLayers('4poster" +  this["rownum"] + "','','mainhide','4maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('2');\">";
		      strArg +="<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";


			//기본
			strArg += "<table class=\"mainover2\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
			strArg += "<tr onmouseover=\"MM_showHideLayers('4poster" +  this["rownum"] + "','','mainshow','4maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('4poster" +  this["rownum"] + "','','mainhide','4maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('2');\">";
			strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_D" +  leadingZeros(this["rownum"],2) + ".png\" alt=\""+this["rank"]+"위 \"></td>";
			strArg += "<td class=\"mainmovie5\"><a style=\"color:#ffffff;\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";

			 if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],10);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],12);
		      } else {
			      strArg +=string_cut(this["movieNm"],10);
		      }

	        strArg += "</a></td>";

			strArg += "<td class=\"mainmovie6\">" + commify(this["salesAmt"]) + "원</td><td class=\"mainmovie7\">"+commify(this["audiCnt"])+"명</td>";
			strArg += "<td><div><ul><li class=\"mainmovie8\">";


				if(this["rankOldAndNew"] == "NEW"){//신규진입
					strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
				}
				else if( Number(this["rankInten"]) > 0 ){//순위 상승
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				}
				else if ( Number(this["rankInten"]) < 0 ){//순위 하락
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])*-1+"</li>";
				}
				else{//순위 유지
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				}

			strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('4poster" +  this["rownum"] + "','','mainshow','4maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('4poster" +  this["rownum"] + "','','mainhide','4maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('2');\">";
			strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";

		});

		$("#weekEndDiverMovOffice").append(strArg);
		$("#weekEndDiverMovOfficeDate").append(strArg2);
	}
});


//실시간 예매율
$.ajax({
	type : "POST",
	url  : "searchMainRealTicket.do",
	dataType : "json",
	beforeSend: function(xhr){
		$("#realTicketOffice").prepend("<div id=\"realTicketOffice_ingimg\" style=\"width:300px;height:240px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
	},
	success : function(data){
		var date="";
		var strArg="";
		var strArg2="";
		$("#realTicketOffice_ingimg","#realTicketOffice").remove();
		$("#realTicketOffice").remove("table");
		$("#realTicketOfficeDate").remove("table");
		$.each(data, function(){
			if(Number(this["rank"]) == 1){
				date = this["startDate"];
				strArg2 = "<table><tr><td>" + date + "</td></tr></table>";
				$("[name=posterLinkPart3]").attr("onclick","mstView('movie','"+this["movieCd"]+"')");
				$("#mainPosterPart3").attr("src","/kobis/web/comm/images/main/poster_E01.png");
				if (this["fileSaveLoct"] != "") {
				$("#mainPosterImg3").attr("src",imgUrl+this["fileSaveLoct"]+thumbMainName+this["sysFileNm"]);
				posterNm[3] = this["movieNm"];
				fnMovieNm('3',this["movieNm"]);
				}
			}

			$("#5imgPoster"+this["rownum"]).attr("src",imgUrl+this["fileSaveLoct"]+thumbMainName+this["sysFileNm"]);

			//마우스오버
		      strArg +="<div class=\"E_data\" id=\"5maindata" + this["rownum"] +  "\">";
		      strArg +="<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:310px;\">";
		      strArg +="<tr onmouseover=\"MM_showHideLayers('5poster" +  this["rownum"] + "','','mainshow','5maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('3','"+this["movieNm"]+"');\" onmouseout=\"MM_showHideLayers('5poster" +  this["rownum"] + "','','mainhide','5maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('3');\">";
		      strArg +="<td class=\"E_data1\"><img src=\"/kobis/web/comm/images/main/nember_E" +  leadingZeros(this["rownum"],2) + "_on.png\" alt=\""+this["rank"]+"위 \"></td>";
		      strArg +="<td class=\"E_data2\"><a style=\"color:#fce000;\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";

		      if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],10);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],12);
		      } else {
			      strArg +=string_cut(this["movieNm"],10);
		      }

	           strArg += "</a></td>";

		      strArg +="<td class=\"E_data3\">" + commify(this["totIssuAmt"]) + "원</td><td class=\"E_data4\">"+commify(this["totIssuCnt"])+"명</td>";
		      strArg +="<td><div><ul><li class=\"E_data5\"></li><li class=\"E_data6\"></li>";
		      strArg +="</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('5poster" +  this["rownum"] + "','','mainshow','5maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('3','"+this["movieNm"]+"');\" onmouseout=\"MM_showHideLayers('5poster" +  this["rownum"] + "','','mainhide','5maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('3');\">";
		      strArg +="<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";

			//기본
			strArg += "<table cellspacing=\"0\" cellpadding=\"0\" style=\"width:310px;\">";
			strArg += "<tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('5poster" +  this["rownum"] + "','','mainshow','5maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('5poster" +  this["rownum"] + "','','mainhide','5maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('3');\">";
			strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_E" +  leadingZeros(this["rownum"],2) + ".png\" alt=\""+this["rank"]+"위 \"></td>";
			strArg += "<td class=\"mainmovie5\"><a style=\"color:#ffffff;\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";

			 if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],10);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],12);
		      } else {
			      strArg +=string_cut(this["movieNm"],10);
		      }

	        strArg += "</a></td>";

			strArg += "<td class=\"mainmovie6\">" + commify(this["totIssuAmt"]) + "원</td><td class=\"mainmovie7\">"+commify(this["totIssuCnt"])+"명</td>";
			strArg += "<td><div><ul><li class=\"mainmovie8\"></li><li class=\"mainmovie9\"></li>";


			strArg += "</ul></div></td></tr><tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('5poster" +  this["rownum"] + "','','mainshow','5maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('5poster" +  this["rownum"] + "','','mainhide','5maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('3');\">";
			strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";

		});

			$("#realTicketOffice").append(strArg);
			$("#realTicketOfficeDate").append(strArg2);
	}

});


//좌석점유율순위
$.ajax({
	type : "POST",
	url  : "searchMainDailySeatTicket.do",
	dataType : "json",
	beforeSend: function(xhr){
		$("#dailySeatTicketOffice").prepend("<div id=\"dailySeatTicketOffice_ingimg\" style=\"width:300px;height:240px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
	},
	success : function(data){
		var sDate="";
		var eDate="";
		var strArg="";
		var strArg2="";
		$("#dailySeatTicketOffice_ingimg","#dailySeatTicketOffice").remove();
		$("#dailySeatTicketOffice").remove("table");
		$("#dailySeatTicketOfficeDate").remove("table");
		$.each(data, function(){

			//1위는 ul Class on한다.
			if(Number(this["rank"]) == 1){
				sDate = this["startDate"];
				eDate = this["endDate"];
				if(sDate != "" && eDate != "")
				strArg2 = "<table><tr><td>" + sDate + " ~ " + eDate+ "</td></tr></table>";
			}

			$("#6imgPoster"+this["rownum"]).attr("src",imgUrl+this["fileSaveLoct"]+thumbMainName+this["sysFileNm"]);

			//마우스오버
		      strArg +="<div class=\"D_data\" id=\"6maindata" + this["rownum"] +  "\">";
		      strArg +="<table class=\"mainover2\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
		      strArg +="<tr onmouseover=\"MM_showHideLayers('6poster" +  this["rownum"] + "','','mainshow','6maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('3','"+this["movieNm"]+"')\" onmouseout=\"MM_showHideLayers('6poster" +  this["rownum"] + "','','mainhide','6maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('3');\">";
		      strArg +="<td class=\"F_data1\"><img src=\"/kobis/web/comm/images/main/nember_F" +  leadingZeros(this["rownum"],2) + "_on.png\" alt=\""+this["rank"]+"위 \"></td>";
		      strArg +="<td class=\"F_data2\"><a style=\"color:#ffae00;\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";

		      if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],10);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],12);
		      } else {
			      strArg +=string_cut(this["movieNm"],10);
		      }

     	      strArg += "</a></td>";

		      strArg +="<td class=\"F_data3\">" + commify(this["totSeatCnt"]) + "석</td><td class=\"F_data4\">("+commify(this["totSeatCntRatio"])+" )</td>";
		      strArg +="<td><div><ul><li class=\"D_data5\">";

		    		if(this["rankOldAndNew"] == "NEW"){//신규진입
						strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
					}
					else if( Number(this["rankInten"]) > 0 ){//순위 상승
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"F_data6\">"+Number(this["rankInten"])+"</li>";
					}
					else if ( Number(this["rankInten"]) < 0 ){//순위 하락
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"F_data6\">"+Number(this["rankInten"])*-1+"</li>";
					}
					else{//순위 유지
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"F_data6\">"+Number(this["rankInten"])+"</li>";
					}

		      strArg +="</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('6poster" +  this["rownum"] + "','','mainshow','6maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('3','"+this["movieNm"]+"')\" onmouseout=\"MM_showHideLayers('6poster" +  this["rownum"] + "','','mainhide','6maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('3');\">";
		      strArg +="<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%\" height=\"2\"></td></tr></table></div>";


			//기본
			strArg += "<table class=\"mainover2\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
			strArg += "<tr onmouseover=\"MM_showHideLayers('6poster" +  this["rownum"] + "','','mainshow','6maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('6poster" +  this["rownum"] + "','','mainhide','6maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('3');\">";
			strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_F" +  leadingZeros(this["rownum"],2) + ".png\" alt=\""+this["rank"]+"위 \"></td>";
			strArg += "<td class=\"mainmovie5\"><a style=\"color:#ffffff;\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";

			 if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],10);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],12);
		      } else {
			      strArg +=string_cut(this["movieNm"],10);
		      }

	       strArg += "</a></td>";

			strArg += "<td class=\"mainmovie6\">" + commify(this["totSeatCnt"]) + "석</td><td class=\"mainmovie7\">("+commify(this["totSeatCntRatio"])+" )</td>";
			strArg += "<td><div><ul><li class=\"mainmovie8\">";


				if(this["rankOldAndNew"] == "NEW"){//신규진입
					strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
				}
				else if( Number(this["rankInten"]) > 0 ){//순위 상승
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				}
				else if ( Number(this["rankInten"]) < 0 ){//순위 하락
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])*-1+"</li>";
				}
				else{//순위 유지
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				}

			strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('6poster" +  this["rownum"] + "','','mainshow','6maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('6poster" +  this["rownum"] + "','','mainhide','6maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('3');\">";
			strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%\" height=\"2\"></td></tr></table>";

		});

		$("#dailySeatTicketOffice").append(strArg);
		$("#dailySeatTicketOfficeDate").append(strArg2);
	}
});

// 해외박스오피스1
$.ajax({
	type : "POST",
	url  : "searchForeignBoxOffice.do",
	dataType : "json",
	data : { curPage : officePage },
	beforeSend: function(xhr){ $("#rentrak01").prepend("<div id=\"foreignBoxOffice1_ingimg\" style=\"width:280px; height:240px; padding-left:15px; background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">"); },
	success : function(data){
		var date = "", nationNmEn = "";
		var strArg = "", strArg2 = "", strArg3 = "", strArg4 = "", strArg5 = "", strArg6 = "", strArg7 = "", strArg8 = "";

		$("#foreignBoxOffice1_ingimg","#rentrak01").remove();
		$("#rentrak01").remove("table");
		$("#rentrak01Date").remove("table");

		strArg3 += "<img src='/kobis/web/comm/images/main/movie_title_us01.png'>";
		strArg4 += "<img src='/kobis/web/comm/images/main/movie_title_uk02.png'>";
		strArg5 += "<img src='/kobis/web/comm/images/main/movie_title_de01.png'>";
		$("#rentrak_title_left").append(strArg3);
		$("#rentrak_title_center").append(strArg4);
		$("#rentrak_title_right").append(strArg5);

		strArg6 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=US\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
		strArg7 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=UK\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
		strArg8 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=DE\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
		$("#mainmore1").append(strArg6);
		$("#mainmore2").append(strArg7);
		$("#mainmore3").append(strArg8);

		$.each(data, function(){
			if(Number(this["rank"]) == 1){
				nationNmEn = this["nationNmEn"];
				date = this["weekRange"];
				strArg2 += "<table><tr><td>" + nationNmEn + " : " + date + "</td></tr></table>";
			}

			//마우스오버
			strArg += "<div class=\"G_data\" id=\"7maindata" + this["rownum"] + "\">";
			strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
			strArg += "<tr onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + this["rownum"] + "','','mainshow');\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + this["rownum"] + "','','mainhide');\">";
			strArg += "<td class=\"G_data1\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros(this["rownum"],2) + "_on.png\" alt=\"" + this["rank"]+"위 \"></td>";
			strArg += "<td class=\"G_data2\" title=\"" + this["movieNm"] + "\">" + string_cut2(this["movieNm"],24) + "</td>";
			strArg += "<td class=\"G_data3\">$ " + commify(this["totIssuAmt"]) + "</td>"
			strArg += "<td><div style=\"padding-left:10px;\"><ul><li class=\"G_data5\">";

			if(this["rankOldAndNew"] == "NEW"){
				strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
			} else if(Number(this["rankInten"]) > 0){
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"G_data6\">"+Number(this["rankInten"])+"</li>";
			} else if(Number(this["rankInten"]) < 0){
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"G_data6\">"+Number(this["rankInten"])*-1+"</li>";
			} else{
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"G_data6\">"+Number(this["rankInten"])+"</li>";
			}
			strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + this["rownum"] + "','','mainshow')\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + this["rownum"] + "','','mainhide');\">";
			strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";

			//기본
			strArg += "<table cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
			strArg += "<tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + this["rownum"] + "','','mainhide');\">";
			strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros(this["rownum"],2) + ".png\" alt=\"" + this["rank"]+"위 \"></td>";
			strArg += "<td class=\"mainmovie17\">" + string_cut2(this["movieNm"],24) + "</td>";
			strArg += "<td class=\"mainmovie18\">$ " + commify(this["totIssuAmt"]) + "</td>"
			strArg += "<td><div style=\"padding-left:10px;\"><ul><li class=\"mainmovie8\">";

			if(this["rankOldAndNew"] == "NEW"){
				strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
			} else if( Number(this["rankInten"]) > 0 ){
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
			} else if ( Number(this["rankInten"]) < 0 ){
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])*-1+"</li>";
			} else{
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
			}
			strArg += "</ul></div></td></tr><tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + this["rownum"] + "','','mainhide');\">";
			strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";
		});

		//데이터가 없는 경우
		if(data == null || data == ""){
			for(var index=0; index<10; index++){
				if(index == 0){
					strArg2 += "<table><tr><td>" + "</td></tr></table>";
				}

				//마우스오버
				strArg += "<div class=\"G_data\" id=\"7maindata" + (index+1) + "\">";
				strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
				strArg += "<tr onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + (index+1) + "','','mainshow');\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + (index+1) + "','','mainhide'); \">";
				strArg += "<td class=\"G_data1\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros((index+1),2) + "_on.png\"></td>";
				strArg += "<td class=\"G_data2\">" + "</td>";
				strArg += "<td class=\"G_data3\">" + "</td>"
				strArg += "<td><div><ul><li class=\"G_data5\">";
				strArg += "</li><li class=\"G_data6\">" + "</li>";
				strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + (index+1) + "','','mainshow');\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + (index+1) + "','','mainhide'); \">";
				strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";

				//기본
				strArg += "<table cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
				strArg += "<tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + (index+1) + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + (index+1) + "','','mainhide'); \">";
				strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros((index+1),2) + ".png\"></td>";
				strArg += "<td class=\"mainmovie17\">" + "</td>";
				strArg += "<td class=\"mainmovie18\">" + "</td>"
				strArg += "<td><div><ul><li class=\"mainmovie8\">";
				strArg += "</li><li class=\"mainmovie9\">" + "</li>";
				strArg += "</ul></div></td></tr><tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + (index+1) + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + (index+1) + "','','mainhide'); \">";
				strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";
			}
		}
		$("#rentrak01").append(strArg);
		$("#rentrak01Date").append(strArg2);
	}
});

//해외박스오피스2
$.ajax({
	type : "POST",
	url  : "searchForeignBoxOffice.do",
	dataType : "json",
	data : { curPage : (officePage+1) },
	beforeSend: function(xhr){ $("#rentrak02").prepend("<div id=\"foreignBoxOffice2_ingimg\" style=\"width:280px; height:240px; padding-left:15px; background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">"); },
	success : function(data){
		var date = "", nationNmEn = "";
		var strArg = "", strArg2 = "";

		$("#foreignBoxOffice2_ingimg","#rentrak02").remove();
		$("#rentrak02").remove("table");
		$("#rentrak02Date").remove("table");

		$.each(data, function(){
			if(Number(this["rank"]) == 1){
				nationNmEn = this["nationNmEn"];
				date = this["weekRange"];
				strArg2 += "<table><tr><td>" + nationNmEn + " : " + date + "</td></tr></table>";
			}

			//마우스오버
			strArg += "<div class=\"H_data\" id=\"8maindata" + this["rownum"] +  "\">";
			strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
			strArg += "<tr onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + this["rownum"] + "','','mainshow');\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + this["rownum"] + "','','mainhide');\">";
			strArg += "<td class=\"H_data1\"><img src=\"/kobis/web/comm/images/main/nember_H" + leadingZeros(this["rownum"],2) + "_on.png\" alt=\"" + this["rank"]+"위 \"></td>";
			strArg += "<td class=\"H_data2\" title='" + this["movieNm"] + "'>" + string_cut2(this["movieNm"],24) + "</td>";
			strArg += "<td class=\"H_data3\">￡ " + commify(this["totIssuAmt"]) + "</td>"
			strArg += "<td><div style=\"padding-left:10px;\"><ul><li class=\"H_data5\">";

			if(this["rankOldAndNew"] == "NEW"){
				strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
			} else if( Number(this["rankInten"]) > 0 ){
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"H_data6\">"+Number(this["rankInten"])+"</li>";
			} else if ( Number(this["rankInten"]) < 0 ){
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"H_data6\">"+Number(this["rankInten"])*-1+"</li>";
			} else{
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"H_data6\">"+Number(this["rankInten"])+"</li>";
			}
			strArg +="</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + this["rownum"] + "','','mainshow');\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + this["rownum"] + "','','mainhide'); \">";
			strArg +="<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";

			//기본
			strArg += "<table cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
			strArg += "<tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + this["rownum"] + "','','mainhide'); \">";
			strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_H" + leadingZeros(this["rownum"],2) + ".png\" alt=\"" + this["rank"]+"위 \"></td>";
			strArg += "<td class=\"mainmovie17\">" + string_cut2(this["movieNm"],24) + "</td>";
			strArg += "<td class=\"mainmovie18\">￡ " + commify(this["totIssuAmt"]) + "</td>"
			strArg += "<td><div style=\"padding-left:10px;\"><ul><li class=\"mainmovie8\">";

			if(this["rankOldAndNew"] == "NEW"){
				strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
			} else if( Number(this["rankInten"]) > 0 ){
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
			} else if ( Number(this["rankInten"]) < 0 ){
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])*-1+"</li>";
			} else{
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
			}
			strArg += "</ul></div></td></tr><tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + this["rownum"] + "','','mainhide'); \">";
			strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";
		});

		//데이터가 없는 경우
		if(data == null || data == ""){
			for(var index=0; index<10; index++){
				if(index == 0){
					strArg2 += "<table><tr><td>" + "</td></tr></table>";
				}

				//마우스오버
				strArg += "<div class=\"H_data\" id=\"8maindata" + (index+1) + "\">";
				strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
				strArg += "<tr onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + (index+1) + "','','mainshow');\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + (index+1) + "','','mainhide'); \">";
				strArg += "<td class=\"H_data1\"><img src=\"/kobis/web/comm/images/main/nember_H" + leadingZeros((index+1),2) + "_on.png\"></td>";
				strArg += "<td class=\"H_data2\">" + "</td>";
				strArg += "<td class=\"H_data3\">" + "</td>"
				strArg += "<td><div><ul><li class=\"H_data5\">";
				strArg += "</li><li class=\"H_data6\">" + "</li>";
				strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + (index+1) + "','','mainshow');\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + (index+1) + "','','mainhide'); \">";
				strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";

				//기본
				strArg += "<table cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
				strArg += "<tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + (index+1) + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + (index+1) + "','','mainhide'); \">";
				strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_H" + leadingZeros((index+1),2) + ".png\"></td>";
				strArg += "<td class=\"mainmovie17\">" + "</td>";
				strArg += "<td class=\"mainmovie18\">" + "</td>"
				strArg += "<td><div><ul><li class=\"mainmovie8\">";
				strArg += "</li><li class=\"mainmovie9\">" + "</li>";
				strArg += "</ul></div></td></tr><tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + (index+1) + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + (index+1) + "','','mainhide'); \">";
				strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";
			}
		}
		$("#rentrak02").append(strArg);
		$("#rentrak02Date").append(strArg2);
	}
});

//해외박스오피스3
$.ajax({
	type : "POST",
	url  : "searchForeignBoxOffice.do",
	dataType : "json",
	data : { curPage : (officePage+2) },
	beforeSend: function(xhr){ $("#rentrak03").prepend("<div id=\"foreignBoxOffice3_ingimg\" style=\"width:280px; height:240px; padding-left:15px; background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">"); },
	success : function(data){
		var date = "", nationNmEn = "";
		var strArg = "", strArg2 = "";

		$("#foreignBoxOffice3_ingimg","#rentrak03").remove();
		$("#rentrak03").remove("table");
		$("#rentrak03Date").remove("table");

		$.each(data, function(){
			if(Number(this["rank"]) == 1){
				nationNmEn = this["nationNmEn"];
				date = this["weekRange"];
				strArg2 += "<table><tr><td>" + nationNmEn + " : " + date + "</td></tr></table>";
			}

			//마우스오버
			strArg += "<div class=\"G_data\" id=\"9maindata" + this["rownum"] + "\">";
			strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
			strArg += "<tr onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + this["rownum"] + "','','mainshow');\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + this["rownum"] + "','','mainhide');\">";
			strArg += "<td class=\"G_data1\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros(this["rownum"],2) + "_on.png\" alt=\"" + this["rank"] + "위 \"></td>";
			strArg += "<td class=\"G_data2\" title='" + this["movieNm"] + "'>" + string_cut2(this["movieNm"],24) + "</td>";
			strArg += "<td class=\"G_data3\">€ " + commify(this["totIssuAmt"]) + "</td>"
			strArg += "<td><div style=\"padding-left:10px;\"><ul><li class=\"G_data5\">";

			if(this["rankOldAndNew"] == "NEW"){
				strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
			} else if(Number(this["rankInten"]) > 0){
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"G_data6\">"+Number(this["rankInten"])+"</li>";
			} else if(Number(this["rankInten"]) < 0){
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"G_data6\">"+Number(this["rankInten"])*-1+"</li>";
			} else{
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"G_data6\">"+Number(this["rankInten"])+"</li>";
			}
			strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + this["rownum"] + "','','mainshow')\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + this["rownum"] + "','','mainhide');\">";
			strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";

			//기본
			strArg += "<table cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
			strArg += "<tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','9maindata" + this["rownum"] + "','','mainhide');\">";
			strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros(this["rownum"],2) + ".png\" alt=\"" + this["rank"]+"위 \"></td>";
			strArg += "<td class=\"mainmovie17\">" + string_cut2(this["movieNm"],24) + "</td>";
			strArg += "<td class=\"mainmovie18\">€ " + commify(this["totIssuAmt"]) + "</td>"
			strArg += "<td><div style=\"padding-left:10px;\"><ul><li class=\"mainmovie8\">";

			if(this["rankOldAndNew"] == "NEW"){
				strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
			} else if( Number(this["rankInten"]) > 0 ){
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
			} else if ( Number(this["rankInten"]) < 0 ){
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])*-1+"</li>";
			} else{
				strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
				strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
			}
			strArg += "</ul></div></td></tr><tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + this["rownum"] + "','','mainhide');\">";
			strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";
		});

		//데이터가 없는 경우
		if(data == null || data == ""){
			for(var index=0; index<10; index++){
				if(index == 0){
					strArg2 += "<table><tr><td>" + "</td></tr></table>";
				}

				//마우스오버
				strArg += "<div class=\"G_data\" id=\"9maindata" + (index+1) + "\">";
				strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
				strArg += "<tr onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + (index+1) + "','','mainshow');\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + (index+1) + "','','mainhide'); \">";
				strArg += "<td class=\"G_data1\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros((index+1),2) + "_on.png\"></td>";
				strArg += "<td class=\"G_data2\">" + "</td>";
				strArg += "<td class=\"G_data3\">" + "</td>"
				strArg += "<td><div><ul><li class=\"G_data5\">";
				strArg += "</li><li class=\"G_data6\">" + "</li>";
				strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + (index+1) + "','','mainshow');\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + (index+1) + "','','mainhide'); \">";
				strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";

				//기본
				strArg += "<table cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
				strArg += "<tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + (index+1) + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + (index+1) + "','','mainhide'); \">";
				strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros((index+1),2) + ".png\"></td>";
				strArg += "<td class=\"mainmovie17\">" + "</td>";
				strArg += "<td class=\"mainmovie18\">" + "</td>"
				strArg += "<td><div><ul><li class=\"mainmovie8\">";
				strArg += "</li><li class=\"mainmovie9\">" + "</li>";
				strArg += "</ul></div></td></tr><tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + (index+1) + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + (index+1) + "','','mainhide'); \">";
				strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";
			}
		}
		$("#rentrak03").append(strArg);
		$("#rentrak03Date").append(strArg2);
	}
});
//온라인상영관 일일 
$.ajax({
	type : "POST",
	url  : "searchMainOnlineDailyBoxOffice.do",
	dataType : "json",
	beforeSend: function(xhr){
		$("#onlineDailyBoxOffice").prepend("<div id=\"onlineDailyBoxOffice_ingimg\" style=\"width:300px;height:240px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
	},
	success : function(data){ 
		var date="";
		var strArg="";
		var strArg2="";
		$("#onlineDailyBoxOffice_ingimg","#onlineDailyBoxOffice").remove();
		$("#onlineDailyBoxOffice").remove("table");
		$("#onlineDailyBoxOfficeDate").remove("table");
		$.each(data, function(){

			if(Number(this["rank"]) == 1){
				date = this["startdate"];
				strArg2 = "<table><tr><td>" + date + "</td></tr></table>";

				$("[name=posterLinkPart1_online]").attr("onclick","mstView('movie','"+this["fimsCode"]+"')");
				$("#10mainPosterPart1").attr("src","/kobis/web/comm/images/main/poster_A01.gif");

				if (this["fileSaveLoct"] != "") {
				$("#10mainPosterImg").attr("src",imgUrl+this["fileSaveLoct"]+thumbMainName+this["sysFileNm"]);
				posterNm[4] = this["movieNm"];
				fnMovieNm('4',this["movieNm"]);
				}
			}

			$("#9imgPoster"+this["rownum"]).attr("src",imgUrl+this["fileSaveLoct"]+thumbMainName+this["sysFileNm"]);

			//마우스오버
		      strArg +="<div class=\"maindata\" id=\"11maindata" + this["rownum"] +  "\">";
		      strArg +="<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
		      strArg +="<tr style='color:#c664c6' onmouseover=\"MM_showHideLayers('9poster" +  this["rownum"] + "','','mainshow','11maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('4','"+this["movieNm"]+"');\" onmouseout=\"MM_showHideLayers('9poster" +  this["rownum"] + "','','mainhide','11maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('4');\">";
		      strArg +="<td class=\"maindata1\"><img src=\"/kobis/web/comm/images/main/nember_A" +  leadingZeros(this["rownum"],2) + "_on.png\" alt=\""+this["rank"]+"위 \"></td>";
		      strArg +="<td class=\"maindata2_online\"><a style='color:#c664c6' href=\"#none\" onclick=\"mstView('movie','"+this["fimsCode"]+"')\">";

		      if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],17);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],19);
		      } else {
			      strArg +=string_cut(this["movieNm"],17);
		      }

		      strArg += "</a></td>";

		      strArg +="<td class=\"maindata3_online\" style='color:#c664c6'>" +commify(this["repgenrenm"])+ "</td><td class=\"maindata4_online\" style='color:#c664c6'></td>";
		      strArg +="<td><div><ul><li class=\"maindata5\" style='color:#c664c6'>";

		    		if(this["rankOldAndNew"] == "NEW"){//신규진입
						strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\"></li>";
					}
					else if( Number(this["rankInten"]) > 0 ){//순위 상승
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"maindata6\" style='color:#c664c6'>"+Number(this["rankInten"])+"</li>";
					}
					else if ( Number(this["rankInten"]) < 0 ){//순위 하락
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"maindata6\" style='color:#c664c6'>"+Number(this["rankInten"])*-1+"</li>";
					}
					else{//순위 유지
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"maindata6\" style='color:#c664c6'>"+Number(this["rankInten"])+"</li>";
					}

		      strArg +="</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('9poster" +  this["rownum"] + "','','mainshow','11maindata" +  this["rownum"] + "','','mainshow');fnMovieNm('4','"+this["movieNm"]+"');\" onmouseout=\"MM_showHideLayers('9poster" +  this["rownum"] + "','','mainhide','11maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('4');\">";
		      strArg +="<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%\" height=\"2\"></td></tr></table></div>";


			//기본
			strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
			strArg += "<tr onmouseover=\"MM_showHideLayers('9poster" +  this["rownum"] + "','','mainshow','11maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('9poster" +  this["rownum"] + "','','mainhide','11maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('4');\">";
			strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_A" +  leadingZeros(this["rownum"],2) + ".png\" alt=\""+this["rank"]+"위 \"></td>";
			strArg += "<td class=\"mainmovie5_online\"><a style=\"color:#ffffff;\" href=\"#none\" onclick=\"mstView('movie','"+this["fimsCode"]+"')\">";


			 if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
		    	  strArg +=string_cut(this["movieNm"],17);
		      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
			      strArg +=string_cut(this["movieNm"],19);
		      } else {
			      strArg +=string_cut(this["movieNm"],17);
		      }

			strArg += "</a></td>";

			strArg += "<td class=\"mainmovie6\">"+commify(this["repgenrenm"]) + "</td><td class=\"mainmovie7_online\"></td>";
			strArg += "<td><div><ul><li class=\"mainmovie8\">";


				if(this["rankOldAndNew"] == "NEW"){//신규진입
					strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
				}
				else if( Number(this["rankInten"]) > 0 ){//순위 상승
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				}
				else if ( Number(this["rankInten"]) < 0 ){//순위 하락
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])*-1+"</li>";
				}
				else{//순위 유지
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				}

			strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('9poster" +  this["rownum"] + "','','mainshow','11maindata" +  this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('9poster" +  this["rownum"] + "','','mainhide','11maindata" +  this["rownum"] + "','','mainhide');fnPosterNm('4');\">";
			strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%\" height=\"2\"></td></tr></table>";
		});
			$("#onlineDailyBoxOffice").append(strArg);
			$("#onlineDailyBoxOfficeDate").append(strArg2);
	}
});

//온라인상영관 주간 
$.ajax({
		type : "POST",
		url  : "searchMainOnlineWeekBoxOffice.do",
		dataType : "json",
		beforeSend: function(xhr){
			$("#onlineWeekBoxOffice").prepend("<div id=\"onlineWeekBoxOffice_ingimg\" style=\"width:300px;height:240px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
		},
		success : function(data){ 
			
			var date="";
			var strArg="";
			var strArg2="";
			$("#onlineWeekBoxOffice_ingimg","#onlineWeekBoxOffice").remove();
			$("#onlineWeekBoxOffice").remove("table");
			$("#onlineWeekBoxOfficeDate").remove("table");
			$.each(data, function(){

				if(Number(this["rank"]) == 1){
					date = this["startDt"]+"~"+this["endDt"];
  					strArg2 = "<table><tr><td>" + date + "</td></tr></table>";
					/* $("[name=posterLinkPart1]").attr("onclick","mstView('movie','"+this["movieCd"]+"')"); */
					$("#10mainPosterPart1").attr("src","/kobis/web/comm/images/main/poster_A01.png");
				}

				$("#10imgPoster"+this["rnum"]).attr("src",imgUrl+this["filesaveloct"]+thumbMainName+this["sysfilenm"]);

				//마우스오버
			      strArg +="<div class=\"maindata\" id=\"10maindata" + this["rnum"] +  "\">";
			      strArg +="<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
			      strArg +="<tr style='color:#744aba' onmouseover=\"MM_showHideLayers('10poster" +  this["rnum"] + "','','mainshow','10maindata" +  this["rnum"] + "','','mainshow');fnMovieNm('4','"+this["movieNm"]+"');\" onmouseout=\"MM_showHideLayers('10poster" +  this["rnum"] + "','','mainhide','10maindata" +  this["rnum"] + "','','mainhide');fnPosterNm('4');\">";
			      strArg +="<td class=\"maindata1\"><img src=\"/kobis/web/comm/images/main/nember_A" +  leadingZeros(this["rnum"],2) + "_on.png\" alt=\""+this["rank"]+"위 \"></td>";
			      strArg +="<td class=\"maindata2_online\"><a style='color:#744aba' href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";

			      if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
			    	  strArg +=string_cut(this["movieNm"],17);
			      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
				      strArg +=string_cut(this["movieNm"],19);
			      } else {
				      strArg +=string_cut(this["movieNm"],17);
			      }

			      strArg += "</a></td>";

			      strArg +="<td class=\"maindata3_online\" style='color:#744aba'>" + commify(this["useCount"]) + "건</td><td class=\"maindata4_online\" style='color:#744aba'></td>";
			      strArg +="<td><div><ul><li class=\"maindata5\" style='color:#744aba'>";

			    		if(this["rankOldAndNew"] == "NEW"){//신규진입
							strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\"></li>";
						}
						else if( Number(this["rankInten"]) > 0 ){//순위 상승
							strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
							strArg += "</li><li class=\"maindata6\" style='color:#744aba'>"+Number(this["rankInten"])+"</li>";
						}
						else if ( Number(this["rankInten"]) < 0 ){//순위 하락
							strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
							strArg += "</li><li class=\"maindata6\" style='color:#744aba'>"+Number(this["rankInten"])*-1+"</li>";
						}
						else{//순위 유지
							strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
							strArg += "</li><li class=\"maindata6\" style='color:#744aba'>"+Number(this["rankInten"])+"</li>";
						}

			      strArg +="</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('10poster" +  this["rnum"] + "','','mainshow','10maindata" +  this["rnum"] + "','','mainshow');fnMovieNm('4','"+this["movieNm"]+"');\" onmouseout=\"MM_showHideLayers('10poster" +  this["rnum"] + "','','mainhide','10maindata" +  this["rnum"] + "','','mainhide');fnPosterNm('4');\">";
			      strArg +="<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%\" height=\"2\"></td></tr></table></div>";


				//기본
				strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 310px;\">";
				strArg += "<tr onmouseover=\"MM_showHideLayers('10poster" +  this["rnum"] + "','','mainshow','10maindata" +  this["rnum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('10poster" +  this["rnum"] + "','','mainhide','10maindata" +  this["rnum"] + "','','mainhide');fnPosterNm('4');\">";
				strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_A" +  leadingZeros(this["rnum"],2) + ".png\" alt=\""+this["rank"]+"위 \"></td>";
				strArg += "<td class=\"mainmovie5_online\"><a style=\"color:#ffffff;\" href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"')\">";


				 if ( strUa != null && strUa.indexOf( "MSIE 7.0" ) != -1 ) {
			    	  strArg +=string_cut(this["movieNm"],17);
			      } else if ( strUa != "" && strUa.indexOf( "MSIE" ) != -1 ) {
				      strArg +=string_cut(this["movieNm"],19);
			      } else {
				      strArg +=string_cut(this["movieNm"],17);
			      }

				strArg += "</a></td>";

				strArg += "<td class=\"mainmovie6\">" + commify(this["useCount"]) + "건</td><td class=\"mainmovie7_online\"></td>";
				strArg += "<td><div><ul><li class=\"mainmovie8\">";


					if(this["rankOldAndNew"] == "NEW"){//신규진입
						strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
					}
					else if( Number(this["rankInten"]) > 0 ){//순위 상승
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
					}
					else if ( Number(this["rankInten"]) < 0 ){//순위 하락
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])*-1+"</li>";
					}
					else{//순위 유지
						strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
						strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
					}

				strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('10poster" +  this["rnum"] + "','','mainshow','10maindata" +  this["rnum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('10poster" +  this["rnum"] + "','','mainhide','10maindata" +  this["rnum"] + "','','mainhide');fnPosterNm('4');\">";
				strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%\" height=\"2\"></td></tr></table>";
			});
				$("#onlineWeekBoxOffice").append(strArg);
				$("#onlineWeekBoxOfficeDate").append(strArg2);
		}
	}); 
	
	
	
	
	
	

//공지사항
$.ajax({
	type : "POST",
	url  : "searchMainBoard.do",
	dataType : "json",
	success : function(data){
		var strArg="";
		$("ul","#mainBoard").remove();
		$.each(data, function(){
			strArg += "<ul><li><a href=\"/kobis/business/comm/ntfy/findCustomerNotify.do?seqNo="+this["seqNo"]+"&pageIndex=1\">"+string_cut(this["boardTitle"],30)+"</a><span>["+this["updDttm"]+"]</span></li></ul>";
		});
		if(data.length == 0)
			strArg += "<li>등록된 공지가 없습니다.</li>";
		$("#mainBoard").append(strArg);
	}
});

var noticnt = 0;

	for(var b=1;b<5;b++){
	$("#wrap_layer_"+b).css("display","none");
	}

	

	if(noticnt != 0) {

		$("#wrap_layer").css("display","block");

		switch (noticnt){
		case 1:
			$("#wrap_layer_1").addClass("layerBox03");
			$("#wrap_layer_1").css("display","block");
			$("#wrap_layer_1").css("z-index", "9999");
			//$("#wrap_layer_1").draggable();
		break;
		default:
			for(var v=1;v<=noticnt;v++){
				$("#wrap_layer_"+v).css("display","block");
				$("#wrap_layer_"+v).css("z-index", "9999");
				//$("#wrap_layer_"+v).css("z-index", "auto");
				//$("#wrap_layer_"+v).draggable();
				}
		break;
		}
	}

	//임의 박스오피스 탭 표시
	var R=Math.floor(Math.random()*5)+0
	fnBoxMovieTab(R);

});

function goDiverMoviePage(page, totalPage, mode){

	$("#diverMovie").empty();
	$("#diverMovieTheater").empty();
	$("#diverMovieTheaterPage").empty();

	$.ajax({
		type : "POST",
		url  : "searchMainDiverMovie.do?curPage="+page+"&mode="+mode,
		dataType : "json",
		beforeSend: function(xhr){
			$("#diverMovie").prepend("<div id=\"diverMovie_ingimg\" style=\"width:657px;height:250px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
		},
		success : function(data){
			var strArg="";
			var movieCd="";
			var curPage="";
			var totalPage="";
			var totalMovie="";
			$("#diverMovie_ingimg","#diverMovie").remove();
			$("#diverMovie").remove("id!=diverMovie");
			$.each(data, function(){
				var synop = this["synop"].replace(new RegExp("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "g"), "");
				strArg += "<ul class=\"maindiversity\">";
				strArg += "<li class=\"maindiversity1\"><a href=\"#none\" onclick=\"mstView('movie','"+this["movieCd"]+"');return false;\"><img src=\""+imgUrl+this["fileSaveLoct"]+thumbName+this["sysFileNm"]+"\" onerror=\"fn_OpenmovieList(this);\" alt=\"영화 포스터\" /></a></li>";
				strArg += "<li>";
				strArg += "<div class=\"maind1\" title=\""+this["movieNm"]+"\"><a href=\"#none\" class=\"maind_over\" onclick=\"mstView('movie','"+this["movieCd"]+"')\"><span class=\"maind1\">"+string_cut(this["movieNm"],10)+"</span></a></div>";
				strArg += "<div class=\"maind2\"><ul>";
				strArg += "<li>장르 : "+this["repGenreNm"]+"</li>";
				strArg += "<li>개봉일 : "+this["openDt"]+"</li>";
				strArg += "<li>제작국가 : "+this["repNationNm"]+"</li>";
				strArg += "<li>감독명 : "+this["directorNm"]+"</li>";
				if (this["theaCnt"] == null) {
					strArg += "<li>상영영화상영관 : -</li></ul>";
				} else {
					strArg += "<li>상영영화상영관 : "+commify(this["theaCnt"])+"개 / "+commify(this["scrnCnt"])+"개 스크린</li></ul>";
				}
				strArg += "</div>";
				strArg += "</li>";
				strArg += "</ul>";
				strArg += "<div class=\"maindiversity2\">";
				strArg += string_cut(synop,195)
				strArg += "</div>";
				movieCd = this["movieCd"];
				curPage = this["curPage"];
				totalPage = this["totalPage"];
			});
			if(data.length == 0){
				strArg += "<ul class=\"maindiversity\">";
				strArg += "<li><div class=\"maindiversity3\">현재 상영중인 다양성 영화가 없습니다.</div></li>";
				strArg += "</ul>";
			}

			totalMovie = data.length;

			$("#diverMovie").append(strArg);

			//다양성영화 상영영화상영관
			$.ajax({
				type : "POST",
				url  : "searchMainDiverMovieTheater.do?movieCd="+movieCd,
				dataType : "json",
				beforeSend: function(xhr){
					$("#mainDiverMovieTheater").prepend("<div id=\"diverMovieTheater_ingimg\" style=\"width:265px;height:135px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
					$("thead","#mainDiverMovieTheater").hide();
				},
				success : function(data){
					var strArg="<tr><td colspan=\"3\" class=\"mainlist2_dot\"></td></tr>";
					var strArgPage="";
					var totalCount="";
					$("#diverMovieTheater_ingimg","#mainDiverMovieTheater").remove();
					$("thead","#mainDiverMovieTheater").show();
					$("#diverMovieTheater").remove("id!=diverMovieTheater");
					$.each(data,  function(i){
						if (i % 2 == 0) {
							strArg += "<tr class=\"mainlist2_bg1\">";
						} else {
							strArg += "<tr class=\"mainlist2_bg2\">";
						}
						strArg += "<td class=\"mainlist2_1\"><a href=\"/kobis/business/mast/thea/findTheaterSchedule.do?theaCd="+this["theaCd"]+"&wideareaCd="+this["wideareaCd"]+"&basareaCd="+this["basareaCd"]+"\" class=\"mainlist2_over\"><span title=\""+this["theaNm"]+"\">"+string_cut(this["theaNm"],10)+"</span></a></td>";
						//strArg += "<td class=\"mainlist2_1\"><a href=\"#none\" class=\"mainlist2_over\" onclick=\"javascript:fn_detail(event, $(this), '"+this["theaCd"]+"');return false;\"><span title=\""+this["theaNm"]+"\">"+string_cut(this["theaNm"],12)+"</span></a></td>";
						strArg += "<td class=\"mainlist2_2\"><span title=\""+this["theaStat"]+"\">"+this["theaStat"]+"</span></td>";
						//strArg += "<td class=\"mainlist2_2\"><span title=\""+this["movieCnt"]+"\">"+this["movieCnt"]+"</span></td>";
						strArg += "<td class=\"mainlist2_3\"><span title=\""+this["mngNm"]+"\">"+string_cut(this["mngNm"],12)+"</span></td>";
						strArg += "</tr>";
						strArg += "<tr><td colspan=\"3\" class=\"mainlist2_dot\"></td></tr>";
					});

					totalCount = data.length;

					if(totalCount == 0){
						strArg += "<tr><td colspan=\"3\" class=\"mainlist2_4\">다양성 영화 상영영화상영관이 없습니다.</td></tr>";
						strArg += "<tr><td colspan=\"3\" class=\"mainlist2_dot\"></td></tr>";
					}
					$("#diverMovieTheater").append(strArg);

					if(totalMovie != 0){
						strArgPage += "<ul>";
						strArgPage += "<li class=\"mainbtn1\">";
						strArgPage += "<a href=\"#\" onclick=\"goDiverMoviePage('" + curPage + "','" + totalPage + "','next');return false;\"><img src=\"/kobis/web/comm/images/main/btn_next.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_next_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_next.png'\" alt=\"다음 페이지\"></a>";
						strArgPage += "</li>";
						strArgPage += "<li class=\"mainbtn1\">";
						strArgPage += "<a href=\"#\" onclick=\"goDiverMoviePage('" + curPage + "','" + totalPage + "','prev');return false;\"><img src=\"/kobis/web/comm/images/main/btn_pre.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_pre_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_pre.png'\" alt=\"이전 페이지\"></a>";
						strArgPage += "</li>";
						strArgPage += "<li class=\"mainbtn2\"><span class=\"mainnumber1\">" + curPage + "</span> <span class=\"mainnumber2\">/</span> <span class=\"mainnumber3\">" + totalPage + "</span></li>";
						strArgPage += "</ul>";

						$("#diverMovieTheaterPage").append(strArgPage);
					}
				}
			});
		}
	});
}

function goMainPlanTypePage(page, totalPage, mode){

	$("#planType").empty();
	$("#planTypePage").empty();

	//다양성 영화(기획전/회고전/재상영) 탭
	$.ajax({
		type : "POST",
		url  : "searchMainPlanType.do?curPage="+page+"&mode="+mode,
		dataType : "json",
		beforeSend: function(xhr){
			$("#planType").prepend("<div id=\"planType_ingimg\" style=\"width:265px;height:135px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
		},
		success : function(data){
			var strArg="<tr><td colspan=\"4\" class=\"mainlist2_dot\"></td></tr>";
			var strArgPage="";
			var curPage="";
			var totalPage="";
			var evenIdx=true;
			$("#planType_ingimg","#planType").remove();
			$("#planType").remove("id!=planType");
			$.each(data, function(){

				if(evenIdx){
					evenIdx = false;
					strArg += "<tr class=\"mainlist2_bg1\">";
				}
				else{
					evenIdx = true;
					strArg += "<tr class=\"mainlist2_bg2\">";
				}

				strArg += "<td class=\"mainB_list1\"><a href=\"#none\" class=\"mainB_list_over\" onclick=\"mstView('movie','"+this["movieCd"]+"')\"><span title=\""+this["movieNm"]+"\">"+string_cut(this["movieNm"],30)+"</span></a></td>";
				strArg += "<td class=\"mainB_list2\">"+gfn_null(this["prdtYear"])+"</td>";
				strArg += "<td class=\"mainB_list3\">";
				if (this["showStartDt"] == null && this["showEndDt"] == null && this["scheduleStdt"] == null){
					strArg += "미상영";
				} else if (this["scheduleStdt"] == this["currentDt"]) {
					strArg += "상영중";
					strArg += "( <em>" + FDate(this["scheduleStdt"],'.')+"</em> ~ <em>" + FDate(this["scheduleEndt"],'.')+"</em> )";
				} else if (this["scheduleStdt"] != null) {
					strArg += "상영예정";
					strArg += "( <em>" + FDate(this["scheduleStdt"],'.')+"</em> ~ <em>" + FDate(this["scheduleEndt"],'.')+"</em> )";
				} else {
					strArg += "상영종료";
				}
				strArg += "</td>";
				strArg += "<td class=\"mainB_list4\">"+gfn_null(this["gubunNm"])+"</td>";
				strArg += "</tr>";
				strArg += "<tr><td colspan=\"4\" class=\"mainlist2_dot\"></td></tr>";
				curPage = this["curPage"];
				totalPage = this["totalPage"];
			});
			if(data.length == 0){
				strArg += "<tr><td colspan=\"4\" class=\"mainB_list5\">다양성 영화( 기획전 / 회고전 / 재상영 )이 없습니다.</td></tr>";
				strArg += "<tr><td colspan=\"4\" class=\"mainlist2_dot\"></td></tr>";
			}

			strArg += "<tr><td colspan=\"4\" class=\"mainlist2_dot\"></td></tr>";

			$("#planType").append(strArg);

			if(data.length != 0) {
				strArgPage += "<ul>";
				strArgPage += "<li class=\"mainbtn1\">";
				strArgPage += "<a href=\"#\" onclick=\"goMainPlanTypePage('" + curPage + "','" + totalPage + "','next');return false;\"><img src=\"/kobis/web/comm/images/main/btn_next.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_next_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_next.png'\" alt=\"다음 페이지\"></a>";
				strArgPage += "</li>";
				strArgPage += "<li class=\"mainbtn1\">";
				strArgPage += "<a href=\"#\" onclick=\"goMainPlanTypePage('" + curPage + "','" + totalPage + "','prev');return false;\"><img src=\"/kobis/web/comm/images/main/btn_pre.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_pre_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_pre.png'\" alt=\"이전 페이지\"></a>";
				strArgPage += "</li>";
				strArgPage += "<li class=\"mainbtn2\"><span class=\"mainnumber1\">" + curPage + "</span> <span class=\"mainnumber2\">/</span> <span class=\"mainnumber3\">" + totalPage + "</span></li>";
				strArgPage += "</ul>";
				$("#planTypePage").append(strArgPage);
			}
		}
	});
}

function goSubCaptionPage(page, totalPage, mode){

	$("#subCaption").empty();
	$("#subCaptionPage").empty();

	//다양성 영화(자막/더빙) 탭
	$.ajax({
		type : "POST",
		url  : "searchMainCaption.do?curPage="+page+"&mode="+mode,
		dataType : "json",
		beforeSend: function(xhr){
			$("#subCaptoin").prepend("<div id=\"subCaption_ingimg\" style=\"width:265px;height:135px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
		},
		success : function(data){
			var strArg="<tr><td colspan=\"4\" class=\"mainlist4_dot\"></td></tr>";
			var strArgPage="";
			var curPage="";
			var totalPage="";
			var evenIdx=true;
			$("#subCaption_ingimg","#subCaption").remove();
			$("#subCaption").remove("id!=subCaption");
			$.each(data, function(){

				if(evenIdx){
					evenIdx = false;
					strArg += "<tr class=\"mainlist4_bg1\">";
				}
				else{
					evenIdx = true;
					strArg += "<tr class=\"mainlist4_bg2\">";
				}

				strArg += "<td class=\"mainC_list1\"><a href=\"#none\" class=\"mainC_list_over\" onclick=\"mstView('movie','"+this["movieCd"]+"')\"><span title=\""+this["movieNm"]+"\">"+string_cut(this["movieNm"],20)+"</span></a></td>";
				strArg += "<td class=\"mainC_list2\">"+gfn_null(this["prdtYear"])+"</td>";
				strArg += "<td class=\"mainC_list3\">";
				if (this["showStartDt"] == null && this["showEndDt"] == null && this["scheduleStdt"] == null){
					strArg += "미상영";
				} else if (this["scheduleStdt"] == this["currentDt"]) {
					strArg += "상영중";
					strArg += "( <em>" + FDate(this["scheduleStdt"],'.')+"</em> ~ <em>" + FDate(this["scheduleEndt"],'.')+"</em> )";
				} else if (this["scheduleStdt"] != null) {
					strArg += "상영예정";
					strArg += "( <em>" + FDate(this["scheduleStdt"],'.')+"</em> ~ <em>" + FDate(this["scheduleEndt"],'.')+"</em> )";
				} else {
					strArg += "상영종료";
				}
				strArg += "</td>";
				strArg += "<td class=\"mainC_list4\">"+string_cut(this["showTypeNm"],40)+"</td>";
				strArg += "</tr>";
				strArg += "<tr><td colspan=\"4\" class=\"mainlist4_dot\"></td></tr>";
				curPage = this["curPage"];
				totalPage = this["totalPage"];
			});
			if(data.length == 0){
				strArg += "<tr><td colspan=\"4\" class=\"mainC_list5\">다양성 영화( 자막 / 더빙 )가 없습니다.</td></tr>";
				strArg += "<tr><td colspan=\"4\" class=\"mainlist4_dot\"></td></tr>";
			}

			$("#subCaption").append(strArg);

			if(data.length != 0) {
				strArgPage += "<ul>";
				strArgPage += "<li class=\"mainbtn1\">";
				strArgPage += "<a href=\"#\" onclick=\"goSubCaptionPage('" + curPage + "','" + totalPage + "','next');return false;\"><img src=\"/kobis/web/comm/images/main/btn_next.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_next_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_next.png'\" alt=\"다음 페이지\"></a>";
				strArgPage += "</li>";
				strArgPage += "<li class=\"mainbtn1\">";
				strArgPage += "<a href=\"#\" onclick=\"goSubCaptionPage('" + curPage + "','" + totalPage + "','prev');return false;\"><img src=\"/kobis/web/comm/images/main/btn_pre.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_pre_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_pre.png'\" alt=\"이전 페이지\"></a>";
				strArgPage += "</li>";
				strArgPage += "<li class=\"mainbtn2\"><span class=\"mainnumber1\">" + curPage + "</span> <span class=\"mainnumber2\">/</span> <span class=\"mainnumber3\">" + totalPage + "</span></li>";
				strArgPage += "</ul>";
				$("#subCaptionPage").append(strArgPage);
			}
		}
	});
}


function goInProductionMoviePage(page, totalPage, mode){

	$("#inProductionMovie").empty();
	$("#inProductionMoviePage").empty();

	//제작중 영화
	$.ajax({
		type : "POST",
		url  : "searchMainInProductionMovie.do?curPage="+page+"&mode="+mode,
		dataType : "json",
		beforeSend: function(xhr){
			$("#inProductionMovie").prepend("<div id=\"inProductionMovie_img\" style=\"width:265px;height:185px;padding-left:15px;background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
			$("thead","#inProductionMovie").hide();
		},
		success : function(data){
			var strArg="<tr><td colspan=\"3\" class=\"mainlist3_dot\"></td></tr>";
			var strArg2="";
			var strArgPage="";
			var strNameLst="";
			var evenIdx=true;
			var evenFlag=true;
			var nmCnt=0;
			var curPage="";
			var totalPage="";
			$("#inProductionMovie_img","#inProductionMovie").remove();
			$("thead","#inProductionMovie").show();
			$("#inProductionMovie").remove("id!=inProductionMovie");
			$.each(data, function(){
				strNameLst = "";
				strArg2 = "";
				nmCnt=0;
				var varNm = this["directorNm"];

				if(evenIdx){
					evenIdx = false;
					strArg += "<tr class=\"mainlist3_bg1\">";
				}
				else{
					evenIdx = true;
					strArg += "<tr class=\"mainlist3_bg2\">";
				}

				strArg += "<td class=\"mainlist3_1\"><a href=\"#none\" class=\"mainlist3_over\" onclick=\"mstView('movie','"+this["movieCd"]+"')\"><span title=\""+this["movieNm"]+"\">"+string_cut(this["movieNm"],15)+"</span></a></td>";
				strArg += "<td class=\"mainlist3_2\">";

				if(varNm != null){
					var nmArray = varNm.split("^");
					for(var i=0; i<nmArray.length; i+=2){
						if(nmCnt < 1)
							strArg2 += "<a href=\"#none\" class=\"mainlist3_over\" onclick=\"mstView('people','"+nmArray[i+1]+"')\">"+string_cut(nmArray[i],3)+"</a>";

						strNameLst += nmArray[i];
						if(nmArray.length > i+2)
							strNameLst += ",";
						nmCnt++;
					}
					strArg += "<span style=\"width:82px;\" title=\""+strNameLst+"\">";
					strArg += strArg2;
					if(nmCnt > 1)
						strArg += " (외"+(nmCnt-1)+"명)";
					strArg += "</span>";
				}
				strArg += "</td>";
				strArg += "<td class=\"mainlist3_3\">"+this["moviePrdtNm"]+"</td>";
				strArg += "</tr>";
				strArg += "<tr><td colspan=\"3\" class=\"mainlist3_dot\"></td></tr>";
				evenFlag = (evenFlag==true)?false:true;
				strArg2 = "";
				curPage = this["curPage"];
				totalPage = this["totalPage"];
			});
			if(data.length == 0) {
				strArg += "<tr><td colspan=\"3\" class=\"mainlist3_4\">제작중인 영화가 없습니다.</td></tr>";
				strArg += "<tr><td colspan=\"3\" class=\"mainlist3_dot\"></td></tr>";
			}

			$("#inProductionMovie").append(strArg);

			if(data.length != 0) {
				strArgPage += "<ul>";
				strArgPage += "<li class=\"mainbtn1\">";
				strArgPage += "<a href=\"#\" onclick=\"goInProductionMoviePage('" + curPage + "','" + totalPage + "','next');return false;\"><img src=\"/kobis/web/comm/images/main/btn_next.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_next_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_next.png'\" alt=\"다음 페이지\"></a>";
				strArgPage += "</li>";
				strArgPage += "<li class=\"mainbtn1\">";
				strArgPage += "<a href=\"#\" onclick=\"goInProductionMoviePage('" + curPage + "','" + totalPage + "','prev');return false;\"><img src=\"/kobis/web/comm/images/main/btn_pre.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_pre_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_pre.png'\" alt=\"이전 페이지\"></a>";
				strArgPage += "</li>";
				strArgPage += "<li class=\"mainbtn2\"><span class=\"mainnumber1\">" + curPage + "</span> <span class=\"mainnumber2\">/</span> <span class=\"mainnumber3\">" + totalPage + "</span></li>";
				strArgPage += "</ul>";
				$("#inProductionMoviePage").append(strArgPage);
			}
		}
	});
}

//해외 박스오피스 페이지 이동
function goForeignBoxOfficePage(mode, bottomPage){
	$("#rentrak01").empty(); $("#rentrak01Date").empty();
	$("#rentrak02").empty(); $("#rentrak02Date").empty();
	$("#rentrak03").empty(); $("#rentrak03Date").empty();
	$("#rentrak_title_left").empty(); $("#rentrak_title_center").empty(); $("#rentrak_title_right").empty();
	$("#arrow_pre").empty(); $("#arrow_next").empty();
	$("#mainmore1").empty(); $("#mainmore2").empty(); $("#mainmore3").empty();
	$("#abroad").empty();

	if(mode == "prev"){
		officePage = officePage - 1;
		if(officePage < 0){
			officePage = officePage + 5;
		}
	} else if(mode == "next"){
		officePage = officePage + 1;
	} else if(mode == "bottom"){
		officePage = bottomPage;
	}

	//해외박스오피스1
	$.ajax({
		type : "POST",
		url  : "searchForeignBoxOffice.do",
		dataType : "json",
		data : { curPage : parseInt(officePage,0), mode : mode },
		beforeSend: function(xhr){
			$("#rentrak01").prepend("<div id=\"foreignBoxOffice1_ingimg\" style=\"width:280px; height:240px; padding-left:15px; background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
			$("#rentrak02").prepend("<div id=\"foreignBoxOffice2_ingimg\" style=\"width:280px; height:240px; padding-left:15px; background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
			$("#rentrak03").prepend("<div id=\"foreignBoxOffice3_ingimg\" style=\"width:280px; height:240px; padding-left:15px; background:url('/kobis/web/comm/images/common/loading_small.gif') center no-repeat;\">");
		},
		success : function(data){
			var date = "", nationNmEn = "";
			var strArg = "", strArg2 = "", strArg3 = "", strArg4 = "", strArg5 = "", strArg6 = "", strArg7 = "", strArg8 = "", strArg9 = "", strArg10 = "", strArg11 = "", strArg12 = "", strArg13 = "", strArg91 = "", strArg9 = "", strArg91 = "", strArg92 = "", strArg93 = "";

			$("#foreignBoxOffice1_ingimg","#rentrak01").remove();
			$("#rentrak01").remove("table");
			$("#rentrak01Date").remove("table");

			if((officePage%5) == 1){
				strArg4 += "<img src='/kobis/web/comm/images/main/movie_title_us01.png'>";
				strArg5 += "<img src='/kobis/web/comm/images/main/movie_title_uk02.png'>";
				strArg8 += "<img src='/kobis/web/comm/images/main/movie_title_de01.png'>";
				strArg6 += "$ ";
				strArg7 += "£ ";
				strArg9 += "€ ";
				strArg10 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=US\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg11 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=UK\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg12 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=DE\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg13 += "<ul><li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','0');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_01_on.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','1');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_02_on.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','2');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_03_on.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','3');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_04.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','4');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_05.png\"></a></li></ul>";

				strArg91 += "";
				strArg92 += "";
				strArg93 += "";

			} else if((officePage%5) == 2){
				strArg4 += "<img src='/kobis/web/comm/images/main/movie_title_uk01.png'>";
				strArg5 += "<img src='/kobis/web/comm/images/main/movie_title_de02.png'>";
				strArg8 += "<img src='/kobis/web/comm/images/main/movie_title_fr01.png'>";
				strArg6 += "£ ";
				strArg7 += "€ ";
				strArg9 += " ";
				strArg10 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=UK\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg11 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=DE\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg12 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=FR\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg13 += "<ul><li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','0');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_01.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','1');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_02_on.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','2');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_03_on.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','3');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_04_on.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','4');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_05.png\"></a></li></ul>";

				strArg91 += "";
				strArg92 += "";
				strArg93 += " 명";

			} else if((officePage%5) == 3){
				strArg4 += "<img src='/kobis/web/comm/images/main/movie_title_de01.png'>";
				strArg5 += "<img src='/kobis/web/comm/images/main/movie_title_fr02.png'>";
				strArg8 += "<img src='/kobis/web/comm/images/main/movie_title_jp01.png'>";
				strArg6 += "€ ";
				strArg7 += " ";
				strArg9 += "Ұ ";
				strArg10 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=DE\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg11 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=FR\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg12 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=JP\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg13 += "<ul><li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','0');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_01.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','1');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_02.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','2');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_03_on.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','3');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_04_on.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','4');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_05_on.png\"></a></li></ul>";

				strArg91 += "";
				strArg92 += " 명";
				strArg93 += "";

			} else if((officePage%5) == 4){
				strArg4 += "<img src='/kobis/web/comm/images/main/movie_title_fr01.png'>";
				strArg5 += "<img src='/kobis/web/comm/images/main/movie_title_jp02.png'>";
				strArg8 += "<img src='/kobis/web/comm/images/main/movie_title_us01.png'>";
				strArg6 += " ";
				strArg7 += "Ұ ";
				strArg9 += "$ ";
				strArg10 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=FR\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg11 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=JP\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg12 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=US\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg13 += "<ul><li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','0');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_01_on.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','1');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_02.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','2');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_03.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','3');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_04_on.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','4');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_05_on.png\"></a></li></ul>";

				strArg91 += " 명";
				strArg92 += "";
				strArg93 += "";
			} else if((officePage%5) == 0){
				strArg4 += "<img src='/kobis/web/comm/images/main/movie_title_jp01.png'>";
				strArg5 += "<img src='/kobis/web/comm/images/main/movie_title_us02.png'>";
				strArg8 += "<img src='/kobis/web/comm/images/main/movie_title_uk01.png'>";
				strArg6 += "Ұ ";
				strArg7 += "$ ";
				strArg9 += "£ ";
				strArg10 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=JP\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg11 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=US\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg12 += "<a href=\"/kobis/business/stat/boxs/findWeekendForeignBoxOfficeList.do?sRepNationCd=UK\"><img src=\"/kobis/web/comm/images/main/more.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/more_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/more.png'\" alt=\"더보기\"></a>";
				strArg13 += "<ul><li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','0');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_01_on.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','1');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_02_on.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','2');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_03.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','3');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_04.png\"></a></li>";
				strArg13 += "<li style=\"float:left;\"><a href=\"#none\" onclick=\"goForeignBoxOfficePage('bottom','4');return false;\"><img src=\"/kobis/web/comm/images/main/abroad_05_on.png\"></a></li></ul>";

				strArg91 += "";
				strArg92 += "";
				strArg93 += "";
			}

			$("#rentrak_title_left").append(strArg4);
			$("#rentrak_title_center").append(strArg5);
			$("#rentrak_title_right").append(strArg8);
			$("#mainmore1").append(strArg10);
			$("#mainmore2").append(strArg11);
			$("#mainmore3").append(strArg12);
			$("#abroad").append(strArg13);

			$.each(data, function(){
				if(Number(this["rank"]) == 1){
					nationNmEn = this["nationNmEn"];
					date = this["weekRange"];
					strArg2 += "<table><tr><td>" + nationNmEn + " : " + date + "</td></tr></table>";
				}

				//마우스오버
				strArg += "<div class=\"G_data\" id=\"7maindata" + this["rownum"] + "\">";
				strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
				strArg += "<tr onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + this["rownum"] + "','','mainshow');\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + this["rownum"] + "','','mainhide');\">";
				strArg += "<td class=\"G_data1\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros(this["rownum"],2) + "_on.png\" alt=\"" + this["rank"]+"위 \"></td>";
				strArg += "<td class=\"G_data2\" title=\"" + this["movieNm"] + "\">" + string_cut2(this["movieNm"],24) + "</td>";

				//strArg += "<td class=\"G_data3\">" + strArg6 + " " + commify(this["totIssuAmt"]) + strArg91 + "</td>"
				if (nationNmEn == "FR"){
					strArg += "<td class=\"G_data3\">" + strArg6 + " " + commify(this["weekendIssuCnt"]) + strArg91 + "</td>"
				}else {
					strArg += "<td class=\"G_data3\">" + strArg6 + " " + commify(this["totIssuAmt"]) + strArg91 + "</td>"
				}

				strArg += "<td><div style=\"padding-left:10px;\"><ul><li class=\"G_data5\">";

				if(this["rankOldAndNew"] == "NEW"){
					strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
				} else if(Number(this["rankInten"]) > 0){
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"G_data6\">"+Number(this["rankInten"])+"</li>";
				} else if(Number(this["rankInten"]) < 0){
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"G_data6\">"+Number(this["rankInten"])*-1+"</li>";
				} else{
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"G_data6\">"+Number(this["rankInten"])+"</li>";
				}
				strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + this["rownum"] + "','','mainshow')\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + this["rownum"] + "','','mainhide');\">";
				strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";

				//기본
				strArg += "<table cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
				strArg += "<tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + this["rownum"] + "','','mainhide');\">";
				strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros(this["rownum"],2) + ".png\" alt=\"" + this["rank"]+"위 \"></td>";
				strArg += "<td class=\"mainmovie17\">" + string_cut2(this["movieNm"],24) + "</td>";

				//strArg += "<td class=\"mainmovie18\">" + strArg6 + " " + commify(this["totIssuAmt"]) + strArg91 + "</td>"
				if (nationNmEn == "FR"){
					strArg += "<td class=\"mainmovie18\">" + strArg6 + " " + commify(this["weekendIssuCnt"]) + strArg91 + "</td>"
				}else {
					strArg += "<td class=\"mainmovie18\">" + strArg6 + " " + commify(this["totIssuAmt"]) + strArg91 + "</td>"
				}

				strArg += "<td><div style=\"padding-left:10px;\"><ul><li class=\"mainmovie8\">";

				if(this["rankOldAndNew"] == "NEW"){
					strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
				} else if( Number(this["rankInten"]) > 0 ){
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				} else if ( Number(this["rankInten"]) < 0 ){
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])*-1+"</li>";
				} else{
					strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
					strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
				}
				strArg += "</ul></div></td></tr><tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + this["rownum"] + "','','mainhide');\">";
				strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";
			});

			//데이터가 없는 경우
			if(data == null || data == ""){
				for(var index=0; index<10; index++){
					if(index == 0){
						strArg2 += "<table><tr><td>" + "</td></tr></table>";
					}

					//마우스오버
					strArg += "<div class=\"G_data\" id=\"7maindata" + (index+1) + "\">";
					strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
					strArg += "<tr onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + (index+1) + "','','mainshow');\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + (index+1) + "','','mainhide'); \">";
					strArg += "<td class=\"G_data1\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros((index+1),2) + "_on.png\"></td>";
					strArg += "<td class=\"G_data2\">" + "</td>";
					strArg += "<td class=\"G_data3\">" + "</td>"
					strArg += "<td><div><ul><li class=\"G_data5\">";
					strArg += "</li><li class=\"G_data6\">" + "</li>";
					strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + (index+1) + "','','mainshow');\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + (index+1) + "','','mainhide'); \">";
					strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";

					//기본
					strArg += "<table cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
					strArg += "<tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + (index+1) + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + (index+1) + "','','mainhide'); \">";
					strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros((index+1),2) + ".png\"></td>";
					strArg += "<td class=\"mainmovie17\">" + "</td>";
					strArg += "<td class=\"mainmovie18\">" + "</td>"
					strArg += "<td><div><ul><li class=\"mainmovie8\">";
					strArg += "</li><li class=\"mainmovie9\">" + "</li>";
					strArg += "</ul></div></td></tr><tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('7poster1','','mainshow','7maindata" + (index+1) + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','7maindata" + (index+1) + "','','mainhide'); \">";
					strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";
				}
			}
			$("#rentrak01").append(strArg);
			$("#rentrak01Date").append(strArg2);

			strArg3 += "<a href=\"#\" onclick=\"goForeignBoxOfficePage('prev','');return false;\">";
			strArg3 += "<img src=\"/kobis/web/comm/images/main/btn_pre_abroad.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_pre_abroad_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_pre_abroad.png'\" alt=\"이전 페이지\">";
			strArg3 += "</a>";
			$("#arrow_pre").append(strArg3);

			//해외박스오피스2
			$.ajax({
				type : "POST",
				url  : "searchForeignBoxOffice.do",
				dataType : "json",
				data : { curPage : (parseInt(officePage,0)+1) , mode : mode },
				beforeSend: function(xhr){},
				success : function(data){
					date = ""; nationNmEn = "";
					strArg = "", strArg2 = "";

					$("#foreignBoxOffice2_ingimg","#rentrak02").remove();
					$("#rentrak02").remove("table");
					$("#rentrak02Date").remove("table");

					$.each(data, function(){
						if(Number(this["rank"]) == 1){
							nationNmEn = this["nationNmEn"];
							date = this["weekRange"];
							strArg2 += "<table><tr><td>" + nationNmEn + " : " + date + "</td></tr></table>";
						}

						//마우스오버
						strArg += "<div class=\"H_data\" id=\"8maindata" + this["rownum"] +  "\">";
						strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
						strArg += "<tr onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + this["rownum"] + "','','mainshow');\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + this["rownum"] + "','','mainhide');\">";
						strArg += "<td class=\"H_data1\"><img src=\"/kobis/web/comm/images/main/nember_H" + leadingZeros(this["rownum"],2) + "_on.png\" alt=\"" + this["rank"]+"위 \"></td>";
						strArg += "<td class=\"H_data2\" title='" + this["movieNm"] + "'>" + string_cut2(this["movieNm"],24) + "</td>";
						//strArg += "<td class=\"H_data3\">" + strArg7 + " " + commify(this["totIssuAmt"]) + strArg92 + "</td>"
						if (nationNmEn == "FR"){
							strArg += "<td class=\"G_data3\">" + strArg7 + " " + commify(this["weekendIssuCnt"]) + strArg92 + "</td>"
						}else {
							strArg += "<td class=\"G_data3\">" + strArg7 + " " + commify(this["totIssuAmt"]) + strArg92 + "</td>"
						}

						strArg += "<td><div style=\"padding-left:10px;\"><ul><li class=\"H_data5\">";

						if(this["rankOldAndNew"] == "NEW"){
							strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
						} else if( Number(this["rankInten"]) > 0 ){
							strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
							strArg += "</li><li class=\"H_data6\">"+Number(this["rankInten"])+"</li>";
						} else if ( Number(this["rankInten"]) < 0 ){
							strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
							strArg += "</li><li class=\"H_data6\">"+Number(this["rankInten"])*-1+"</li>";
						} else{
							strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
							strArg += "</li><li class=\"H_data6\">"+Number(this["rankInten"])+"</li>";
						}
						strArg +="</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + this["rownum"] + "','','mainshow');\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + this["rownum"] + "','','mainhide'); \">";
						strArg +="<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";

						//기본
						strArg += "<table cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
						strArg += "<tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + this["rownum"] + "','','mainhide'); \">";
						strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_H" + leadingZeros(this["rownum"],2) + ".png\" alt=\"" + this["rank"]+"위 \"></td>";
						strArg += "<td class=\"mainmovie17\">" + string_cut2(this["movieNm"],24) + "</td>";

						//strArg += "<td class=\"mainmovie18\">" + strArg7 + " " + commify(this["totIssuAmt"]) + strArg92 + "</td>"
						if (nationNmEn == "FR"){
							strArg += "<td class=\"mainmovie18\">" + strArg7 + " " + commify(this["weekendIssuCnt"]) + strArg92 + "</td>"
						}else {
							strArg += "<td class=\"mainmovie18\">" + strArg7 + " " + commify(this["totIssuAmt"]) + strArg92 + "</td>"
						}

						strArg += "<td><div style=\"padding-left:10px;\"><ul><li class=\"mainmovie8\">";

						if(this["rankOldAndNew"] == "NEW"){
							strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
						} else if( Number(this["rankInten"]) > 0 ){
							strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
							strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
						} else if ( Number(this["rankInten"]) < 0 ){
							strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
							strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])*-1+"</li>";
						} else{
							strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
							strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
						}
						strArg += "</ul></div></td></tr><tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + this["rownum"] + "','','mainhide'); \">";
						strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";
					});

					//데이터가 없는 경우
					if(data == null || data == ""){
						for(var index=0; index<10; index++){
							if(index == 0){
								strArg2 += "<table><tr><td>" + "</td></tr></table>";
							}

							//마우스오버
							strArg += "<div class=\"H_data\" id=\"8maindata" + (index+1) + "\">";
							strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
							strArg += "<tr onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + (index+1) + "','','mainshow');\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + (index+1) + "','','mainhide'); \">";
							strArg += "<td class=\"H_data1\"><img src=\"/kobis/web/comm/images/main/nember_H" + leadingZeros((index+1),2) + "_on.png\"></td>";
							strArg += "<td class=\"H_data2\">" + "</td>";
							strArg += "<td class=\"H_data3\">" + "</td>"
							strArg += "<td><div><ul><li class=\"H_data5\">";
							strArg += "</li><li class=\"H_data6\">" + "</li>";
							strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + (index+1) + "','','mainshow');\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + (index+1) + "','','mainhide'); \">";
							strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";

							//기본
							strArg += "<table cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
							strArg += "<tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + (index+1) + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + (index+1) + "','','mainhide'); \">";
							strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_H" + leadingZeros((index+1),2) + ".png\"></td>";
							strArg += "<td class=\"mainmovie17\">" + "</td>";
							strArg += "<td class=\"mainmovie18\">" + "</td>"
							strArg += "<td><div><ul><li class=\"mainmovie8\">";
							strArg += "</li><li class=\"mainmovie9\">" + "</li>";
							strArg += "</ul></div></td></tr><tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('8poster1','','mainshow','8maindata" + (index+1) + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('8poster1','','mainhide','8maindata" + (index+1) + "','','mainhide'); \">";
							strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";
						}
					}
					$("#rentrak02").append(strArg);
					$("#rentrak02Date").append(strArg2);

					//해외박스오피스3
					$.ajax({
						type : "POST",
						url  : "searchForeignBoxOffice.do",
						dataType : "json",
						data : { curPage : (parseInt(officePage,0)+2), mode : mode },
						beforeSend: function(xhr){},
						success : function(data){
							date = "";
							nationNmEn = "";
							strArg = "", strArg2 = "", strArg3 = "";

							$("#foreignBoxOffice3_ingimg","#rentrak03").remove();
							$("#rentrak03").remove("table");
							$("#rentrak03Date").remove("table");

							$.each(data, function(){
								if(Number(this["rank"]) == 1){
									nationNmEn = this["nationNmEn"];
									date = this["weekRange"];
									strArg2 += "<table><tr><td>" + nationNmEn + " : " + date + "</td></tr></table>";
								}

								//마우스오버
								strArg += "<div class=\"G_data\" id=\"9maindata" + this["rownum"] + "\">";
								strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
								strArg += "<tr onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + this["rownum"] + "','','mainshow');\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + this["rownum"] + "','','mainhide');\">";
								strArg += "<td class=\"G_data1\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros(this["rownum"],2) + "_on.png\" alt=\"" + this["rank"] + "위 \"></td>";
								strArg += "<td class=\"G_data2\" title='" + this["movieNm"] + "'>" + string_cut2(this["movieNm"],24) + "</td>";

								//strArg += "<td class=\"G_data3\">" + strArg9 + " " + commify(this["totIssuAmt"]) + strArg93 + "</td>"
								if (nationNmEn == "FR"){
									strArg += "<td class=\"G_data3\">" + strArg9 + " " + commify(this["weekendIssuCnt"]) + strArg93 + "</td>"
								}else {
									strArg += "<td class=\"G_data3\">" + strArg9 + " " + commify(this["totIssuAmt"]) + strArg93 + "</td>"
								}

								strArg += "<td><div style=\"padding-left:10px;\"><ul><li class=\"G_data5\">";

								if(this["rankOldAndNew"] == "NEW"){
									strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
								} else if(Number(this["rankInten"]) > 0){
									strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
									strArg += "</li><li class=\"G_data6\">"+Number(this["rankInten"])+"</li>";
								} else if(Number(this["rankInten"]) < 0){
									strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
									strArg += "</li><li class=\"G_data6\">"+Number(this["rankInten"])*-1+"</li>";
								} else{
									strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
									strArg += "</li><li class=\"G_data6\">"+Number(this["rankInten"])+"</li>";
								}
								strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + this["rownum"] + "','','mainshow')\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + this["rownum"] + "','','mainhide');\">";
								strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";

								//기본
								strArg += "<table cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
								strArg += "<tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('7poster1','','mainhide','9maindata" + this["rownum"] + "','','mainhide');\">";
								strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros(this["rownum"],2) + ".png\" alt=\"" + this["rank"]+"위 \"></td>";
								strArg += "<td class=\"mainmovie17\">" + string_cut2(this["movieNm"],24) + "</td>";

								//strArg += "<td class=\"mainmovie18\">" + strArg9 + " " + commify(this["totIssuAmt"]) + strArg93 + "</td>"
								if (nationNmEn == "FR"){
									strArg += "<td class=\"mainmovie18\">" + strArg9 + " " + commify(this["weekendIssuCnt"]) + strArg93 + "</td>"
								}else {
									strArg += "<td class=\"mainmovie18\">" + strArg9 + " " + commify(this["totIssuAmt"]) + strArg93 + "</td>"
								}

								strArg += "<td><div style=\"padding-left:10px;\"><ul><li class=\"mainmovie8\">";

								if(this["rankOldAndNew"] == "NEW"){
									strArg += "<img src=\"/kobis/web/comm/images/main/new.png\" alt=\"신규\" class=\"mainarrow1\">";
								} else if( Number(this["rankInten"]) > 0 ){
									strArg += "<img src=\"/kobis/web/comm/images/main/arrow1.png\" alt=\"상승\" class=\"mainarrow1\">";
									strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
								} else if ( Number(this["rankInten"]) < 0 ){
									strArg += "<img src=\"/kobis/web/comm/images/main/arrow2.png\" alt=\"하락\" class=\"mainarrow1\">";
									strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])*-1+"</li>";
								} else{
									strArg += "<img src=\"/kobis/web/comm/images/main/arrow3.png\" alt=\"유지\" class=\"mainarrow1\">";
									strArg += "</li><li class=\"mainmovie9\">"+Number(this["rankInten"])+"</li>";
								}
								strArg += "</ul></div></td></tr><tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + this["rownum"] + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + this["rownum"] + "','','mainhide');\">";
								strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";
							});

							//데이터가 없는 경우
							if(data == null || data == ""){
								for(var index=0; index<10; index++){
									if(index == 0){
										strArg2 += "<table><tr><td>" + "</td></tr></table>";
									}

									//마우스오버
									strArg += "<div class=\"G_data\" id=\"9maindata" + (index+1) + "\">";
									strArg += "<table class=\"mainover1\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
									strArg += "<tr onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + (index+1) + "','','mainshow');\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + (index+1) + "','','mainhide'); \">";
									strArg += "<td class=\"G_data1\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros((index+1),2) + "_on.png\"></td>";
									strArg += "<td class=\"G_data2\">" + "</td>";
									strArg += "<td class=\"G_data3\">" + "</td>"
									strArg += "<td><div><ul><li class=\"G_data5\">";
									strArg += "</li><li class=\"G_data6\">" + "</li>";
									strArg += "</ul></div></td></tr><tr onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + (index+1) + "','','mainshow');\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + (index+1) + "','','mainhide'); \">";
									strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table></div>";

									//기본
									strArg += "<table cellspacing=\"0\" cellpadding=\"0\" style=\"width:280px;\">";
									strArg += "<tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + (index+1) + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + (index+1) + "','','mainhide'); \">";
									strArg += "<td class=\"mainmovie4\"><img src=\"/kobis/web/comm/images/main/nember_G" + leadingZeros((index+1),2) + ".png\"></td>";
									strArg += "<td class=\"mainmovie17\">" + "</td>";
									strArg += "<td class=\"mainmovie18\">" + "</td>"
									strArg += "<td><div><ul><li class=\"mainmovie8\">";
									strArg += "</li><li class=\"mainmovie9\">" + "</li>";
									strArg += "</ul></div></td></tr><tr class=\"mainover1\" onmouseover=\"MM_showHideLayers('9poster1','','mainshow','9maindata" + (index+1) + "' ,'','mainshow')\" onmouseout=\"MM_showHideLayers('9poster1','','mainhide','9maindata" + (index+1) + "','','mainhide'); \">";
									strArg += "<td colspan=\"6\" class=\"mainline2\"><img src=\"/kobis/web/comm/images/main/line.png\" width=\"100%;\" height=\"2\"></td></tr></table>";
								}
							}
							$("#rentrak03").append(strArg);
							$("#rentrak03Date").append(strArg2);

							strArg3 += "<a href=\"#\" onclick=\"goForeignBoxOfficePage('next','');return false;\">";
							strArg3 += "<img src=\"/kobis/web/comm/images/main/btn_next_abroad.png\" onMouseOver=\"this.src='/kobis/web/comm/images/main/btn_next_abroad_on.png'\" onMouseOut=\"this.src='/kobis/web/comm/images/main/btn_next_abroad.png'\" alt=\"다음 페이지\">";
							strArg3 += "</a>";
							$("#arrow_next").append(strArg3);
						}
					});
				}
			});
		}
	});
}

// Rentrak Logo DIV View
function rentrakLogoView(opt) {
	if(opt) $("#rentrakLogo").css("display","block");
	else    $("#rentrakLogo").css("display","none");
}