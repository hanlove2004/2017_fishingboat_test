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

			<h2>어선매도</h2>
			<h4> * 중개인 상세</h4>
			<form id="frm" name="frm">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<colgroup>
							<col width="20%" />
							<col width="30%" />
							<col width="20%" />
							<col width="30%" />
						</colgroup>
						<tbody>
							<tr>
								<td>중개인</td>
								<td><c:out value="${brokerResult.USR_ID }" /></td>
								<td>성명</td>
								<td><c:out value="${brokerResult.NAM }" /></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><c:out value="${brokerResult.PHONE }" /></td>
								<td>이메일</td>
								<td><c:out value="${brokerResult.USR_EMAIL }" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				<input type="hidden" name="usrid" value="<c:out value='${mberInfo.USR_ID }' />" />
				<input type="hidden" name="broid" value="<c:out value='${brokerResult.USR_ID }' />" />
				<input type="hidden" name="broseq" value="<c:out value='${brokerResult.BROKE_SEQ }' />" />
				<input type="hidden" name="seq" value="<c:out value='${brokerResult.BOARD_SEQ }' />" />
				<input type="hidden" name="chk" value="Y" />
				<input type="hidden" name="brotype" value="sell" />
			</form>
			<div align="right" style="text-align: center; height: 50px;">
				<a href="#this" class="btn" id="list">목록</a>
				<c:choose>
					<c:when test="${brokerResult.BROKE_CHK eq 'Y' }">
						<a href="#this" class="btn" id="chkno">선정취소</a>
					</c:when>
					<c:when test="${brokerResult.BROKE_CHK eq 'N' }">
						<a href="#this" class="btn" id="chk">선정하기</a>
					</c:when>
					<c:otherwise>
						<a href="#this" class="btn" id="chk">선정하기</a>
					</c:otherwise>
				</c:choose>
			</div>
			
			<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		</div>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
		
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	
	<script type="text/javascript">
		$(document).ready(function() {
			fn_pageLog();
			
			$("#list").on("click", function(e) { // 목록 버튼
				e.preventDefault();
				fn_openSellList();
			});
			
			$("#chk").on("click", function(e) { // 선정하기 버튼
				e.preventDefault();
				fn_openSellBrokerChk();
			});
			
			$("#chkno").on("click", function(e) { // 선정취소 버튼
				e.preventDefault();
				fn_openSellBrokerChkno();
			});
		});
		
		function fn_openSellList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deal/openSellList.do' />");
			comSubmit.submit();
		}
		
		function fn_openSellBrokerChk() {
			$.ajax({
				url : "<c:url value='/deal/updateBrokerChk.do' />",
				type : "POST",
				data : $("#frm").serialize(),
				async : false,
				success : function(data, status) {
					if (data != null || data != undefined) {
						// sms 발송 설정
						fn_insertSellBrokerSms();
					} else {
						alert("정상적으로 처리되지 않았습니다.");
					}
				},
				error: function(e){
					alert(e.responseText);
				}
			});
		}
		
		function fn_insertSellBrokerSms() {
			$.ajax({
				url : "<c:url value='/deal/insertSellBrokerSms.do' />",
				type : "POST",
				data : $("#frm").serialize(),
				async : false,
				success : function(data, status) {
					if (data != null || data != undefined) {
						alert("선정이 완료되었습니다. 목록 페이지로 이동합니다.");
						fn_openSellList();
					} else {
						alert("정상적으로 처리되지 않았습니다.");
					}
				},
				error: function(e){
					alert(e.responseText);
				}
			});
		}
		
		function fn_openSellBrokerChkno() {
			$.ajax({
				url : "<c:url value='/deal/updateBrokerChkno.do' />",
				type : "POST",
				data : $("#frm").serialize(),
				async : false,
				success : function(responseData, textStatus, jqXHR) {
					console.log(responseData);
					console.log(textStatus);
					console.log(jqXHR.status);
					if (textStatus == "success") {
						alert("선정이 취소되었습니다. 목록 페이지로 이동합니다.");
						fn_openSellList();
					} else {
						alert("정상적으로 처리되지 않았습니다.");
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

