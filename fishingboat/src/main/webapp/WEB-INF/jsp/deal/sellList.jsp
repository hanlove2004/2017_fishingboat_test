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
			<h2>어선매도</h2>
			<div align="right" style="padding-right: 30px; padding-bottom: 10px; height: 50px;">
				<a href="#this" class="btn" id="write">어선매도 신청</a>
			</div>
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="10%" />
						<col width="*" />
						<col width="10%" />
						<col width="10%" />
						<col width="15%" />
						<col width="15%" />
						<col width="10%" />
						<col width="15%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">순번</th>
							<th scope="col">사진</th>
							<th scope="col">어선 소재지</th>
							<th scope="col">총톤수</th>
							<th scope="col">희망가격</th>
							<th scope="col">작성일</th>
							<th scope="col">중개인</th>
							<th scope="col">진행상황</th>
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
			
			fn_selectSellList(1);
			
			$("#write").on("click", function(e) { //글쓰기 버튼
				e.preventDefault();
				fn_openSellWrite();
			});
			
		});
		
		function fn_openSellWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deal/openSellWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openSellDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deal/openSellDetail.do' />");
			comSubmit.addParam("seq", obj.parent().find("#seq").val());
			comSubmit.submit();
		}
		
		function fn_selectSellList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/deal/selectSellList.do' />");
			comAjax.setCallback("fn_selectSellListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}
		
		function fn_selectSellListCallback(data) {
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
					eventName : "fn_selectSellList",
					recordCount : recordCount
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value) {
					str += "<tr>" +
							"<td>" + value.ROWS_NUM + "</td>";
							if(value.SELLPIC != undefined){
								str += "<td><img src='/file/sellpic/" + value.SELLPIC + "' style='width: 100px; height: 100px;'/></td>";
							} else {
								str += "<td> - </td>";
							}
					str += "<td class='title'>" +
								"<a href='#this' name='title' class='btn btn-danger'>" + value.SHIP_SGG + "</a>" +
								"<input type='hidden' id='seq' name='seq' value='"+ value.SEQ + "'>" +
							"</td>" +
							"<td>" + value.SHIP_TOT_TONS + " 톤</td>" +
							"<td>" + value.HOPE_PRICE + " 원</td>" +
							"<td>" + value.REG_DAT + "</td>";
							if(value.YNCNT != undefined){
								str += "<td><a href='#this' name='broker' class='btn btn-info'>" + value.YNCNT + " 명</a>" +
									"<input type='hidden' id='brokerSeq' name='brokerSeq' value='"+ value.SEQ + "'></td>";
							} else {
								str += "<td> - </td>";
							}
							if(value.STATUS_CODE == "001"){
								str += "<td><img src='../images/icon/1.gif' class='statusbtn' /></td>";
							}else if(value.STATUS_CODE == "002"){
								str += "<td><img src='../images/icon/2.gif' class='statusbtn' /></td>";
							}else if(value.STATUS_CODE == "003"){
								str += "<td><img src='../images/icon/3.gif' class='statusbtn' /></td>";
							}else if(value.STATUS_CODE == "004"){
								str += "<td><img src='../images/icon/4.gif' class='statusbtn' /></td>";
							}else if(value.STATUS_CODE == "005"){
								str += "<td><img src='../images/icon/5.gif' class='statusbtn' /></td>";
							}else if(value.STATUS_CODE == "006"){
								str += "<td><img src='../images/icon/6.gif' class='statusbtn' /></td>";
							}else if(value.STATUS_CODE == "007"){
								str += "<td><img src='../images/icon/7.gif' class='statusbtn' /></td>";
							}
					str += "</tr>";
				});
				body.append(str);
				
				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_openSellDetail($(this));
				});
				
				$("a[name='broker']").on("click", function(e) { //중개인 목록으로
					e.preventDefault();
					fn_sellBrokerList($(this));
				});
			}
		}
		
		function fn_sellBrokerList(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deal/openSellBrokerList.do' />");
			console.log(obj.parent().find("#brokerSeq").val());
			comSubmit.addParam("seq", obj.parent().find("#brokerSeq").val());
			comSubmit.submit();
		}
		
	</script>
</body>
</html>

