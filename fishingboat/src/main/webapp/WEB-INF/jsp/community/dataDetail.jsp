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
	
			<h2>자료실</h2>
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
							<td colspan="5"><c:out value="${dataDetail.TITLE }" /></td>
						</tr>
						<tr>
							<th scope="row">게시자</th>
							<td><c:out value="${dataDetail.NAM }" /></td>
							<th scope="row">작성일</th>
							<td><c:out value="${dataDetail.REG_DAT }" /></td>
							<th scope="row">조회수</th>
							<td><c:out value="${dataDetail.HIT_CNT }" /></td>
						</tr>
						<tr>
							<th scope="row">파일</th>
							<td colspan="5">
								<c:choose>
									<c:when test="${empty dataDetail.FILE_SEQ }">
										파일없음
									</c:when>
									<c:otherwise>
										<a href="#this" name="file"><c:out value="${dataDetail.ORG_FLE_NAM }" /></a>
										<input type="hidden" id="fileSeq" value="${dataDetail.FILE_SEQ }">
									</c:otherwise>
								</c:choose>
							</td>
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
			
			<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		</div>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
		
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	
	<script type="text/javascript">
	
		$(document).ready(function() {
			fn_pageLog();
			
			var contentValue = '${dataDetail.CONTENT}';
			var contentHtml = $.parseHTML(contentValue);
			$("#contentArea").append(contentHtml);
			
			$("#list").on("click", function(e) { // 목록 버튼
				e.preventDefault();
				fn_openDataList();
			});
			
			$("a[name='file']").on("click", function(e) { //파일 이름
				e.preventDefault();
				fn_downloadFile($(this));
			});
		});
		
		function fn_openDataList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/openDataList.do' />");
			comSubmit.submit();
		}
		
		function fn_downloadFile(){
			var fileSeq = $("#fileSeq").val();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/common/downloadFishFile.do' />");
			comSubmit.addParam("FILE_SEQ", fileSeq);
			comSubmit.addParam("path", "data");
			comSubmit.addParam("BOARD_TYPE", "adminfileboard");
			comSubmit.submit();
		}
		
	</script>
</body>
</html>

