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
			<h3>뷰어다운로드</h3>
			<p>필요하신 뷰어를 다운로드 하세요</p>
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading">뷰어프로그램 다운로드</div>
					<div class="panel-body">
						<div style="float: left; width: 10%;">
							<img src="<c:url value='/images/icon/icon_viewer_01.gif' />" alt="한글문서(HWP)" />
						</div>
						<div style="float: left; width: 80%;">
							한글문서(HWP)<br/><br/>
							한글과 컴퓨터에서 나온 한글 문서를 볼 수 있는 뷰어입니다.
						</div>
						<div style="float: left; width: 10%;">
							<a href="http://www.hancom.co.kr/downLoad.downPU.do?mcd=002" target="_blank" title="새창 한글뷰어 다운로드">
								<img src="<c:url value='/images/icon/fileDownBtn.png' />" alt="한글뷰어 다운로드">
							</a>
						</div>
					</div>
					<div class="panel-body">
						<div style="float: left; width: 10%;">
							<img src="<c:url value='/images/icon/icon_viewer_02.gif' />" alt="Adobe 아크로벳 리더" />
						</div>
						<div style="float: left; width: 80%;">
							Adobe 아크로벳 리더<br/><br/>
							어도비에서 배포한 아크로뱃으로 제작된 문서를 볼수 있게 해주는 뷰어이자 플러그인입니다.
						</div>
						<div style="float: left; width: 10%;">
							<a href="http://get.adobe.com/kr/reader/" target="_blank" title="새창 아크로벳뷰어 다운로드">
								<img src="<c:url value='/images/icon/fileDownBtn.png' />" alt="아크로벳뷰어 다운로드">
							</a>
						</div>
					</div>
					<div class="panel-body">
						<div style="float: left; width: 10%;">
							<img src="<c:url value='/images/icon/icon_viewer_03.gif' />" alt="마이크로소프트 워드 뷰어(DOC)" />
						</div>
						<div style="float: left; width: 80%;">
							마이크로소프트 워드 뷰어(DOC)<br/><br/>
							마이크로소프트 워드 문서를 보게 해주는 뷰어입니다.
						</div>
						<div style="float: left; width: 10%;">
							<a href="http://www.microsoft.com/ko-kr/download/details.aspx?id=4" target="_blank" title="새창 워드뷰어 다운로드">
								<img src="<c:url value='/images/icon/fileDownBtn.png' />" alt="워드뷰어 다운로드">
							</a>
						</div>
					</div>
					<div class="panel-body">
						<div style="float: left; width: 10%;">
							<img src="<c:url value='/images/icon/icon_viewer_04.gif' />" alt="마이크로소프트 파워포인트 뷰어(PPT)" />
						</div>
						<div style="float: left; width: 80%;">
							마이크로소프트 파워포인트 뷰어(PPT)<br/><br/>
							마이크로소프트 파워포인트 문서를 보게 해주는 뷰어입니다.
						</div>
						<div style="float: left; width: 10%;">
							<a href="http://www.microsoft.com/ko-kr/download/details.aspx?id=6" target="_blank" title="새창 파워포인트뷰어 다운로드">
								<img src="<c:url value='/images/icon/fileDownBtn.png' />" alt="파워포인트뷰어 다운로드">
							</a>
						</div>
					</div>
					<div class="panel-body">
						<div style="float: left; width: 10%;">
							<img src="<c:url value='/images/icon/icon_viewer_05.gif' />" alt="마이크로소프트 엑셀 뷰어(EXCEL)" />
						</div>
						<div style="float: left; width: 80%;">
							마이크로소프트 엑셀 뷰어(EXCEL)<br/><br/>
							MS-Excel 97/2000문서를 보실 수 있는 프로그램입니다.
						</div>
						<div style="float: left; width: 10%;">
							<a href="http://www.microsoft.com/ko-kr/download/details.aspx?id=10" target="_blank" title="새창 엑셀뷰어 다운로드">
								<img src="<c:url value='/images/icon/fileDownBtn.png' />" alt="엑셀뷰어 다운로드">
							</a>
						</div>
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

