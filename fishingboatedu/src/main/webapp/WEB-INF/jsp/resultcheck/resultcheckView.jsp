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
		
		<div id="content" style="min-height: 450px;">
			<div class="row">
				<div class="col-md-12">
					<h3><i class="glyphicon glyphicon-ok"></i>&nbsp;2. 결과확인</h3>
					<hr />
					<p>
						<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 교육평가에 대한 결과를 안내해드립니다.
						<br /><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 절대평가 방식으로 60점 이상 일 경우 이수증 발급이 가능합니다.
					</p>
					
					<!-- check.check 평가결과가 60점 이상일 때 보여준다. -->
					<a class="btn btn-danger" style="width: 50%;" href="<c:url value='/certificate/openCertificateView.do' />" >이수증발급으로 이동</a>
					
				</div>
			</div>
			<hr>
			<!-- check.check 결과를 조회해서 보여준다. -->
			<div class="alert alert-danger fade in">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<p><strong>알림!</strong> 회원님의 점수는 <b>40점</b> 입니다. 불합격 하셨습니다.</p>
			</div>
			<div class="alert alert-success fade in">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<p><strong>알림!</strong> 회원님의 점수는 <b>80점</b> 입니다. 합격하셔서, 이수증발급이 가능합니다.</p>
			</div>
			
		</div>
		<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
	
	</div>
	
</body>
</html>
