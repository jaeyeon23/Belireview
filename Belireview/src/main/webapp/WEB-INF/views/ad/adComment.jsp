<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/brw/resources/css/comment.css">
<script>
	var yes="${yes}";
	var id="${ID}";
	$(function(){ 
	if(id==""||id==null){//비로그인
		$(".like").click(function(){//좋아요
			alert("로그인 해주세요.");
			location.href="<c:url value='/member/loginForm.br' />"
			});
		
	}else{//로그인
		$(".like").click(function(){//좋아요
			commentlike();
			return;
		});
	
	}
});

$(function(){ 
	if(yes==""||yes==null){
		$(".like").html("좋아요")
		
	}else{
		$(".like").html("좋아요취소")
	
	}
});



function commentlike(){
	$.ajax({
		async : true,  
		type : 'POST',
		data : {ID:id , COMMENTLIKE:"c" , AD_NO:<%=request.getParameter("AD_NO")%>, ADC_NO:$(".adcno").val()},
		url:"<c:url value='/ad/adComment.br' />",
		success : function(result){
				var r = result;
				var clike = "좋아요취소";
				var cnolike =  "좋아요";
				if(r.add){
					$(".like").html(clike);
					
				}
				if(r.subtract){
					$(".like").html(cnolike);
					
				}
				$(".Llike").html(result.AD_LIKE);
			
		}
	})
}


</script>

