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
			
			<h2>자유게시판 수정</h2>
			<form id="frm" name="frm">
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="15%">
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">작성자</th>
							<td><c:out value="${freeDetail.NAM }" /></td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td><input type="text" title="제목" id="title" name="title" value="<c:out value="${freeDetail.TITLE }" />" class="form-control" style="width: 700px;" /></td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td>
								<textarea rows="20" cols="100" title="내용" id="contentArea" name="contentArea"><c:out value="${freeDetail.CONTENT }" /></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" id="seq" name="seq" value="<c:out value="${freeDetail.SEQ }" />" />
				<input type="hidden" id="bodycontent" name="content" value="" />
			</form>
			<div align="right" style="text-align: center; height: 50px;">
				<a href="#this" class="btn" id="update">수정</a>&nbsp;&nbsp;
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
			
			$("#list").on("click", function(e) { //목록 버튼
				e.preventDefault();
				fn_openFreeList();
			});
			
			// 스마트 에디터 적용
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "contentArea", //textarea에서 지정한 id와 일치해야 합니다. 
				//SmartEditor2Skin.html 파일이 존재하는 경로
				sSkinURI : "<c:url value='/SE2/SmartEditor2Skin.html' />",
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,
					fOnBeforeUnload : function() {
						
					}
				},
				fCreator : "createSEditor2"
			});
			
			$("#update").on("click", function(e) { //수정 버튼
				e.preventDefault();
				
				oEditors.getById["contentArea"].exec("UPDATE_CONTENTS_FIELD", []);
				var content = $("#contentArea").val();
				content = content.replace(unescape("%uFEFF"), "");
				$("#bodycontent").val(content);
				
				fn_updateFree();
			});
			
		});
		
		function fn_openFreeList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/openFreeList.do' />");
			comSubmit.submit();
		}
		
		function fn_updateFree() {
			if($("#title").val() == ""){
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return;
			} else {
				if(confirm("수정하시겠습니까?") == true){
					$.ajax({
						url : "<c:url value='/community/updateFree.do' />",
						type : "POST",
						data : $("#frm").serialize(),
						async : false,
						success : function(responseData, textStatus, jqXHR) {
							if (textStatus == "success") {
								alert("수정이 완료되었습니다. 목록 페이지로 이동합니다.");
								fn_openFreeList();
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
		}
		
	</script>
</body>
</html>

