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
	
			<h2>매물현황</h2>
			<br />
			<c:if test="${param.brotype eq 'sell' }">
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
			</c:if>
			<c:if test="${param.brotype eq 'buy' }">
				<h4>* 매수인 현황</h4>
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="20%" />
						<col width="30%" />
						<col width="20%" />
						<col width="30%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">매수인</th>
							<td><c:out value="${buyResult.NAM }" /></td>
							<th scope="row">작성일</th>
							<td><c:out value="${buyResult.REG_DAT }" /></td>
						</tr>
						<tr>
							<th scope="row">어업의 종류</th>
							<td><c:out value="${buyResult.FS_MET_CODE }" /></td>
							<th scope="row">희망가격</th>
							<td><c:out value="${buyResult.HOPE_PRICE }" /> 원</td>
						</tr>
						<tr>
							<th scope="row">어선 소재지</th>
							<td><c:out value="${buyResult.REL_TRANS_CGG_CODE }" /></td>
							<th scope="row">총톤수</th>
							<td><c:out value="${buyResult.SHIP_TOT_TONS }" /> 톤</td>
						</tr>
					</tbody>
				</table>
			</c:if>
			
			<div align="right" style="text-align: center; height: 50px;">
				<a href="#this" class="btn" id="list">목록</a>
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
				fn_openDealList();
			});
		});
		
		function fn_openDealList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deal/openDealList.do' />");
			comSubmit.submit();
		}
		
		function fn_clipReport() {
			alert("개발 예정 항목입니다.");
			return;
		}
		
	</script>
</body>
</html>

