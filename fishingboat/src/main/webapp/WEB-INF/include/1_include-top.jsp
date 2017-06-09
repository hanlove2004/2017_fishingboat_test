<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header id="header">
	<div class="links">
		<a href="">메뉴?</a>&nbsp;&nbsp;&nbsp;
		<c:choose>
			<c:when test="${mberInfo != null }">
				<a href="#" onclick="javascript:fnTimeAdd(); return false;">사용시간연장</a>&nbsp;&nbsp;&nbsp;
				<a id="logout_time" style="color: red;"></a>&nbsp;&nbsp;&nbsp;
				<a href="<c:url value='/loginmember/openMemberInfoView.do' />">회원정보수정</a>&nbsp;&nbsp;&nbsp;
				<a href="<c:url value='/loginmember/openMemberDeleteView.do' />">회원탈퇴</a>&nbsp;&nbsp;&nbsp;
				<a href="<c:url value='/member/selectLogout.do' />">로그아웃</a>&nbsp;&nbsp;&nbsp;
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/member/openJoinView.do' />">회원가입</a>&nbsp;&nbsp;&nbsp;
				<a href="<c:url value='/member/openLoginView.do' />">로그인</a>&nbsp;&nbsp;&nbsp;
			</c:otherwise>
		</c:choose>
		<a href="#this" id="searchAll">검색</a>&nbsp;&nbsp;&nbsp;
		<b>화면크기</b>&nbsp;&nbsp;
		<a href="#;" onClick="zoomIn();"><img src="<c:url value='/images/new/common/btn_big.gif' />" alt="크게보기"></a>&nbsp;
		<a href="#;" onClick="zoomOut();"><img src="<c:url value='/images/new/common/btn_small.gif' />" alt="작게보기"></a>
	</div>
	<h1>
		<a href="<c:url value='/main/openMainView.do' />" class="logo">
			<img src="<c:url value='/images/new/common/logo.gif' />" alt="로고_어선거래시스템" title="로고_어선거래시스템">
		</a>
	</h1>
</header>
<nav id="nav">
	<!--<h2>메인메뉴</h2>-->
	<ul class="menu">
		<li class="sm1">
			<a href="<c:url value='/side/openSideView.do' />">소개</a>
		</li>
		<li class="sm2">
			<a href="<c:url value='/info/openInfoList.do' />">어선정보</a>
		</li>
		<li class="sm3">
			<a href="<c:url value='/deal/openSellList.do' />">어선거래</a>
		</li>
		<li class="sm4">
			<a href="<c:url value='/civil/openCivilView.do' />">민원안내</a>
		</li>
		<li class="sm5">
			<a href="<c:url value='/community/openNoticeList.do' />">커뮤니티</a>
		</li>
	</ul>
	<div class="menu_bg" style="display: none;">
		<div class="allmenu">
			<ul>
				<li><a href="<c:url value='/side/openSideView.do' />">이용안내</a></li>
				<li><a href="">소개</a></li>
				<li><a href="">소개</a></li>
			</ul>
			<ul>
				<li><a href="<c:url value='/info/openInfoList.do' />">어선기본정보 조회</a></li>
				<li><a href="<c:url value='/info/openInfoSearchList.do' />">어선검사정보 조회</a></li>
				<li><a href="<c:url value='/info/openStoreList.do' />">기타 어선 관련 정보</a></li>
			</ul>
			<ul>
				<li><a href="<c:url value='/deal/openSellList.do' />">어선매도</a></li>
				<li><a href="<c:url value='/deal/openBuyList.do' />">어선매수</a></li>
				<li><a href="<c:url value='/deal/openDealList.do' />">매물현황</a></li>
			</ul>
			<ul>
				<li><a href="<c:url value='/civil/openCivilView.do' />">법령 및 제도</a></li>
				<li><a href="<c:url value='/civil/openRuleList.do' />">관련규정 및 서식</a></li>
				<li><a href="<c:url value='/civil/openStepView.do' />">어선거래절차</a></li>
				<li><a href="<c:url value='/civil/openFaqView.do' />">FAQ</a></li>
				<li><a href="<c:url value='/civil/openQnaList.do' />">Q&amp;A</a></li>
			</ul>
			<ul>
				<li><a href="<c:url value='/community/openNoticeList.do' />">공지사항</a></li>
				<li><a href="<c:url value='/community/openFreeList.do' />">자유게시판</a></li>
				<li><a href="<c:url value='/community/openDataList.do' />">자료실</a></li>
			</ul>
		</div>
	</div>
</nav>

<!-- session time out -->
<div id="timeoutdiv" title="로그인 시간 연장">
	<span id="d_time">0</span> 초 남았습니다.
</div>

