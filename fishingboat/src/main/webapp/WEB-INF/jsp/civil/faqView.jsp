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
			<h2>FAQ</h2>
			<p>
				<strong>FAQ:</strong> 가장 <strong>많이</strong> 질문하시는 부분을 알려드립니다.
			</p>
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapse1"><strong>질문 : </strong> 사이트에 회원가입을 해야 어선거래가 가능한가요?</a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse in">
						<div class="panel-body">
							<strong>답변 : </strong> 투명한 어선거래를 위하여 어선매도자, 어선매수자 모두 회원가입 후 어선거래시스템을 이용하실 수 있습니다.
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapse2"><strong>질문 : </strong> 어선거래 관련 현행법령을 보시고자 할 경우는?</a>
						</h4>
					</div>
					<div id="collapse2" class="panel-collapse collapse">
						<div class="panel-body">
							<strong>답변 : </strong> 민원안내 -&gt; 법령 및 제도 메뉴 (<a href="<c:url value='/civil/openCivilView.do' />" style="color: #01579f;">바로가기</a>) 를 이용하시거나 법제처 홈페이지 (<a href="http://www.law.go.kr/lsSc.do?menuId=0&amp;p1=&amp;subMenu=1&amp;nwYn=1&amp;query=%EC%96%B4%EC%84%A0%EB%B2%95&amp;x=0&amp;y=0#liBgcolor0" style="color: #01579f;" target="_blank" alt="[새창]" title="[새창]">바로가기</a>) 를 이용해 주세요.
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapse3"><strong>질문 : </strong> 질문질문질문</a>
						</h4>
					</div>
					<div id="collapse3" class="panel-collapse collapse">
						<div class="panel-body">
							<strong>답변 : </strong> 답변답변답변
						</div>
					</div>
				</div>
			</div>
			<br />
			<br />
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

