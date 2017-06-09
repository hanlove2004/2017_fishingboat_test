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
			<br />
			<h4>* 거래현황</h4>
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="100%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">
							<c:if test="${sellResult.STATUS_CODE eq '001' }">
								<img src="<c:url value='/images/icon/11.gif' />" />
							</c:if>
							<c:if test="${sellResult.STATUS_CODE eq '002' }">
								<img src="<c:url value='/images/icon/22.gif' />" />
							</c:if>
							<c:if test="${sellResult.STATUS_CODE eq '003' }">
								<img src="<c:url value='/images/icon/33.gif' />" />
							</c:if>
							<c:if test="${sellResult.STATUS_CODE eq '004' }">
								<img src="<c:url value='/images/icon/44.gif' />" />
							</c:if>
							<c:if test="${sellResult.STATUS_CODE eq '005' }">
								<img src="<c:url value='/images/icon/55.gif' />" />
							</c:if>
							<c:if test="${sellResult.STATUS_CODE eq '006' }">
								<img src="<c:url value='/images/icon/66.gif' />" />
							</c:if>
							<c:if test="${sellResult.STATUS_CODE eq '007' }">
								<img src="<c:url value='/images/icon/77.gif' />" />
							</c:if>
						</th>
					</tr>
				</tbody>
			</table>
			<h4>* 매도인 현황</h4>
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="30%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">매도인</th>
						<td><c:out value="${sellResult.NAM }" /></td>
						<th scope="row">작성일</th>
						<td><c:out value="${sellResult.REG_DAT }" /></td>
					</tr>
					<tr>
						<th scope="row">어업의 종류</th>
						<td><c:out value="${sellResult.CODE_CTN }" /></td>
						<th scope="row">희망가격</th>
						<td><c:out value="${sellResult.HOPE_PRICE }" /> 원</td>
					</tr>
					<tr>
						<th scope="row">어선 소재지</th>
						<td><c:out value="${sellResult.HANG_NAME }" /></td>
						<th scope="row">총톤수</th>
						<td><c:out value="${sellResult.TON }" /> 톤</td>
					</tr>
				</tbody>
			</table>
			<h4>* 어선 정보</h4>
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="30%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">어선명</th>
						<td><c:out value="${sellResult.SHP_NM }" /></td>
						<th scope="row">어선번호</th>
						<td><c:out value="${sellResult.TITLE }" /></td>
					</tr>
					<tr>
						<th scope="row">이력확인서</th>
						<td colspan="3"><a href="javascript:fn_clipReport();" class="btn btn-success">이력확인서</a></td>
					</tr>
				</tbody>
			</table>
			<h4>* 어선 사진</h4>
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="100%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">
							<c:choose>
								<c:when test="${fn:length(sellImgList) > 0 }">
									<c:forEach items="${sellImgList }" var="row" varStatus="status">
										<img alt="어선사진" src="<c:url value='/file/sellpic/${row.SAV_FLE_NAM }' />" style="width:200px; height:200px;" />&nbsp;&nbsp;
									</c:forEach>
								</c:when>
								<c:otherwise>
									<img alt="파일없음" src="<c:url value='/images/No-Image-Basic.gif' />" style="width:200px; height:200px;" />
								</c:otherwise>
							</c:choose>
						</th>
					</tr>
				</tbody>
			</table>
			<c:if test="${sellResult.STATUS_CODE eq '005'}">
				<c:set var="frmVal" value="0" />
				<c:forEach items="${brokeYn }" var="row" varStatus="status">
					<c:choose>
						<c:when test="${not empty row.BROKE_ID }">
							<form id="formrate${frmVal }" name="formrate${frmVal }" method="post">
								<h4>* 중개인 평가</h4>
								<table class="table table-striped table-bordered table-hover">
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">중개인 평가 (ID : <c:out value="${row.BROKE_ID }" />)</th>
											<td id="satisStatus${frmVal }">
												<%-- <label class="radio-inline"><input type="radio" name="rate" value="5" checked="checked">5점</label>
												<label class="radio-inline"><input type="radio" name="rate" value="4">4점</label>
												<label class="radio-inline"><input type="radio" name="rate" value="3">3점</label>
												<label class="radio-inline"><input type="radio" name="rate" value="2">2점</label>
												<label class="radio-inline"><input type="radio" name="rate" value="1">1점</label>
												&nbsp;&nbsp;&nbsp;
												<a href="javascript:fn_evalBroker(${frmVal });" class="btn btn-success btn-xs">평가하기</a>
												<input type="hidden" name="broid" value="<c:out value='${row.BROKE_ID }' />" >
												<input type="hidden" name="usrid" value="<c:out value='${mberInfo.USR_ID }' />" >
												<input type="hidden" name="seq" value="<c:out value='${sellResult.SEQ }' />" > --%>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
							
							<script type="text/javascript">
								fn_selectSatisfaction();
								
								function fn_selectSatisfaction() {
									$.ajax({
										url : "<c:url value='/deal/selectSatisfaction.do' />",
										type : "POST",
										data : {
											"usrid" : "${mberInfo.USR_ID}",
											"seq" : "${sellResult.SEQ }",
											"broid" : "${row.BROKE_ID}"
										},
										async : false,
										success : function(data, status) {
											var html = "";
											if (data.safisResult != null || data.safisResult != undefined) {
												html += data.safisResult.SATISFACTION + " 점";
											} else {
												html += '<label class="radio-inline"><input type="radio" name="rate" value="5" checked="checked">5점</label>'
													+ '<label class="radio-inline"><input type="radio" name="rate" value="4">4점</label>'
													+ '<label class="radio-inline"><input type="radio" name="rate" value="3">3점</label>'
													+ '<label class="radio-inline"><input type="radio" name="rate" value="2">2점</label>'
													+ '<label class="radio-inline"><input type="radio" name="rate" value="1">1점</label>&nbsp;&nbsp;&nbsp;'
													+ '<a href="javascript:fn_evalBroker(${frmVal });" class="btn btn-success btn-xs">평가하기</a>'
													+ '<input type="hidden" name="broid" value="${row.BROKE_ID }" >'
													+ '<input type="hidden" name="usrid" value="${mberInfo.USR_ID }" >'
													+ '<input type="hidden" name="seq" value="${sellResult.SEQ }" >';
											}
											$("#satisStatus${frmVal }").append(html);
										},
										error: function(e){
											alert(e.responseText);
										}
									});
								}
							</script>
							
							<c:set var="frmVal" value="${frmVal + 1}" />
							
							<%-- <c:if test="${empty brokeSatis }">
							<form id="formrate${frmVal }" name="formrate${frmVal }" method="post">
								<h4>* 중개인 평가</h4>
								<table class="table table-striped table-bordered table-hover">
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">중개인 평가 (ID : <c:out value="${row.BROKE_ID }" />)</th>
											<td>
												<label class="radio-inline"><input type="radio" name="rate" value="5" checked="checked">5점</label>
												<label class="radio-inline"><input type="radio" name="rate" value="4">4점</label>
												<label class="radio-inline"><input type="radio" name="rate" value="3">3점</label>
												<label class="radio-inline"><input type="radio" name="rate" value="2">2점</label>
												<label class="radio-inline"><input type="radio" name="rate" value="1">1점</label>
												&nbsp;&nbsp;&nbsp;
												<a href="javascript:fn_evalBroker(${frmVal });" class="btn btn-success btn-xs">평가하기</a>
												<input type="hidden" name="broid" value="<c:out value='${row.BROKE_ID }' />" >
												<input type="hidden" name="usrid" value="<c:out value='${mberInfo.USR_ID }' />" >
												<input type="hidden" name="seq" value="<c:out value='${sellResult.SEQ }' />" >
											</td>
										</tr>
									</tbody>
								</table>
							</form>
							<c:set var="frmVal" value="${frmVal + 1}" />
							</c:if>
							<c:forEach items="${brokeSatis }" var="row1" varStatus="status">
							<h4>* 중개인 평가</h4>
							<form id="formrate${frmVal }" name="formrate${frmVal }" method="post">
							<table class="table table-striped table-bordered table-hover">
								<colgroup>
									<col width="20%" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">중개인 평가 (ID : <c:out value="${row.BROKE_ID }" />)</th>
										<td>
											<c:choose>
												<c:when test="${empty row1.DEALSEQ }">
													<label class="radio-inline"><input type="radio" name="rate" value="5" checked="checked">5점</label>
													<label class="radio-inline"><input type="radio" name="rate" value="4">4점</label>
													<label class="radio-inline"><input type="radio" name="rate" value="3">3점</label>
													<label class="radio-inline"><input type="radio" name="rate" value="2">2점</label>
													<label class="radio-inline"><input type="radio" name="rate" value="1">1점</label>
													&nbsp;&nbsp;&nbsp;
													<a href="javascript:fn_evalBroker(${frmVal });" class="btn btn-success btn-xs">평가하기</a>
													<input type="hidden" name="broid" value="<c:out value='${row.BROKE_ID }' />" >
													<input type="hidden" name="usrid" value="<c:out value='${mberInfo.USR_ID }' />" >
													<input type="hidden" name="seq" value="<c:out value='${sellResult.SEQ }' />" >
												</c:when>
												<c:otherwise>
													<c:out value="${row1.SATISFACTION }" /> 점
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</tbody>
							</table>
							</form>
							<c:set var="frmVal" value="${frmVal + 1}" />
							</c:forEach> --%>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>
			<input type="hidden" id="usrid" name="usrid" value="<c:out value='${mberInfo.USR_ID }' />" >
			<input type="hidden" id="seq" name="seq" value="<c:out value='${sellResult.SEQ }' />" >
			<div align="right" style="text-align: center; height: 50px;">
				<a href="#this" class="btn" id="list">목록</a>&nbsp;&nbsp;
				<a href="#this" class="btn" id="update">수정</a>&nbsp;&nbsp;
				<a href="#this" class="btn" id="delete">삭제</a>
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
			
			$("#update").on("click", function(e) { // 수정 버튼
				e.preventDefault();
				fn_openSellUpdate();
			});
			
			$("#delete").on("click", function(e) { // 삭제 버튼
				e.preventDefault();
				fn_deleteSell();
			});
		});
		
		function fn_openSellList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deal/openSellList.do' />");
			comSubmit.submit();
		}
		
		function fn_clipReport() {
			alert("개발 예정 항목입니다.");
			return;
		}
		
		function fn_evalBroker(frmVal) {
			$.ajax({
				url : "<c:url value='/deal/insertBrokerSatis.do' />",
				type : "POST",
				data : $("#formrate"+frmVal).serialize(),
				async : false,
				success : function(data, status) {
					if (data != null || data != undefined) {
						alert("평가 등록이 완료되었습니다.");
						location.reload();
					} else {
						alert("정상적으로 처리되지 않았습니다.");
					}
				},
				error: function(e){
					alert(e.responseText);
				}
			});
		}
		
		function fn_evalBrokerCallback() {
			alert("평가 등록이 완료되었습니다.");
			return;
		}
		
		function fn_openSellUpdate() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deal/openSellUpdate.do' />");
			comSubmit.addParam("seq", $("#seq").val());
			comSubmit.submit();
		}
		
		function fn_deleteSell() {
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					url : "<c:url value='/deal/deleteSell.do' />",
					type : "POST",
					data : {
						seq : $("#seq").val(),
						usrid : $("#usrid").val()
					},
					async : false,
					success : function(data, status) {
						if (data != null || data != undefined) {
							alert("삭제 되었습니다.");
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
		}
		
	</script>
</body>
</html>

