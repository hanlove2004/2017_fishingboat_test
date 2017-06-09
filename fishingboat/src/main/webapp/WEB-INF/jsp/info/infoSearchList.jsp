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
			<h2>어선검사정보 조회</h2>
			<br /><br />
			<form class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-sm-2" for="keywordnum1">어선번호</label>
					<div class="col-sm-3">
						<input class="form-control" id="keywordnum1" name="keywordnum1" type="text" value="${param.keywordnum1 }" />
					</div>
					<div class="col-sm-1" style="text-align: center; font-size: 15px;"><strong> - </strong></div>
					<div class="col-sm-3">
						<input class="form-control" id="keywordnum2" name="keywordnum2" type="text" value="${param.keywordnum2 }" /> 
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="keywordnam">어선명</label>
					<div class="col-sm-8">
						<input class="form-control" id="keywordnam" name="keywordnam" type="text" value="${param.keywordnam }" />
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
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="15%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">순번</th>
							<th scope="col">어선번호</th>
							<th scope="col">어선명</th>
							<th scope="col">등록길이</th>
							<th scope="col">등록너비</th>
							<th scope="col">등록깊이</th>
							<th scope="col">엔진kw</th>
							<th scope="col">엔진주기관 출력(마력)</th>
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
			
			var keywordnum1 = "${param.keywordnum1}";
			var keywordnum2 = "${param.keywordnum2}";
			var keywordnam = "${param.keywordnam}";
			
			if(keywordnum1 == "" && keywordnum2 == "" && keywordnam == ""){
				fn_selectInfoSearchList(1);
			} else {
				fn_searchInfoSearchList();
			}
			
			$("#search").on("click", function(e) { // 검색버튼
				e.preventDefault();
				fn_searchInfoSearchList();
			});
		});
		
		function fn_openInfoSearchDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/info/openInfoSearchDetail.do' />");
			comSubmit.addParam("shipNo", obj.parent().find("#shipNo").val());
			comSubmit.submit();
		}
		
		function fn_selectInfoSearchList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/info/selectInfoSearchList.do' />");
			comAjax.setCallback("fn_selectInfoSearchListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}
		
		function fn_searchInfoSearchList() {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/info/selectInfoSearchList.do' />");
			comAjax.setCallback("fn_selectInfoSearchListCallback");
			comAjax.addParam("keywordnum1", $("#keywordnum1").val());
			comAjax.addParam("keywordnum2", $("#keywordnum2").val());
			comAjax.addParam("keywordnam", $("#keywordnam").val());
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}
		
		function fn_selectInfoSearchListCallback(data) {
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
					eventName : "fn_selectInfoSearchList",
					recordCount : recordCount
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value) {
					str += "<tr>" +
							"<td>" + value.RNUM + "</td>" +
							"<td class='title'>" +
								"<a href='#this' name='title'>" + value.TITLE + "</a>" +
								"<input type='hidden' id='shipNo' name='shipNo' value='"+ value.SHIP_NO + "'>" +
							"</td>" +
							"<td>" + value.SHIP_NAME + "</td>" +
							"<td>" + value.REGISTERED_LEN + " m</td>" +
							"<td>" + value.REGISTERED_BR + " m</td>" +
							"<td>" + value.REGISTERED_DTH + " m</td>" +
							"<td>" + value.MCR_KW + "</td>" +
							"<td>" + value.MCE_PS + " hp</td>" +
						"</tr>";
				});
				body.append(str);
	
				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_openInfoSearchDetail($(this));
				});
			}
		}
		
	</script>
</body>
</html>

