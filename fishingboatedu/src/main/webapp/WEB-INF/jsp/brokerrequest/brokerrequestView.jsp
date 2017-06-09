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
					<h3><i class="glyphicon glyphicon-check"></i>&nbsp;4. 중개업 신청</h3>
					<hr />
					<p>
						<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 중개업신청을 위하여는 추가 항목을 입력 하셔야 합니다.
						<br /><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 신청이 접수되면 담당자 승인 후 "어선중개업등록증" 발급이 가능 합니다.
						<br /><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 담당자 승인 후 결과는 전자우편으로 안내해 드립니다.
					</p>
					
					<!-- check.check 교육이수증 발급 후 진행 할 수 있다. -->
					<a class="btn btn-danger" style="width: 50%;" href="#" >신청하기</a>
					
				</div>
			</div>
			<hr>
			<!-- check.check 교육이수증이 발급되지 않았을 때 -->
			<div class="alert alert-danger fade in">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<p><strong>알림!</strong> 교육 이수증 발급을 받으신 후 진행 가능 합니다.</p>
			</div>
			
		</div>
		<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
	
	</div>
	
</body>
</html>
