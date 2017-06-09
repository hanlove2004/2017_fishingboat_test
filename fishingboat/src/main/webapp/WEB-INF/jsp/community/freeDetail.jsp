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
	
			<h2>자유게시판</h2>
			<form id="frm" name="frm">
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="15%" />
						<col width="*" />
						<col width="15%" />
						<col width="*" />
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td colspan="5"><c:out value="${freeDetail.TITLE }" /></td>
						</tr>
						<tr>
							<th scope="row">게시자</th>
							<td><c:out value="${freeDetail.NAM }" /></td>
							<th scope="row">작성일</th>
							<td><c:out value="${freeDetail.REG_DAT }" /></td>
							<th scope="row">조회수</th>
							<td><c:out value="${freeDetail.HIT_CNT }" /></td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="5" id="contentArea">
							</td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" id="seq" name="seq" value="<c:out value="${freeDetail.SEQ }" />" />
			</form>
			<div align="right" style="text-align: center; height: 50px;">
				<c:if test="${freeDetail.USR_ID eq mberInfo.USR_ID }">
					<a href="#this" class="btn" id="update">수정</a>&nbsp;&nbsp;
					<a href="#this" class="btn" id="delete">삭제</a>&nbsp;&nbsp;
				</c:if>
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
			
			var contentValue = '${freeDetail.CONTENT}';
			var contentHtml = $.parseHTML(contentValue);
			$("#contentArea").append(contentHtml);
			
			$("#list").on("click", function(e) { // 목록 버튼
				e.preventDefault();
				fn_openFreeList();
			});
			
			$("#update").on("click", function(e) { // 수정 버튼
				e.preventDefault();
				fn_updateFree();
			});
			
		});
		
		function fn_openFreeList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/openFreeList.do' />");
			comSubmit.submit();
		}
		
		function fn_updateFree() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/openFreeUpdate.do' />");
			comSubmit.addParam("seq", $("#seq").val());
			comSubmit.submit();
		}
		
	</script>
</body>
</html>

