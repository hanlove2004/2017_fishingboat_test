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
			<h2>이용안내</h2>
			<p>홈페이지 이용에 대한 안내를 확인하세요.</p>
			<div class="panel-group">
				<div class="panel panel-default">
					<div class="panel-heading">메뉴안내</div>
					<div class="panel-body">
						<p>* 어선매도			:		어선매도</p>
						<p>* 어선매수			:		어선매수</p>
						<p>* 어선관련정보		:		어선기본정보, 어선검사정보, 기타 어선 관련 정보 등</p>
						<p>* 민원안내			:		법령 및 제도, 어선거래절차 등</p>
						<p>* 커뮤니티			:		공지사항, 자료실 등</p>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">브라우저 및 컴퓨터 환경안내</div>
					<div class="panel-body">
						<p>* 이용가능한 브라우져 종류	:		익스플로러 8.0 이상, 파이어폭스 1.5 이상, 오페라 7 이상, 크롬, 사파리</p>
						<p>* 화면 해상도			:		1024 * 768에 맞춰 작업한 화면입니다.</p>
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
		
		function fn_selectLogin(){
			$.ajax({
				url : "<c:url value='/member/selectLogin.do' />",
				type : "POST",
				data : $("#loginform").serialize(),
				async : false,
				success : function(data, status) {
					console.log(data.result.RESULT);
					if (data.result == "success") {
						//페이지 이동
						alert("메인화면으로 이동합니다.");
						//location.href="fishingboat/openBoardList.do";
						//$("#commonForm").attr('action', '<c:url value="/openMainView.do" />');
						//$("#commonForm").submit();
						
						var url = "<c:url value='/main/openMainView.do' />"; 
						$(location).attr('href',url);
					} else if(data.result == "fail") {
						alert("아이디 또는 비밀번호가 맞지 않습니다.");
					}
				},
				error: function(e){
					alert(e.responseText);
				}
			});
		}
	</script>
</body>
</html>

