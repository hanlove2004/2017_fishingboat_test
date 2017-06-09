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
	
			<h2>어선검사정보 상세</h2>
			<br />
			<h4>* 어선검사정보</h4>
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="30%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">어선번호</th>
						<td><c:out value="${infoSearchResult.TITLE }" /></td>
						<th scope="row">어선명</th>
						<td><c:out value="${infoSearchResult.SHIP_NAME }" /></td>
					</tr>
					<tr>
						<th scope="row">등록길이</th>
						<td><c:out value="${infoSearchResult.REGISTERED_LEN }" /></td>
						<th scope="row">등록너비</th>
						<td><c:out value="${infoSearchResult.REGISTERED_BR }" /></td>
					</tr>
					<tr>
						<th scope="row">등록깊이</th>
						<td><c:out value="${infoSearchResult.REGISTERED_DTH }" /></td>
						<th scope="row">최종검사 종류</th>
						<td><c:out value="${infoSearchResult.GUBUNVALUE }" /></td>
					</tr>
					<tr>
						<th scope="row">최종검사 지부</th>
						<td><c:out value="${infoSearchResult.OFFICE_KOR_NM }" /></td>
						<th scope="row">주기관 출력(마력)</th>
						<td><c:out value="${infoSearchResult.MCE_PS }" /> hp</td>
					</tr>
					<tr>
						<th scope="row">조선지</th>
						<td><c:out value="${infoSearchResult.SHIP_BUILT }" /></td>
						<th scope="row">조선소</th>
						<td><c:out value="${infoSearchResult.SHIP_BUILDER }" /></td>
					</tr>
					<tr>
						<th scope="row">검사일자</th>
						<td><c:out value="${infoSearchResult.SURVEY_T_DATE }" /></td>
						<th scope="row">점검지</th>
						<td><c:out value="${infoSearchResult.SURVEY_LOC }" /></td>
					</tr>
					<tr>
						<th scope="row">항해상의 조건</th>
						<td colspan="3"><c:out value="${infoSearchResult.REMARK }" /></td>
					</tr>
				</tbody>
			</table>
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
				fn_openInfoSearchList();
			});
		});
		
		function fn_openInfoSearchList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/info/openInfoSearchList.do' />");
			comSubmit.submit();
		}
		
	</script>
</body>
</html>

