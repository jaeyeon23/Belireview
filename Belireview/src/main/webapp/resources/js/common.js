function gfn_isNull(str) {
	if (str == null) return true;
	if (str == "NaN") return true;
	if (new String(str).valueOf() == "undefined") return true;    
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;    
    if (chkStr.toString().length == 0 ) return true;   
    return false; 
}

function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	this.method = "POST";
	
	if(this.formId == "commonForm"){
		$("#"+this.formId).empty();
	}
	
	this.setUrl = function setUrl(url){
		this.url = url;
	};
	
	this.addParam = function addParam(key, value){
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
	};
	this.setMethod = function setMethod(method){
		this.method = method;
	}
	
	this.submit = function submit(){
		var frm = $("#"+this.formId)[0];
		frm.action = this.url;
		frm.method = this.method;
		frm.submit();	
	};
}
/*var gfv_ajaxCallback = "";
function ComAjax(opt_formId){
    this.url = "";     
    this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
    this.param = "";
     
    if(this.formId == "commonForm"){
        var frm = $("#commonForm");
        if(frm.length > 0){
            frm.remove();
        }
        var str = "<form id='commonForm' name='commonForm'></form>";
        $('body').append(str);
    }
     
    this.setUrl = function setUrl(url){
        this.url = url;
    };
     
    this.setCallback = function setCallback(callBack){
        fv_ajaxCallback = callBack;
    };
 
    this.addParam = function addParam(key,value){
        this.param = this.param + "&" + key + "=" + value;
    };
     
    this.ajax = function ajax(){
        if(this.formId != "commonForm"){
            this.param += "&" + $("#" + this.formId).serialize();
        }
        $.ajax({
            url : this.url,   
            type : "POST",  
            data : this.param,
            async : false,
            success : function(data, status) {
                if(typeof(fv_ajaxCallback) == "function"){
                    fv_ajaxCallback(data);
                }
                else {
                    eval(fv_ajaxCallback + "(data);");
                }
            }
        });
    };
}*/
/*
divId : 페이징 태그가 그려질 div
pageIndx : 현재 페이지 위치가 저장될 input 태그 id
recordCount : 페이지당 레코드 수
totalCount : 전체 조회 건수
eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름

var gfv_pageIndex = null;
var gfv_eventName = null;
function gfn_renderPaging(params){
    var divId = params.divId; //페이징이 그려질 div id
    gfv_pageIndex = params.pageIndex; //현재 위치가 저장될 input 태그
    var totalCount = params.totalCount; //전체 조회 건수
    var currentIndex = $("#"+params.pageIndex).val(); //현재 위치
    if(currentIndex.length == 0 || gfn_isNull(currentIndex) == true){
        currentIndex = 1;
    }
     
    var recordCount = params.recordCount; //페이지당 보여줄 행의 수
    if(gfn_isNull(recordCount) == true){
        recordCount = 4;
    }
    var totalIndexCount = Math.ceil(totalCount / recordCount); // 전체 인덱스 수
    
    gfv_eventName = params.eventName;
     
    $("#"+divId).empty();
    var preStr = "";
    var postStr = "";
    var str = "";
    var tmp = parseInt((currentIndex-1) / 5);
     
    var first = (tmp*5) + 1;
    var last = first + 4;
    var prev = (tmp*5) - 4 > 0 ? (tmp*5) - 4 : 1;
    var next = (tmp+1) * 5 + 1 < totalIndexCount ? (tmp+1) * 5 + 1 : totalIndexCount;
     
    if(totalIndexCount > 5){ 
        preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>" +
                "<a href='#this' class='pad_5' onclick='_movePage("+prev+")'>[<]</a>";
        
        postStr += "<a href='#this' class='pad_5' onclick='_movePage("+next+")'>[>]</a>" +
        "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
    }
    else if(totalIndexCount <=5 && totalIndexCount > 1){ 
        preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>";
        
        postStr += "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
    }
    
    var tt = totalIndexCount;
    alert(totalIndexCount);
    alert(last);
    if(last < tt){
    	tt = last
    }
	    for(var i=first; i<=tt; i++){
	    	if(i != currentIndex){
	            str += "<a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a>";
	        }
	        else{
	            str += "<b><a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a></b>";
	        }
	    }
    $("#"+divId).append(preStr + str + postStr);
}
 
function _movePage(value){
    $("#"+gfv_pageIndex).val(value);
    if(typeof(gfv_eventName) == "function"){
        gfv_eventName(value);
    }
    else {
        eval(gfv_eventName + "(value);");
    }
}
*/