<script type="text/javascript">

	var baseOutTime = 1200; //초
	var outTime = 1200; //초
	
	if("" != '<c:out value="${mberInfo.NAM}"/>'){
		window.setTimeout(fnTimeCheck, 10);
	}
	
	function fnTimeCheck(){
		outTime = outTime - 1;
		
		nMin = parseInt(outTime/60);
		nSec = outTime%60;
		if(nSec < 10) { nSec = "0" + nSec;}
		
		$("#logout_time").html(nMin + ":" + nSec);
		
		if(outTime == 30 ) {
			$("#timeoutdiv" ).dialog("open");
			$('.ui-dialog-titlebar-close').hide();
		}else if(outTime == 0 ) {
			location.href="<c:url value='/member/selectLogout.do' />";
		}
		
		$("#d_time").html(outTime);
		window.setTimeout(fnTimeCheck, 1000);
	}
	
	function fnTimeAdd() {
		$.ajax({
			type : 'post',
			dataType : 'json',
			url : "<c:url value='/main/loginCheck.do' />",
			success : function(data) {},
			error : function(e) {}
		});
		outTime = baseOutTime;
	}

	$(function() {
		// 화면크기 초기셋팅 100%로!
		//zoomReset();
		
		$("#nav").mouseenter(function() {
			// display : none 경우에만 실행
			$(".menu_bg").slideDown();
		});
		
		$("#nav").mouseleave(function() {
			// display : none 아닐 경우에만 실행
			$(".menu_bg").slideUp();
		});
		
		$("#timeoutdiv").dialog({
			autoOpen : false,
			height : 140,
			/* position : {
				my : "center",
				at : "center",
				of : "#container"
			}, */
			modal : true,
			title : "로그인 시간 연장",
			resizable : false,
			closeOnEscape: false,
			buttons : {
				"로그인 시간 연장" : function() {
					$.ajax({
						type : 'post',
						dataType : 'json',
						url : "<c:url value='/main/loginCheck.do' />",
						success : function(data) {},
						error : function(e) {}
					});
					outTime = baseOutTime;

					$(this).dialog("close");
				},
				"취소" : function() {
					$(this).dialog("close");
				}
			}, 
			show : {
				effect: "fade",
				duration: 200
			},
			hide : {
				effect: "fade",
				duration: 200
			}
		});
		
		// 전체 검색
		$("#searchAll").on("click", function(e) { // 검색버튼
			e.preventDefault();
			var mberInfo = "${mberInfo}";
			if(mberInfo == "" || mberInfo == null) {
				alert("로그인 후 사용해 주세요.");
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/member/openLoginView.do' />");
				comSubmit.submit();
			} else {
				fn_searchMain();
			}
		});
		
		function fn_searchMain() {
			if($.trim($("#mainSearch").val()) == "") {
				alert("검색어를 입력하세요.");
				$("#mainSearch").focus();
				return;
			} else {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/search/openSearchList.do' />");
				comSubmit.addParam("keyword", $("#mainSearch").val());
				comSubmit.submit();
			}
			
		}
	});
	
	// 화면 확대 축소
	var nowZoom = 100;
	
	function zoomOut() { // 화면크기축소
		nowZoom = nowZoom - 10;
		if (nowZoom <= 70)
			nowZoom = 70; // 화면크기 최대 축소율 70%
		zooms();
	}

	function zoomIn() { // 화면크기확대
		nowZoom = nowZoom + 10;
		if (nowZoom >= 200)
			nowZoom = 200; // 화면크기 최대 확대율 200%
		zooms();
	}
	
	function zoomReset() {
		nowZoom = 100; // 원래 화면크기로 되돌아가기
		zooms();
	}
	
	function zooms() {
		document.body.style.zoom = nowZoom + "%";
		if (nowZoom == 70) {
			alert("더 이상 축소할 수 없습니다."); // 화면 축소율이 70% 이하일 경우 경고창
		}
		if (nowZoom == 200) {
			alert("더 이상 확대할 수 없습니다."); // 화면 확대율이 200% 이상일 경우 경고창
		}
	}
</script>

<script type="text/javascript">
	// 페이지 로그 입력
	function fn_pageLog(){
		$.ajax({
			url : "<c:url value='/main/insertPageStats.do' />",
			type : "POST",
			data : {
				"usr_ip" : "<%= request.getRemoteAddr()%>",
				"page" : "${page}",
				"usr_id" : "${mberInfo.USR_ID}"
			},
			async : false,
			success : function(data, status) {
				if (data != null || data != undefined) {
					console.log("success");
					return;
				} else {
					console.log("fail");
				}
			},
			error: function(e){
				alert(e.responseText);
			}
		});
	}
</script>
