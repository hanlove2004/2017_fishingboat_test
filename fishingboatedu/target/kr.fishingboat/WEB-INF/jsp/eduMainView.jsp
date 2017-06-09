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
			<div class="jumbotron" style="background-image: url('/file/images/fishingboatedu-main.jpg'); background-size: 100% 100%; border: 3px outset; text-shadow: black 0px 0px 4px; color: white; margin-bottom: 10px;">
				<div class="text-center">
					<h1><span class="glyphicon glyphicon-education" aria-hidden="true"></span> 해양수산부<br /> 어선중개업 교육지원 시스템</h1>
					<p>해양수산부 어선중개업 교육지원 시스템을 통하여 온라인 상에서 <br />어선중개업 신청, 수료증 출력, 어선중개업 신청 등의 과정을 한번에 이용 할 수 있도록 지원하는 시스템 입니다.</p>
					<a class="btn btn-lg btn-danger" href="<c:url value='/application/openApplicationView.do' />">교육신청바로가기&nbsp;<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
				</div>
			</div>
			<hr style="margin: 10px;">

			<div class="row">
				<div class="col-sm-4">
					<div class="thumbnail" style="padding: 20px;">
						<h3><strong>교육신청</strong></h3>
						<p style="min-height: 90px;">어선중개업 기본정보 등록하여 해당 정보를 기반으로 어선중개업 신청에 사용됩니다. 교육 신청시 발급해 드리는 접수번호와 입력하신 비밀번호를 기억하셔야 시스템 이용이 원할합니다.</p>
						<a href="<c:url value='/application/openApplicationView.do' />" class="btn btn-success btn-block">바로가기&nbsp;<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail" style="padding: 20px;">
						<h3><strong>중개업 신청</strong></h3>
						<p style="min-height: 90px;">교육을 이수하신 후 중개업 신청을 할 수 있습니다.<br />접수번호와 비밀번호가 필요 합니다. <br />신청시 발급된 접수번호로 로그인하시고 신청하세요.</p>
						<a href="javascript:alert('개발예정항목입니다.');" class="btn btn-success btn-block">바로가기&nbsp;<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
						<%-- <a href="<c:url value='/brokerrequest/openBrokerRequestView.do' />" class="btn btn-success btn-block">바로가기&nbsp;<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a> --%>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail" style="padding: 20px;">
						<h3><strong>어선중개업 등록증 출력</strong></h3>
						<p style="min-height: 90px;">중개업신청이 완료되었을 경우, 등록증을 출력할 수 있습니다.</p>
						<a href="javascript:alert('개발예정항목입니다.');" class="btn btn-success btn-block">바로가기&nbsp;<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
						<%-- <a href="<c:url value='/registration/openRegistrationView.do' />" class="btn btn-success btn-block">바로가기&nbsp;<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a> --%>
					</div>
				</div>
			</div>
			<%-- <div class="row" style="padding: 25px;">
				<div class="col-md-3">
					<div class="thumbnail" style="margin: 0;">
						<a href="https://www.mof.go.kr" target="_blank"> 
							<img src="<c:url value='/images/banner/bn01.png' />" alt="해양수산부" style="width: 100%">
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail" style="margin: 0;">
						<a href="https://www.kst.or.kr" target="_blank"> 
							<img src="<c:url value='/images/banner/bn02.png' />" alt="선박안전기술공단" style="width: 100%">
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail" style="margin: 0;">
						<a href="https://www.nfrdi.re.kr" target="_blank"> 
							<img src="<c:url value='/images/banner/bn03.png' />" alt="국립수산과학원" style="width: 100%">
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail" style="margin: 0;">
						<a href="http://www.suhyup.co.kr" target="_blank"> 
							<img src="<c:url value='/images/banner/bn04.png' />" alt="수협중앙회" style="width: 100%">
						</a>
					</div>
				</div>
			</div> --%>
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

