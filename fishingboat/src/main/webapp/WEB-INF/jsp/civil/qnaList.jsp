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
							<th scope="col">질문</th>
							<th scope="col">작성일</th>
							<th scope="col">게시자</th>
							<th scope="col">답변상태</th>
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
			
			fn_selectQnaList(1);
			
			$("#write").on("click", function(e) { //글쓰기 버튼
				e.preventDefault();
				fn_openQnaWrite();
			});
			
		});
		
		function fn_openQnaWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/civil/openQnaWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openQnaDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/civil/openQnaDetail.do' />");
			comSubmit.addParam("seq", obj.parent().find("#seq").val());
			comSubmit.submit();
		}
		
		function fn_selectQnaList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/civil/selectQnaList.do' />");
			comAjax.setCallback("fn_selectQnaListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}
		
		function fn_selectQnaListCallback(data) {
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
					eventName : "fn_selectQnaList",
					recordCount : recordCount
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value) {
					console.log(value.SEQ + " : " + value.ANSWER);
					str += "<tr>" +
							"<td>" + value.SEQ + "</td>" +
							"<td class='title'>" +
								"<a href='#this' name='title'>" + value.TITLE + "</a>" +
								"<input type='hidden' id='seq' name='seq' value='"+ value.SEQ + "'>" +
							"</td>" +
							"<td>" + value.REG_DAT + "</td>" +
							"<td>" + value.USR_ID + "</td>";
						if(value.ANSWER != null || value.ANSWER != undefined){
							str += "<td>답변완료</td>"; 
						} else {
							str += "<td>답변대기</td>";
						}
					str += "</tr>";
				});
				body.append(str);
	
				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_openQnaDetail($(this));
				});
			}
		}
		
	</script>
</body>
</html>

