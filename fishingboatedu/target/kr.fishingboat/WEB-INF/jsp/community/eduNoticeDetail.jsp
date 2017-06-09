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
			<h3><i class="glyphicon glyphicon-info-sign"></i>&nbsp;공지사항</h3>
			<hr />
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
							<td colspan="5"><c:out value="${noticeDetail.TITLE }" /></td>
						</tr>
						<tr>
							<th scope="row">게시자</th>
							<td><c:out value="${noticeDetail.USR_ID }" /></td>
							<th scope="row">작성일</th>
							<td><c:out value="${noticeDetail.REG_DAT }" /></td>
							<th scope="row">조회수</th>
							<td><c:out value="${noticeDetail.HIT_CNT }" /></td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="5" id="contentArea">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div align="right" style="text-align: center; height: 50px;">
				<a href="#this" class="btn" id="list">목록</a>
			</div>
			
		</div>
		
		<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
		
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	
	<script type="text/javascript">
	
		$(document).ready(function() {
			fn_pageLog();
			
			var contentValue = '${noticeDetail.CONTENT}';
			var contentHtml = $.parseHTML(contentValue);
			$("#contentArea").append(contentHtml);
			
			$("#list").on("click", function(e) { // 목록 버튼
				e.preventDefault();
				fn_openNoticeList();
			});
		});
		
		function fn_openNoticeList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/openEduNoticeList.do' />");
			comSubmit.submit();
		}
		
	</script>
</body>
</html>

