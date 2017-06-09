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
			<div align="right" style="padding-right: 30px; padding-bottom: 10px; height: 50px;">
				<c:if test="${not empty mberInfo }">
					<a href="#this" class="btn" id="write">글쓰기</a>
				</c:if>
			</div>
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="10%" />
						<col width="*" />
						<col width="20%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">글번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">게시자</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
			
					</tbody>
				</table>
			</div>
			
			<div id="PAGE_NAVI" align="center"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	
			<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		</div>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
		
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	
	<script type="text/javascript">
		$(document).ready(function() {
			fn_pageLog();
			
			fn_selectFreeList(1);
			
			$("#write").on("click", function(e) { //글쓰기 버튼
				e.preventDefault();
				fn_openFreeWrite();
			});
			
		});
		
		function fn_openFreeWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/openFreeWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openFreeDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/openFreeDetail.do' />");
			comSubmit.addParam("seq", obj.parent().find("#seq").val());
			comSubmit.submit();
		}
		
		function fn_selectFreeList(pageNo, pageWidth) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/community/selectFreeList.do' />");
			comAjax.setCallback("fn_selectFreeListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}
		
		function fn_selectFreeListCallback(data) {
			var total = data.TOTAL;
			var body = $("table > tbody");
			body.empty();
			if (total == 0) {
				var str = "<tr>" +
					"<td colspan='4'>조회된 결과가 없습니다.</td>" +
					"</tr>";
				body.append(str);
			} else {
				var recordCount = 10;
				
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectFreeList",
					recordCount : recordCount
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value) {
					str += "<tr>" +
							"<td>" + value.SEQ + "</td>" +
							"<td class='title'>" +
								"<a href='#this' name='title'>" + value.TITLE + "</a>" +
								"<input type='hidden' id='seq' name='seq' value='"+ value.SEQ + "'>" +
							"</td>" +
							"<td>" + value.REG_DAT + "</td>" +
							"<td>" + value.NAM + "</td>" +
							"<td>" + value.HIT_CNT + "</td>" +
						"</tr>";
				});
				body.append(str);
	
				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_openFreeDetail($(this));
				});
			}
		}
		
	</script>
</body>
</html>

