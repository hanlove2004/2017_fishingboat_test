<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div align="left" style="padding: 15px; float: left;">
	<a href="<c:url value='/main/openMainView.do' />"><img alt="어선거래시스템로고" src="/file/images/logo.gif" /></a>
</div>
<div align="right" style="padding: 15px;">
	<input type="text" id="mainSearch" name="mainSearch" placeholder="검색어를 입력하세요." />
	&nbsp;&nbsp;&nbsp;<a href="#this" id="searchAll" class="btn btn-success">검색</a>
</div>
<div id="header">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<%-- <li class="active"><a href="<c:url value='/main/openMainView.do' />">Home</a></li> --%>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">어선거래 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value='/deal/openSellList.do' />">어선매도</a></li>
						<li><a href="<c:url value='/deal/openBuyList.do' />">어선매수</a></li>
						<li><a href="<c:url value='/deal/openDealList.do' />">매물현황</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">어선관련정보<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value='/info/openInfoList.do' />">어선기본정보 조회</a></li>
						<li><a href="<c:url value='/info/openInfoSearchList.do' />">어선검사정보 조회</a></li>
						<li><a href="<c:url value='/info/openStoreList.do' />">기타 어선 관련 정보</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">민원안내<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value='/civil/openCivilView.do' />">법령 및 제도</a></li>
						<li><a href="<c:url value='/civil/openRuleList.do' />">관련규정 및 서식</a></li>
						<li><a href="<c:url value='/civil/openStepView.do' />">어선거래절차</a></li>
						<li><a href="<c:url value='/civil/openFaqView.do' />">FAQ</a></li>
						<li><a href="<c:url value='/civil/openQnaList.do' />">Q&A</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value='/community/openNoticeList.do' />">공지사항</a></li>
						<li><a href="<c:url value='/community/openFreeList.do' />">자유게시판</a></li>
						<li><a href="<c:url value='/community/openDataList.do' />">자료실</a></li>
					</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${mberInfo != null }">
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">로그인정보<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#" style="color: blue;"><c:out value="${mberInfo.NAM }"/> 님</a></li>
								<li><a href="#" id="logout_time" style="color: red;"></a></li>
								<li><a href="#" onclick="javascript:fnTimeAdd(); return false;" >사용 연장</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value='/loginmember/openMemberInfoView.do' />">회원정보수정</a></li>
								<li><a href="<c:url value='/loginmember/openMemberDeleteView.do' />">회원탈퇴</a></li>
							</ul>
						</li>
						<li><a href="<c:url value='/member/selectLogout.do' />"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="<c:url value='/member/openJoinView.do' />"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
						<li><a href="<c:url value='/member/openLoginView.do' />"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
</div>

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
