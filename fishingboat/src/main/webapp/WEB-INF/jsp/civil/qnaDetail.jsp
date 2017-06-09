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
	
			<h2>Q&A</h2>
			<form id="frm" name="frm">
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="15%" />
						<col width="*" />
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">게시자</th>
							<td><c:out value="${qnaResult.NAM }" /></td>
							<th scope="row">작성일</th>
							<td><c:out value="${qnaResult.REG_DAT }" /></td>
						</tr>
						<tr>
							<th scope="row">질문</th>
							<td colspan="3" id="questionArea"></td>
						</tr>
						<tr>
							<th scope="row">답변</th>
							<td colspan="3" id="answerArea">
								<c:choose>
									<c:when test="${empty qnaResult.ANSWER }">
										[답변 대기중..]
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
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
			
			var questionValue = '${qnaResult.CONTENT}';
			var questionHtml = $.parseHTML(questionValue);
			$("#questionArea").append(questionHtml);
			
			var answerValue = '${qnaResult.ANSWER}';
			var answerHtml = $.parseHTML(answerValue);
			$("#answerArea").append(answerHtml);
			
			$("#list").on("click", function(e) { // 목록 버튼
				e.preventDefault();
				fn_openQnaList();
			});
		});
		
		function fn_openQnaList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/civil/openQnaList.do' />");
			comSubmit.submit();
		}
		
	</script>
</body>
</html>

