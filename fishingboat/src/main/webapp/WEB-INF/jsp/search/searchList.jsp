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
			<h2>검색</h2>
			<br /><br />
			<form class="form-horizontal">
				<div class="form-group">
					<div class="col-sm-4">
						<select class="form-control" name="search_type" id="search_type">
							<option value="">선택</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select> 
					</div>
					<div class="col-sm-8">
						<input class="form-control" id="keyword" name="keyword" type="text" value="${param.keyword }" placeholder="검색어를 입력하세요.">
					</div>
				</div>
			</form>
			<div align="right" style="padding-right: 30px; padding-bottom: 10px; height: 50px;">
				<a href="#this" id="search" class="btn btn-success">검색</a>
			</div>
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="10%" />
						<col width="*" />
						<col width="20%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">순번</th>
							<th scope="col">제목</th>
							<th scope="col">등록일</th>
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
			
			var search_type = "${param.search_type}";
			var keyword = "${param.keyword}";
			
			$("#search_type").val(search_type);
			
			if(search_type == "" && keyword == ""){
				fn_selectSearchList(1);
			} else {
				fn_searchSearchList();
			}
			
			$("#search").on("click", function(e) { // 검색버튼
				e.preventDefault();
				fn_searchSearchList();
			});
		});
		
		function fn_selectSearchList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/search/selectSearchList.do' />");
			comAjax.setCallback("fn_selectSearchListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}
		
		function fn_searchSearchList() {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/search/selectSearchList.do' />");
			comAjax.setCallback("fn_selectSearchListCallback");
			comAjax.addParam("search_type", $("#search_type").val());
			comAjax.addParam("keyword", $("#keyword").val());
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}
		
		function fn_selectSearchListCallback(data) {
			var total = data.TOTAL;
			var body = $("table > tbody");
			body.empty();
			if (total == 0) {
				var str = "<tr>" +
					"<td colspan='8'>조회된 결과가 없습니다.</td>" +
					"</tr>";
				body.append(str);
			} else {
				var recordCount = 10;
				
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectSearchList",
					recordCount : recordCount
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value) {
					str += "<tr>" +
							"<td>" + value.ROWSNUM + "</td>" +
							"<td class='title'>" +
								"<a href='#this' name='title'>" + value.TITLE + "</a>" +
								"<input type='hidden' id='seq' name='seq' value='"+ value.SEQ + "'>" +
								"<input type='hidden' id='rule' name='rule' value='"+ value.RULE + "'>" +
							"</td>" +
							"<td>" + value.REG_DAT + "</td>" +
						"</tr>";
				});
				body.append(str);
	
				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_openSearchDetail($(this));
				});
			}
		}
		
		function fn_openSearchDetail(obj) {
			var comSubmit = new ComSubmit();
			var rule = obj.parent().find("#rule").val();
			if(rule == "NOTICE"){
				comSubmit.setUrl("<c:url value='/community/openNoticeDetail.do' />");
			} else if(rule == "FREE") {
				comSubmit.setUrl("<c:url value='/community/openFreeDetail.do' />");
			} else if(rule == "DATA") {
				comSubmit.setUrl("<c:url value='/community/openDataDetail.do' />");
			} else if(rule == "RULE") {
				comSubmit.setUrl("<c:url value='/civil/openRuleList.do' />");
			} else if(rule == "QNA") {
				comSubmit.setUrl("<c:url value='/civil/openQnaDetail.do' />");
			}
			comSubmit.addParam("seq", obj.parent().find("#seq").val());
			comSubmit.submit();
		}
		
	</script>
</body>
</html>

