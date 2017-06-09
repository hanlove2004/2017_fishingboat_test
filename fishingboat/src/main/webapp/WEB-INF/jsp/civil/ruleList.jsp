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
			<h2>관련규정 및 서식</h2>
			<div align="right" style="padding-right: 100px; padding-bottom: 10px;">
			</div>
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="50%" />
						<col width="*" />
						<col width="20%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">관련규정 및 서식</th>
							<th scope="col">저장 이름</th>
							<th scope="col">파일 다운로드</th>
						</tr>
					</thead>
					<tbody>
			
					</tbody>
				</table>
			</div>
			
			<div id="PAGE_NAVI" align="center"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
			<form id="frm" name="frm">
				<input type="hidden" id="FILE_SEQ" name="FILE_SEQ" value="" />
				<input type="hidden" id="BOARD_TYPE" name="BOARD_TYPE" value="ruleboard" />
			</form>
	
			<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		</div>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
		
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	
	<script type="text/javascript">
		$(document).ready(function() {
			fn_pageLog();
			
			fn_selectRuleList(1, $(window).width());
			
			$(window).resize(function(){
				fn_selectRuleList($("#PAGE_INDEX").val(), $(window).width());
			});
			
		});
		
		function fn_selectRuleList(pageNo, pageWidth) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/civil/selectRuleList.do' />");
			comAjax.setCallback("fn_selectRuleListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			if(pageWidth <= 800 && pageWidth > 600){
				comAjax.addParam("PAGE_ROW", 10);
			} else if (pageWidth <= 600) {
				comAjax.addParam("PAGE_ROW", 5);
			} else {
				comAjax.addParam("PAGE_ROW", 15);
			}
			comAjax.ajax();
		}
		
		function fn_selectRuleListCallback(data) {
			var total = data.TOTAL;
			var body = $("table > tbody");
			body.empty();
			if (total == 0) {
				var str = "<tr>" +
					"<td colspan='4'>조회된 결과가 없습니다.</td>" +
					"</tr>";
				body.append(str);
			} else {
				var pageWidth = $(window).width();
				
				var recordCount;
				
				if(pageWidth <= 800 && pageWidth > 600){
					recordCount = 10;
				} else if (pageWidth <= 600) {
					recordCount = 5;
				} else {
					recordCount = 15;
				}
				
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectRuleList",
					pageWidth : pageWidth,
					recordCount : recordCount
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value) {
					str += "<tr>" +
							"<td class='title'>" + value.TITLE + "</td>" +
							"<td>" + value.SAV_FLE_NAM + "</td>" +
							"<td>" +
								"<a href='javascript:fn_downloadFile(" + value.FILE_SEQ + ");'><img src='/file/images/downloadbutton.png'/ style='width: 50px; height: 30px;'>파일 다운로드</a>" +
							"</td>";
					str += "</tr>";
				});
				body.append(str);
			}
		}
		
		function fn_downloadFile(file_Seq){
			$("#FILE_SEQ").val(file_Seq);
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/common/downloadFishFile.do' />");
			comSubmit.submit();
		}
		
	</script>
</body>
</html>

