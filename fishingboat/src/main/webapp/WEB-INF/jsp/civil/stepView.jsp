<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>

	<div class="container">
		
		<%@ include file="/WEB-INF/include/include-top.jsp"%>
		
		<div id="content">
			<h2>어선거래절차</h2>
			<p>어선거래 절차와 어선거래시스템에 대해서 알려드립니다.</p>
	
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">어선매도</a></li>
				<li><a data-toggle="tab" href="#menu1">어선매수</a></li>
				<li><a data-toggle="tab" href="#menu2">어선거래시스템 개요</a></li>
				<li><a data-toggle="tab" href="#menu3">어선거래시스템 소개</a></li>
			</ul>
	
			<div class="tab-content">
				<div id="home" class="tab-pane fade in active">
					<br /><img alt="어선매도" src="<c:url value='/images/sell.png'/>" />
				</div>
				<div id="menu1" class="tab-pane fade">
					<br /><img alt="어선매수" src="<c:url value='/images/buy.png'/>" />
				</div>
				<div id="menu2" class="tab-pane fade">
					<h3>어선거래시스템이란</h3>
					<p>공정하고 편리한 어선거래를 위해 거래에 필요한 관련정보[어선 기본정보, 매매가격, 검사정보 등]를 어선거래 당사자들에게 제공하고, 건전한 어선거래 중개업을 육성하기 위해 구축한 시스템이며 2016년 하반기부터 정식 운영을 목표로 추진하고 있습니다.</p>
					<img alt="어선거래시스템이란" src="<c:url value='/images/overview01.gif'/>" />
					<h3>어선거래시스템 운영체계</h3>
					<img alt="어선거래시스템이란" src="<c:url value='/images/overview02.gif'/>" />
					<h3>어선거래시스템 이용방법</h3>
					<p>
						⊙ 어선 매도 · 매수 희망자 홈페이지(wwww.어선거래.한국)
						<br />· 회원가입 후 어선거래 관련정보 조회 및 매물(매도 · 매수)등록 가능
						<br />· 어선중개업 등록증을 소지한 어선중개업자를 통해 어선거래
					</p>
					<p>
						⊙ 어선중개업자 홈페이지(broker.어선거래.한국)
						<br />· 어선중개업 등록증을 소지한 어선중개업자가 시스템을 이용하여 어선거래를 중개하고자할 때는 회원가입(등록)후 이용
					</p>
					<img alt="어선거래시스템이란" src="<c:url value='/images/overview03.gif'/>" />
				</div>
				<div id="menu3" class="tab-pane fade">
					<br /><img alt="어선거래시스템소개" src="<c:url value='/images/introduce.jpg'/>" />
				</div>
			</div>
			
			<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		</div>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
		
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	
	<script type="text/javascript">
		$(document).ready(function() {
			fn_pageLog();
		});
	</script>
</body>
</html>

