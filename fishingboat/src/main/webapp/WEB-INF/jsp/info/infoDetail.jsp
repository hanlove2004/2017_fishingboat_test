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
	
			<h2>어선기본정보 상세</h2>
			<br />
			<h4>* 어선기본정보</h4>
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
						<td><c:out value="${infoResult.TITLE }" /></td>
						<th scope="row">어선명</th>
						<td><c:out value="${infoResult.SHP_NM }" /></td>
					</tr>
					<tr>
						<th scope="row">어선 소재지</th>
						<td><c:out value="${infoResult.HANG_NAME }" /></td>
						<th scope="row">어업의 종류</th>
						<td><c:out value="${infoResult.CODE_CTN }" /></td>
					</tr>
					<tr>
						<th scope="row">주기관 종류</th>
						<td><c:out value="${infoResult.CODE_CTN_3 }" /></td>
						<th scope="row">주기관 출력(마력)</th>
						<td><c:out value="${infoResult.ENGINE_PS }" /> hp</td>
					</tr>
					<tr>
						<th scope="row">엔진kw</th>
						<td><c:out value="${infoResult.ENGINE_KW }" /> kw</td>
						<th scope="row">주기관의 수</th>
						<td><c:out value="${infoResult.ENGINE_NUM }" /> 개</td>
					</tr>
					<tr>
						<th scope="row">등록길이</th>
						<td><c:out value="${infoResult.LEN }" /> m</td>
						<th scope="row">등록너비</th>
						<td><c:out value="${infoResult.BRE }" /> m</td>
					</tr>
					<tr>
						<th scope="row">등록깊이</th>
						<td><c:out value="${infoResult.DPH }" /> m</td>
						<th scope="row">총톤수</th>
						<td><c:out value="${infoResult.TON }" /> 톤</td>
					</tr>
				</tbody>
			</table>
			<h4>* 공유자 정보</h4>
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="30%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">성명</th>
						<td><c:out value="${infoResult.NAME }" /></td>
						<th scope="row">주소</th>
						<td><c:out value="${infoResult.JUSO }" /></td>
					</tr>
					<tr>
						<th scope="row">지분</th>
						<td><c:out value="${infoResult.JIBUN }" /></td>
						<th scope="row">비고</th>
						<td><c:out value="${infoResult.BIGO }" /></td>
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
				fn_openInfoList();
			});
		});
		
		function fn_openInfoList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/info/openInfoList.do' />");
			comSubmit.submit();
		}
		
	</script>
</body>
</html>

