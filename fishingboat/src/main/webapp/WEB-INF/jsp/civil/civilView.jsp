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
		
			<h3>법령 및 제도</h3>
			<p>
				어선거래시스템 법령자료는 법제처 '국가법령정보센터'와 연계하여 제공하고 있습니다.
				<br />영문법령은 대한민국영문법령(<a href="http://elaw.klri.re.kr">elaw.klri.re.kr</a>)사이트에서 이용하실 수 있습니다.
			</p>
			<ul class="nav nav-pills nav-stacked">
				<li class="active"><a href="#">어선법 (아래링크를 클릭하세요.)</a></li>
				<li>
					<a href="#" target="_blank" 
						onclick="window.open('http://www.law.go.kr/lsSc.do?menuId=0&amp;p1=&amp;subMenu=1&amp;nwYn=1&amp;query=%EC%96%B4%EC%84%A0%EB%B2%95&amp;x=0&amp;y=0#liBgcolor0', '', 'width=950, height=768'); return false; " 
						title="해양환경관리법">▶ 어선법</a>
				</li>
				<li>
					<a href="#" target="_blank" 
						onclick="window.open('http://www.law.go.kr/lsSc.do?menuId=0&amp;p1=&amp;subMenu=1&amp;nwYn=1&amp;query=%EC%96%B4%EC%84%A0%EB%B2%95+%EC%8B%9C%ED%96%89%EB%A0%B9&amp;x=0&amp;y=0#liBgcolor0', '', 'width=950, height=768'); return false; " 
						title="해양환경관리법 시행령">▶ 어선법 시행령</a></li>
				<li>
					<a href="#" target="_blank" 
						onclick="window.open('http://www.law.go.kr/lsSc.do?menuId=0&amp;p1=&amp;subMenu=1&amp;nwYn=1&amp;query=%EC%96%B4%EC%84%A0%EB%B2%95+%EC%8B%9C%ED%96%89%EA%B7%9C%EC%B9%99&amp;x=0&amp;y=0#liBgcolor0', '', 'width=950, height=768'); return false; " 
						title="해양환경관리법 시행규칙">▶ 어선법 시행규칙</a></li>
			</ul>
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

