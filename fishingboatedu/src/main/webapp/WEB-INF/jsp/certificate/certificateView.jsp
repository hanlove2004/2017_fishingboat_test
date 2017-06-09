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
					<h3><i class="glyphicon glyphicon-file"></i>&nbsp;3. 교육이수증 발급</h3>
					<hr />
					<p>
						<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 인증서 발급을 버튼을 클릭해주세요.
						<br /><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 합격하신 분은 언제든지 출력이 가능 합니다.
						<!-- <br /><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 본인 확인을 위해 임시아이디와 비밀번호가 필요하오니 준비해주세요. -->
					</p>
					
					<!-- check.check 평가결과가 60점 이상일 때 보여준다. -->
					<a class="btn btn-danger" style="width: 50%;" href="#" >이수증발급</a>
					
				</div>
			</div>
			<hr>
			<!-- check.check 발급할 인증서가 없을 때 (평가결과가 60점 미만일 때) 보여준다. -->
			<div class="alert alert-danger fade in">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<p><strong>알림!</strong> 발급할 인증서가 없습니다.</p>
			</div>
			
		</div>
		<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
	
	</div>
	
</body>
</html>
