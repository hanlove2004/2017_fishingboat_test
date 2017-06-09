<%
	response.setHeader("Pragma","no-cache");			// HTTP1.0 캐쉬 방지
	response.setDateHeader("Expires",0);				// proxy 서버의 캐쉬 방지
	response.setHeader("Pragma", "no-store");			// HTTP1.1 캐쉬 방지
	if(request.getProtocol().equals("HTTP/1.1"))
			response.setHeader("Cache-Control", "no-cache"); // HTTP1.1 캐쉬 방지
%>

<%@ page import ="java.util.*,java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//날짜 생성
	Calendar today = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	String day = sdf.format(today.getTime());
	
	java.util.Random ran = new Random();
	//랜덤 문자 길이
	int numLength = 6;
	String randomStr = "";
	
	for (int i = 0; i < numLength; i++) {
		//0 ~ 9 랜덤 숫자 생성
		randomStr += ran.nextInt(10);
	}

	//reqNum은 최대 40byte 까지 사용 가능
	String reqNum = day + randomStr;
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div align="left" style="padding: 10px 0px 5px 10px; float: left; height: 50px;">
	<a href="<c:url value='/main/openEduMainView.do' />"><img alt="어선거래시스템로고" src="/file/images/logo.gif" /></a>
</div>

<div align="right" style="padding: 15px; height: 50px;">
	<c:if test="${mberInfo != null }">
		<span style="color: blue;"><c:out value="${mberInfo.EDU_NAM }"/> 님</span>&nbsp;&nbsp;&nbsp;
		<b id="logout_time" style="color: red;"></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="btn btn-xs btn-primary" href="#" onclick="javascript:fnTimeAdd(); return false;" >사용 연장</a>
	</c:if>
</div>

<div id="header">
	<nav class="navbar navbar-default" style="margin-bottom: 10px;">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand active" href="<c:url value='/main/openEduMainView.do' />"><i class="glyphicon glyphicon-home"></i> HOME</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="<c:url value='/application/openApplicationView.do' />"><i class="glyphicon glyphicon-pencil"></i> 교육신청</a></li>
					<li><a href="<c:url value='/application/openApplicationReport.do' />"><i class="glyphicon glyphicon-file"></i> 교육접수증출력</a></li>
					<!-- check.check 2017.06.08 -->
					<!-- <li><a style="color: red;"><b>(선)개발 우선순위(후)</b></a></li> -->
					<%-- <li><a href="<c:url value='/resultcheck/openResultCheckView.do' />"><i class="glyphicon glyphicon-ok"></i> 결과확인</a></li>
					<li><a href="<c:url value='/certificate/openCertificateView.do' />"><i class="glyphicon glyphicon-file"></i> 이수증발급</a></li> --%>
					<%-- <li><a href="<c:url value='/brokerrequest/openBrokerRequestView.do' />"><i class="glyphicon glyphicon-check"></i> 중개업신청</a></li>
					<li><a href="<c:url value='/registration/openRegistrationView.do' />"><i class="glyphicon glyphicon-file"></i> 등록증발급</a></li>
					<li><a href="<c:url value='/community/openEduNoticeList.do' />"><i class="glyphicon glyphicon-info-sign"></i> 공지사항</a></li> --%>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${mberInfo != null }">
							<%-- <li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">로그인정보<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#" style="color: blue;"><c:out value="${mberInfo.NAM }"/> 님</a></li>
									<li><a href="#" id="logout_time" style="color: red;"></a></li>
									<li><a href="#" onclick="javascript:fnTimeAdd(); return false;" >사용 연장</a></li>
								</ul>
							</li> --%>
							<%-- <li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value='/loginmember/openEduMemberInfoView.do' />">회원정보수정</a></li>
									<li><a href="<c:url value='/loginmember/openEduMemberDeleteView.do' />">회원탈퇴</a></li>
								</ul>
							</li> --%>
							<li><a href="<c:url value='/member/selectEduLogout.do' />"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<%-- <li><a href="<c:url value='/member/openEduJoinView.do' />"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li> --%>
							<li><a href="<c:url value='/member/openEduLoginView.do' />"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
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
	
	if("" != '<c:out value="${mberInfo.EDU_NAM}"/>'){
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
			location.href="<c:url value='/member/selectEduLogout.do' />";
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
	});
	
</script>
