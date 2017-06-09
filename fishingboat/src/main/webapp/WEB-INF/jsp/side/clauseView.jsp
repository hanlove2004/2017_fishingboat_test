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

		<div class="content">
			<h2>저작권법 정책</h2>
			<p>저작권법 정책을 확인하세요.</p>
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading">&lt;어선거래시스템 저작권법 정책&gt;</div>
					<div class="panel-body">
						<p>1. 어선거래시스템은 저작권법에 따라 홈페이지에서 제공하는 모든 자료의 저작권은 별도의 저작권 표시나<br />
							&nbsp;&nbsp;&nbsp;출처를 명시한 경우를 제외하고는 어선거래시스템에 속한다.</p>
						<p>2. 홈페이지에 게재된 자료는 어선거래시스템의 허가․동의 없이 무단으로 사용할 수 없다. 다만, 비수익적․<br />
							&nbsp;&nbsp;&nbsp;공익적 사용은 허용하되 사전에 어선거래시스템 담당자와 사전 협의 또는 승인을 얻어 출처를 명시하여<br />
							&nbsp;&nbsp;&nbsp;사용하도록 한다.</p>
					</div>
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