</head>
<body>
	<div id="root">
		<div class="App__Self-m1g4ja-0 iBpXSE">
			<div class="NavTabManager__NavContainer-dbid0l-0 hhxQev">
				<section class="NavTabManager__Main-dbid0l-1 ikHAvF">
					<section class="SectionWithShrinkHeaderBar__Self-s5xd6pi-0 bvFHSl">
						<header
							class="ShrinkHeaderBar__Self-kl2m8-0 ihFsHc HeaderBarPrimitive-s1yem7n2-0 iKUsMl">
							<div class="ShrinkHeaderBar__Buttons-kl2m8-1 gvGpvr">
								<div class="ShrinkHeaderBar__LeftButtons-kl2m8-5 dPdGEs">
									<button
										class="HeaderBackButton__TopLeftButton-s1sky4x3-0 lfxcSv HeaderCloseButton__TopLeftButton-odlno1-0 cLcmdI StylelessButton-phxvo7-0 gsSopE"></button>
								</div>
								<div class="ShrinkHeaderBar__RightButtons-kl2m8-6 kuosGj"></div>
							</div>
							<div class="ShrinkHeaderBar__LargeTitleBlock-kl2m8-2 VaXBb">
								<div class="ShrinkHeaderBar__LargeTitle-kl2m8-3 hwiyxo">코멘트</div>
							</div>
							<div class="ShrinkHeaderBar__SmallTitle-kl2m8-4 dCruGS">코멘트</div>
						</header>
						<div class="Grid-zydj2q-0 cspjno">
							<div class="Row-s1apwm9x-0 lowZpE">
								<div class="ContentCommentsPage__CommentLists-s9miehw-0 bMVaMG">
									<ul class="VisualUl-s1vzev56-0 hgAYVH">
									<c:forEach items="${adcomment}" var="adcommentlist">
										<div class="BasicCommentItem__Comment-iqy0k7-0 iNWJNm">
											<div class="BasicCommentItem__TitleContainer-iqy0k7-1 jWsgqF">
												<div class="BasicCommentItem__ProfileBlock-iqy0k7-2 dFeRwI">
													<a lng="ko-KR" class="StylelessLocalLink-s1aqpmgk-1 gdyQIs">
														<div class="ProfilePhoto__Self-s1v3isfu-1 lniNjX RoundedImageBlock-k5m4n5-0 gUZYtN">
															<div class="ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 kgJrze"></div>
															<div class="ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy">
																<img class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx"
																	src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																	alt="백수골방의 사진">
															</div>
														</div>
														<div class="UserNameWithBadges__Self-s1bd3hgj-0 brZhrQ">
															${adcommentlist.ID}
															<input type="hidden" value="${adcommentlist.ADC_NO}" class="adcno"/>
															<span class="UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 eBREVF"
																src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iYSIgZD0iTTYgMTAuNjYxYy0uOTI3IDAtMS4xMzEgMS4wMjItMS44NTQuNzg3LS43MjMtLjIzNS0uMjg4LTEuMTgxLTEuMDM4LTEuNzI2LS43NS0uNTQ1LTEuNTE1LjE2MS0xLjk2Mi0uNDU0LS40NDctLjYxNS40NjEtMS4xMjUuMTc1LTIuMDA2QzEuMDM0IDYuMzggMCA2LjUwMiAwIDUuNzQyczEuMDM0LS42NCAxLjMyLTEuNTJjLjI4Ny0uODgzLS42Mi0xLjM5Mi0uMTc0LTIuMDA3LjQ0Ny0uNjE1IDEuMjEyLjA5MSAxLjk2Mi0uNDU0UzMuNDIzLjI3IDQuMTQ2LjAzNUM0Ljg2OS0uMiA1LjA3My44MjEgNiAuODIxUzcuMTMxLS4xOTkgNy44NTQuMDM1Yy43MjMuMjM1LjI4OCAxLjE4MSAxLjAzOCAxLjcyNi43NS41NDUgMS41MTUtLjE2MSAxLjk2Mi40NTQuNDQ3LjYxNS0uNDYxIDEuMTI0LS4xNzUgMi4wMDYuMjg3Ljg4MiAxLjMyMS43NiAxLjMyMSAxLjUycy0xLjAzNC42NC0xLjMyIDEuNTJjLS4yODcuODgyLjYyIDEuMzkyLjE3NCAyLjAwNy0uNDQ3LjYxNS0xLjIxMi0uMDkxLTEuOTYyLjQ1NHMtLjMxNSAxLjQ5LTEuMDM4IDEuNzI2Yy0uNzIzLjIzNS0uOTI3LS43ODctMS44NTQtLjc4N3oiLz4KICAgICAgICA8cGF0aCBpZD0iYyIgZD0iTTYgMTAuNjYxYy0uOTI3IDAtMS4xMzEgMS4wMjItMS44NTQuNzg3LS43MjMtLjIzNS0uMjg4LTEuMTgxLTEuMDM4LTEuNzI2LS43NS0uNTQ1LTEuNTE1LjE2MS0xLjk2Mi0uNDU0LS40NDctLjYxNS40NjEtMS4xMjUuMTc1LTIuMDA2QzEuMDM0IDYuMzggMCA2LjUwMiAwIDUuNzQyczEuMDM0LS42NCAxLjMyLTEuNTJjLjI4Ny0uODgzLS42Mi0xLjM5Mi0uMTc0LTIuMDA3LjQ0Ny0uNjE1IDEuMjEyLjA5MSAxLjk2Mi0uNDU0UzMuNDIzLjI3IDQuMTQ2LjAzNUM0Ljg2OS0uMiA1LjA3My44MjEgNiAuODIxUzcuMTMxLS4xOTkgNy44NTQuMDM1Yy43MjMuMjM1LjI4OCAxLjE4MSAxLjAzOCAxLjcyNi43NS41NDUgMS41MTUtLjE2MSAxLjk2Mi40NTQuNDQ3LjYxNS0uNDYxIDEuMTI0LS4xNzUgMi4wMDYuMjg3Ljg4MiAxLjMyMS43NiAxLjMyMSAxLjUycy0xLjAzNC42NC0xLjMyIDEuNTJjLS4yODcuODgyLjYyIDEuMzkyLjE3NCAyLjAwNy0uNDQ3LjYxNS0xLjIxMi0uMDkxLTEuOTYyLjQ1NHMtLjMxNSAxLjQ5LTEuMDM4IDEuNzI2Yy0uNzIzLjIzNS0uOTI3LS43ODctMS44NTQtLjc4N3oiLz4KICAgIDwvZGVmcz4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPG1hc2sgaWQ9ImIiIGZpbGw9IiNmZmYiPgogICAgICAgICAgICA8dXNlIHhsaW5rOmhyZWY9IiNhIi8+CiAgICAgICAgPC9tYXNrPgogICAgICAgIDx1c2UgZmlsbD0iIzNEM0QzRCIgeGxpbms6aHJlZj0iI2EiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjRkZGIiBkPSJNMy40IDIuOGgxLjJ2OUgzLjR6TTUuOCA1LjJIN3Y3LjJINS44ek04LjIgNy42aDEuMnY0LjhIOC4yeiIgbWFzaz0idXJsKCNiKSIvPgogICAgICAgIDxwYXRoIGZpbGw9IiNGRkYiIGQ9Ik04LjIgNy42SDEzdjEuMkg4LjJ6TTUuOCA1LjJIMTN2MS4ySDUuOHpNMy40IDIuOGg5VjRoLTl6IiBtYXNrPSJ1cmwoI2IpIi8+CiAgICAgICAgPHBhdGggc3Ryb2tlPSIjM0QzRDNEIiBzdHJva2Utb3BhY2l0eT0iLjE1IiBzdHJva2Utd2lkdGg9Ii4yNSIgZD0iTTcuMDAzIDEwLjk3NmMtLjA0MS0uMDM2LjE2LjE0LjIwNi4xNzguMjMyLjE5Mi4zOS4yNDUuNjA2LjE3NS4yNDgtLjA4LjMyOC0uMjIyLjQyMy0uNjQ0LjA0MS0uMTguMDUtLjIyLjA3NS0uMzA0LjA5NS0uMzI5LjI0Mi0uNTY5LjUwNS0uNzYuMDM4LS4wMjguMDc2LS4wNTIuMTE1LS4wNzUuMzA0LS4xNzYuNTUzLS4xOTcgMS4wMzctLjE1Mi40NzUuMDQ0LjYyNi4wMTcuNzgzLS4yYS40OC40OCAwIDAgMCAuMTAxLS4zMTdjLS4wMDUtLjEyOS0uMDM0LS4yMS0uMTY4LS41MjMtLjE5OC0uNDYxLS4yNS0uNzQ5LS4xMjYtMS4xMy4xMTQtLjM1Mi4zMjEtLjU2Ny42NzctLjc4OC4wNDctLjAyOS4xMDQtLjA2My4yMDItLjEyLjMyNi0uMTk3LjQzNi0uMzI1LjQzNi0uNTc1IDAtLjI0OS0uMTEtLjM3Ny0uNDM2LS41NzNhMTQuMDAzIDE0LjAwMyAwIDAgMS0uMjAyLS4xMjFjLS4zNTYtLjIyMS0uNTYzLS40MzYtLjY3Ny0uNzg3LS4xMjQtLjM4My0uMDcyLS42Ny4xMjYtMS4xMzIuMTM0LS4zMTMuMTYzLS4zOTMuMTY4LS41MjJhLjQ4LjQ4IDAgMCAwLS4xMDEtLjMxOGMtLjE1Ny0uMjE2LS4zMDgtLjI0My0uNzgzLS4yLS40ODQuMDQ2LS43MzMuMDI1LTEuMDM3LS4xNTFhMS4zMjYgMS4zMjYgMCAwIDEtLjExNS0uMDc1Yy0uMjYzLS4xOTEtLjQxLS40MzEtLjUwNS0uNzZhNC4zOTIgNC4zOTIgMCAwIDEtLjA3NS0uMzA0QzguMTQzLjM3NiA4LjA2My4yMzQgNy44MTUuMTU0IDcuNi4wODQgNy40NDEuMTM3IDcuMjEuMzI5Yy0uMDQ2LjAzNy0uMjQ4LjIxNC0uMjA2LjE3OC0uMzUuMzAzLS42MTUuNDQtMS4wMDMuNDQtLjM4OCAwLS42NTMtLjEzNy0xLjAwMy0uNDQuMDQxLjAzNi0uMTYtLjE0LS4yMDYtLjE3OC0uMjMyLS4xOTItLjM5LS4yNDUtLjYwNi0uMTc1LS4yNDguMDgtLjMyOC4yMjItLjQyMy42NDQtLjA0MS4xOC0uMDUuMjItLjA3NS4zMDQtLjA5NS4zMjktLjI0Mi41NjktLjUwNS43NmExLjMyNiAxLjMyNiAwIDAgMS0uMTE1LjA3NWMtLjMwNC4xNzYtLjU1My4xOTctMS4wMzcuMTUyLS40NzUtLjA0NC0uNjI2LS4wMTctLjc4My4yYS40OC40OCAwIDAgMC0uMTAxLjMxN2MuMDA1LjEyOS4wMzQuMjEuMTY4LjUyMi4xOTguNDYyLjI1Ljc1LjEyNiAxLjEzMi0uMTE0LjM1LS4zMjEuNTY2LS42NzcuNzg3bC0uMjAyLjEyYy0uMzI2LjE5Ny0uNDM2LjMyNS0uNDM2LjU3NCAwIC4yNS4xMS4zNzguNDM2LjU3NGwuMjAyLjEyMWMuMzU2LjIyLjU2My40MzYuNjc3Ljc4Ny4xMjQuMzgyLjA3Mi42Ny0uMTI2IDEuMTMxLS4xMzQuMzE0LS4xNjMuMzk0LS4xNjguNTIzYS40OC40OCAwIDAgMCAuMTAxLjMxOGMuMTU3LjIxNi4zMDguMjQzLjc4My4yLjQ4NC0uMDQ2LjczMy0uMDI1IDEuMDM3LjE1MS4wMzkuMDIzLjA3Ny4wNDcuMTE1LjA3NS4yNjMuMTkxLjQxLjQzMS41MDUuNzYuMDI0LjA4NC4wMzQuMTIzLjA3NS4zMDQuMDk1LjQyMi4xNzUuNTY0LjQyMy42NDQuMjE2LjA3LjM3NC4wMTcuNjA2LS4xNzUuMDQ2LS4wMzguMjQ4LS4yMTQuMjA2LS4xNzguMzUtLjMwMy42MTUtLjQ0IDEuMDAzLS40NC4zODggMCAuNjUzLjEzNyAxLjAwMy40NHptLTEuODQyLjE4OHoiLz4KICAgIDwvZz4KPC9zdmc+Cg=="></span><span
																class="UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 kyuoIv"
																src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iYSIgZD0iTTYgMTAuNjYxYy0uOTI3IDAtMS4xMzEgMS4wMjItMS44NTQuNzg3LS43MjMtLjIzNS0uMjg4LTEuMTgxLTEuMDM4LTEuNzI2LS43NS0uNTQ1LTEuNTE1LjE2MS0xLjk2Mi0uNDU0LS40NDctLjYxNS40NjEtMS4xMjUuMTc1LTIuMDA2QzEuMDM0IDYuMzggMCA2LjUwMiAwIDUuNzQyczEuMDM0LS42NCAxLjMyLTEuNTJjLjI4Ny0uODgzLS42Mi0xLjM5Mi0uMTc0LTIuMDA3LjQ0Ny0uNjE1IDEuMjEyLjA5MSAxLjk2Mi0uNDU0UzMuNDIzLjI3IDQuMTQ2LjAzNUM0Ljg2OS0uMiA1LjA3My44MjEgNiAuODIxUzcuMTMxLS4xOTkgNy44NTQuMDM1Yy43MjMuMjM1LjI4OCAxLjE4MSAxLjAzOCAxLjcyNi43NS41NDUgMS41MTUtLjE2MSAxLjk2Mi40NTQuNDQ3LjYxNS0uNDYxIDEuMTI0LS4xNzUgMi4wMDYuMjg3Ljg4MiAxLjMyMS43NiAxLjMyMSAxLjUycy0xLjAzNC42NC0xLjMyIDEuNTJjLS4yODcuODgyLjYyIDEuMzkyLjE3NCAyLjAwNy0uNDQ3LjYxNS0xLjIxMi0uMDkxLTEuOTYyLjQ1NHMtLjMxNSAxLjQ5LTEuMDM4IDEuNzI2Yy0uNzIzLjIzNS0uOTI3LS43ODctMS44NTQtLjc4N3oiLz4KICAgIDwvZGVmcz4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPG1hc2sgaWQ9ImIiIGZpbGw9IiNmZmYiPgogICAgICAgICAgICA8dXNlIHhsaW5rOmhyZWY9IiNhIi8+CiAgICAgICAgPC9tYXNrPgogICAgICAgIDx1c2UgZmlsbD0iI0ZGMkY2RSIgeGxpbms6aHJlZj0iI2EiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjRkZGIiBkPSJNNi43NTQgNi43NTR2LTQuOGgxLjJ2NmgtMy42di0xLjJoMi40eiIgbWFzaz0idXJsKCNiKSIgdHJhbnNmb3JtPSJyb3RhdGUoNDUgNi4xNTQgNC45NTQpIi8+CiAgICA8L2c+Cjwvc3ZnPgo="></span>
														</div></a>
												</div>
												<div
													class="BasicCommentItem__UserActionStatus-iqy0k7-4 cMGqAP">
													<img
														src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM0QTRBNEEiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEyIDE3Ljk4bC02LjAxNSA0LjM5MmMtLjUwOC4zNzItMS4xOTQtLjEyNi0uOTk4LS43MjVsMi4zMTctNy4wODEtNi4wMzUtNC4zNjdjLS41MS0uMzY5LS4yNDctMS4xNzUuMzgyLTEuMTc0bDcuNDQ3LjAxNiAyLjI4Ni03LjA5MWMuMTkyLS42IDEuMDQtLjYgMS4yMzMgMGwyLjI4NiA3LjA5IDcuNDQ3LS4wMTVjLjYyOS0uMDAxLjg5LjgwNS4zOCAxLjE3NGwtNi4wMzMgNC4zNjcgMi4zMTYgNy4wOGMuMTk2LjYtLjQ5IDEuMDk4LS45OTkuNzI2TDEyIDE3Ljk4eiIvPgo8L3N2Zz4K"
														width="16px" height="16px" alt="star"><span>${adcommentlist.AL_GRADE}</span>
												</div>
											</div>
											<div class="BasicCommentItem__TextBlock-iqy0k7-3 gVqTAw">
												<div class="ContentlessCommentItem__Text-s1n6rtl6-0 eMbWQD">${adcommentlist.AD_CONTENT}</div>
											</div>
											<div
												class="ContentlessCommentItem__LikeReplyBlock-s1n6rtl6-1 bSwpdd">
												<span
													class="ContentlessCommentItem__LikeImage-s1n6rtl6-2 jmhzoz UIImg-s3jz6tx-0 jSJJRD"
													src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iIzc4Nzg3OCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik02Ljc1IDkuNDg1aC0zYTEgMSAwIDAgMC0xIDF2MTBhMSAxIDAgMCAwIDEgMWgzYTEgMSAwIDAgMCAxLTF2LTEwYTEgMSAwIDAgMC0xLTFNMjAuNjU3IDguNTY2YTIuMzYzIDIuMzYzIDAgMCAwLTEuNzc5LS44MTNIMTYuNjJsLjE2NC0uNjI3Yy4xMzctLjUyOC4yMDEtMS4xMi4yMDEtMS44NjMgMC0xLjkxOS0xLjM3NS0yLjc3OC0yLjczOC0yLjc3OC0uNDQ0IDAtLjc2Ni4xMjMtLjk4Ni4zNzYtLjIuMjI3LS4yODIuNTMtLjI0My45MzVsLjAzIDEuMjMtMi45MDMgMi45NGMtLjU5My42LS44OTQgMS4yMy0uODk0IDEuODcydjkuNjQ3YS41LjUgMCAwIDAgLjUuNWg3LjY4N2EyLjM4OCAyLjM4OCAwIDAgMCAyLjM0OC0yLjA3bDEuNDQ1LTcuNDUyYTIuNDQgMi40NCAwIDAgMC0uNTc0LTEuODk3Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
													width="18px" height="18px"></span><em class="Llike">${adcommentlist.AD_LIKE}</em>
											</div>
											<div
												class="ContentlessCommentItem__UserActionBlock-s1n6rtl6-4 kJvkpH">
												<button
													class="ContentlessCommentItem__UserActionButton-s1n6rtl6-5 kRhZsb StylelessButton-phxvo7-0 gsSopE like">좋아요</button>
											</div>
										</div>
										<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</section>
				</section>
			</div>
		</div>
	</div>

	<script>
        window.ga=function(){ga.q.push(arguments)};ga.q=[];ga.l=+new Date;
        ga("create","UA-27006241-7","auto");
      </script>


	<script src="https://browser.sentry-cdn.com/4.6.4/bundle.min.js"
		crossorigin="anonymous"></script>



	<script
		src="https://d2rlq84xifqisi.cloudfront.net/javascripts/web.9f7fa479dc526cbedf18.js"
		crossorigin="anonymous"></script>


	<script src="https://www.google-analytics.com/analytics.js" async=""
		defer=""></script>


	<script>
        if ('serviceWorker' in navigator) {
          window.addEventListener('load', function() {
            navigator.serviceWorker.register('https://watcha.com/sw.js');
          });
        }
      </script>

	<div id="fb-root" class=" fb_reset">
		<div
			style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div></div>
			<div>
				<iframe name="fb_xdm_frame_https" frameborder="0"
					allowtransparency="true" allowfullscreen="true" scrolling="no"
					allow="encrypted-media" id="fb_xdm_frame_https" aria-hidden="true"
					title="Facebook Cross Domain Communication Frame" tabindex="-1"
					src="https://staticxx.facebook.com/connect/xd_arbiter/r/vy-MhgbfL4v.js?version=44#channel=f2994a59506ece4&amp;origin=https%3A%2F%2Fwatcha.com"
					style="border: none;"></iframe>
			</div>
		</div>
	</div>
</body>
</html>