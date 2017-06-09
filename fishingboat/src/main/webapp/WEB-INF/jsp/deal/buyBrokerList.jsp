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

			<h2>어선매수</h2>
			<h4> * 중개인 목록</h4>
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="15%" />
						<col width="*" />
						<col width="20%" />
						<col width="15%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">중개인</th>
							<th scope="col">ID</th>
							<th scope="col">E-mail</th>
							<th scope="col">전화번호</th>
							<th scope="col">선정유무</th>
							<th scope="col">상세보기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="row" varStatus="status">
							<tr>
								<td><c:out value="${row.NAM }" /></td>
								<td><c:out value="${row.BROKE_ID }" /></td>
								<td><c:out value="${row.USR_EMAIL }" /></td>
								<td><c:out value="${row.PHONE }" /></td>
								<td>
									<c:choose>
										<c:when test="${row.BROKE_CHK eq 'Y'}">선정</c:when>
										<c:otherwise>미선정</c:otherwise>
									</c:choose>
								</td>
								<td>
									<a href="#this" name="title" class="btn btn-success btn-xs">보기</a>
									<input type="hidden" id="broid" value="<c:out value="${row.BROKE_ID }" />" />
									<input type="hidden" id="seq" value="<c:out value="${row.SEQ }" />" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
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
			
			$("a[name='title']").on("click", function(e) { //제목
				e.preventDefault();
				fn_openBuyBrokerDetail($(this));
			});
			
			$("#list").on("click", function(e) { // 목록 버튼
				e.preventDefault();
				fn_openBuyList();
			});
		});
		
		function fn_openBuyBrokerDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deal/openBuyBrokerDetail.do' />");
			comSubmit.addParam("broid", obj.parent().find("#broid").val());
			comSubmit.addParam("seq", obj.parent().find("#seq").val());
			comSubmit.submit();
		}
		
		function fn_openBuyList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deal/openBuyList.do' />");
			comSubmit.submit();
		}
		
	</script>
</body>
</html>

