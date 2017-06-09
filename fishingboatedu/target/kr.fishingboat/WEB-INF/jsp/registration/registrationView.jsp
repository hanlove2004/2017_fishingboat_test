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
					<h3><i class="glyphicon glyphicon-file"></i>&nbsp;5. 어선중개업 등록증발급</h3>
					<hr />
					<p>
						<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 등록증발급을 위해서 아래 항목을 입력해주세요.
						<!-- <br /><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 
						<br /><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>  -->
					</p>
					
					<!-- check.check 어선중개업 신청 후 승인이 완료되었을 때 진행 할 수 있다. -->
					<a class="btn btn-danger" style="width: 50%;" href="#" >발급하기</a>
					
				</div>
			</div>
			<hr>
			<!-- check.check 신청된 내용이 없을 경우 또는 승인이 완료되지 않은 경우 -->
			<div class="alert alert-danger fade in">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<p><strong>알림!</strong> 발급할 등록증이 없습니다.</p>
			</div>
			
		</div>
		<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
	
	</div>
	
</body>
</html>
