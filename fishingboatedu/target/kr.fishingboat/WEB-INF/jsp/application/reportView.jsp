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
					<h3><i class="glyphicon glyphicon-file"></i>&nbsp;교육접수증 출력</h3>
					<hr />
					<p>
						<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 교육접수증 출력 버튼을 눌러주세요.<br/>
						<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 접수번호는 로그인 시 사용되오니, 기억해두시기 바랍니다.
						<br /><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 발급된 접수번호와 비밀번호로 로그인하시면 출력이 가능합니다.
					</p>
					
					<!-- check.check 접수가 완료되고 나서 바로 또는 임시아이디와 비번으로 로그인 했을 때 보여준다. -->
					<c:if test="${applicationDetail != '' and applicationDetail != null}">
						<div class="btn btn-info" id="reportPrint" style="width: 50%">교육접수증출력</div>
					</c:if>
					
				</div>
			</div>
			<hr>
			<!-- check.check 신청서 항목 나올 장소! -->
			<c:choose>
				<c:when test="${applicationDetail != '' and applicationDetail != null}">
				<div class="row">
					<div class="col-md-12">
						<h3 style="padding-left: 30px;"><span class="glyphicon glyphicon-education"></span>&nbsp;&nbsp;어선중개업자 교육 접수증</h3>
						<hr />
						<form name="reportFrm" id="reportFrm" method="post" action="<c:url value='/application/applicationReport.do' />" target="popup_window">
						<!-- check.check report 출력 시 필요한 항목 전송할 수 있도록 값처리 필요 -->
						<input type="hidden" name="EDU_NAM" value="<c:out value="${applicationDetail.EDU_NAM }" />" />
						<input type="hidden" name="EDU_NUM" value="<c:out value="${applicationDetail.EDU_NUM }" />" />
						<input type="hidden" name="EDU_BIRTH" value="<c:out value="${applicationDetail.EDU_BIRTH }" />" />
						<input type="hidden" name="EDU_CODE_NAM" value="<c:out value="${applicationDetail.EDU_YEAR }" />년  <c:out value="${applicationDetail.EDU_CHASU }" />차  <c:out value="${applicationDetail.EDU_CODE_NAM }" />" />
						<input type="hidden" name="EDU_ADDR" value="(<c:out value="${applicationDetail.EDU_POST_CD }" />) <c:out value="${applicationDetail.EDU_ADDR1 }" /> <c:out value="${applicationDetail.EDU_ADDR2 }" />" />
						<input type="hidden" name="EDU_PHONE" value="<c:out value="${applicationDetail.EDU_PHONE }" />" />
						<input type="hidden" name="EDU_EMAIL" value="<c:out value="${applicationDetail.EDU_EMAIL }" />" />
						<input type="hidden" name="EDU_DATE" value="<c:out value="${applicationDetail.EDU_START_DATE }" /> ~ <c:out value="${applicationDetail.EDU_END_DATE }" />" />
						<input type="hidden" name="EDU_LOC" value="<c:out value="${applicationDetail.EDU_LOC }" />" />
						<input type="hidden" name="EDU_IMG_SAV_NAM" value="<c:out value="${applicationDetail.EDU_IMG_SAV_NAM }" />" />
						<table class="table table-striped table-bordered" style="font-size: 15px;">
							<colgroup>
								<col width="14%" />
								<col width="15%" />
								<col width="28%" />
								<col width="15%" />
								<col width="28%" />
							</colgroup>
							<tbody>
								<tr>
									<td rowspan="3" align="center">
										<img alt="반명함사진" src="/file/education/${applicationDetail.EDU_IMG_SAV_NAM }" style="height: 4cm;"/>
									</td>
									<td>성명 : </td>
									<td><c:out value="${applicationDetail.EDU_NAM }" /></td>
									<td>접수번호 : </td>
									<td><c:out value="${applicationDetail.EDU_NUM }" /></td>
								</tr>
								<tr>
									<td>생년월일 : </td>
									<td><c:out value="${applicationDetail.EDU_BIRTH }" /></td>
									<td>과정 : </td>
									<td>
										<c:out value="${applicationDetail.EDU_YEAR }" />년&nbsp;&nbsp;<c:out value="${applicationDetail.EDU_CHASU }" />차&nbsp;&nbsp;<c:out value="${applicationDetail.EDU_CODE_NAM }" />
									</td>
								</tr>
								<tr>
									<td>주소 : </td>
									<td colspan="3">
										<p>(<c:out value="${applicationDetail.EDU_POST_CD }" />) <c:out value="${applicationDetail.EDU_ADDR1 }" /> <c:out value="${applicationDetail.EDU_ADDR2 }" /></p>
										<p style="text-align: right;">(전화번호 : <c:out value="${applicationDetail.EDU_PHONE }" />, 전자우편 : <c:out value="${applicationDetail.EDU_EMAIL }" />)</p>
									</td>
								</tr>
								<tr>
									<td colspan="5"></td>
								</tr>
								<tr>
									<th style="text-align:center;">교육일정</th>
									<td>교육일시 : </td>
									<td><c:out value="${applicationDetail.EDU_START_DATE }" /> ~ <c:out value="${applicationDetail.EDU_END_DATE }" /></td>
									<td>교육장소 : </td>
									<td><c:out value="${applicationDetail.EDU_LOC }" /></td>
								</tr>
							</tbody>
						</table>
						</form>
					</div>
				</div>
				</c:when>
				<c:otherwise>
					<!-- check.check 교육신청 정보가 없을 때 보여준다.(로그인 정보 없을 때, 입력한 값이 없을 때) -->
					<div class="alert alert-danger fade in">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<p><strong>알림!</strong> 출력할 접수증이 없습니다.</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
	
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			// 접수증출력 버튼
			$('#reportPrint').click(function() {
				window.open("", "popup_window", "width=1200, height=900, scrollbars=no");
				$("#reportFrm").submit();
			});
		});
	</script>
</body>
</html>
