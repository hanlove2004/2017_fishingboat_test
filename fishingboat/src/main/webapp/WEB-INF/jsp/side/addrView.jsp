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
		
		<div id="content" style="min-height: 470px;">
			<h2>찾아오시는길</h2>
	
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">해양수산부</a></li>
				<li><a data-toggle="tab" href="#menu1">선박안전기술공단</a></li>
			</ul>
	
			<div class="tab-content">
				<div id="home" class="tab-pane fade in active">
					<br /><img alt="해양수산부01" src="<c:url value='/images/map01.gif'/>" />
					<br /><img alt="해양수산부02" src="<c:url value='/images/map01_1.JPG'/>" />
					<br /><img alt="해양수산부03" src="<c:url value='/images/map01_2.JPG'/>" />
				</div>
				<div id="menu1" class="tab-pane fade">
					<br /><img alt="선박안전기술공단01" src="<c:url value='/images/map02.gif'/>" />
					<br /><img alt="선박안전기술공단02" src="<c:url value='/images/map02_1.JPG'/>" />
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

