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
		
			<h2>업체정보</h2>
			<div align="right" style="padding-right: 30px; padding-bottom: 10px; height: 50px;">
				<a href="#this" class="btn" id="write">업체등록</a>
			</div>
			<form class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-sm-2" for="service">제조(건조)</label>
					<div class="col-sm-8">
						<label class="checkbox-inline"><input type="checkbox" id="make01" name="service" value="make01"> 어선건조</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="make02" name="service" value="make02"> 기관장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="make03" name="service" value="make03"> 항해장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="make04" name="service" value="make04"> 통신장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="make05" name="service" value="make05"> 구명장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="make06" name="service" value="make06"> 소방장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="make07" name="service" value="make07"> 어구어망</label>&nbsp;&nbsp;
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="service">수리</label>
					<div class="col-sm-8">
						<label class="checkbox-inline"><input type="checkbox" id="repair01" name="service" value="repair01"> 어선수리</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="repair02" name="service" value="repair02"> 기관장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="repair03" name="service" value="repair03"> 항해장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="repair04" name="service" value="repair04"> 통신장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="repair05" name="service" value="repair05"> 구명장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="repair06" name="service" value="repair06"> 소방장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="repair07" name="service" value="repair07"> 어구어망</label>&nbsp;&nbsp;
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="service">판매</label>
					<div class="col-sm-8">
						<label class="checkbox-inline"><input type="checkbox" id="sell01" name="service" value="sell01"> 어선판매</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="sell02" name="service" value="sell02"> 기관장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="sell03" name="service" value="sell03"> 항해장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="sell04" name="service" value="sell04"> 통신장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="sell05" name="service" value="sell05"> 구명장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="sell06" name="service" value="sell06"> 소방장비</label>&nbsp;&nbsp;
						<label class="checkbox-inline"><input type="checkbox" id="sell07" name="service" value="sell07"> 어구어망</label>&nbsp;&nbsp;
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="keysido">지역</label>
					<div class="col-sm-3">
						<select class="form-control" name="keysido" id="keysido">
							<option value="">전체보기</option>
							<option value="01">서울</option>
							<option value="02">경기</option>
							<option value="03">인천</option>
							<option value="04">대전</option>
							<option value="05">대구</option>
							<option value="06">울산</option>
							<option value="07">부산</option>
							<option value="08">광주</option>
							<option value="09">강원</option>
							<option value="10">충북</option>
							<option value="11">충남</option>
							<option value="12">경북</option>
							<option value="13">경남</option>
							<option value="14">전북</option>
							<option value="15">전남</option>
							<option value="16">제주</option>
						</select>
					</div>
					<div class="col-sm-1" style="padding: 10px;">
						시(도)
					</div>
					<div class="col-sm-3">
						<select class="form-control" name="keygugun" id="keygugun">
							<option value="">전체보기</option>
						</select>
					</div>
					<div class="col-sm-1" style="padding: 10px;">
						구(군)
					</div>
				</div>
				<input type="hidden" id="makeservice" name="makeservice" value="" />
			</form>
			<div align="right" style="padding-right: 30px; padding-bottom: 10px; height: 50px;">
				<a href="#this" id="search" class="btn btn-success">검색</a>
			</div>
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="10%" />
						<col width="15%" />
						<col width="*" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">순번</th>
							<th scope="col">상호명</th>
							<th scope="col">사업장 소재지</th>
							<th scope="col">연락처</th>
							<th scope="col">구분</th>
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
			
			fn_selectStoreList(1);
			
			$("#write").on("click", function(e) { //글쓰기 버튼
				e.preventDefault();
				fn_openStoreWrite();
			});
			
			$('#keysido').change(function() {
				//옵션 초기화
				$("#keygugun").empty().data("options");
				var keysido = $("#keysido option:selected").val();

				$.ajax({
					url : "<c:url value='/info/selectGugunKeyList.do' />",
					type : "POST",
					data : {
						keysido : keysido
					},
					async : false,
					success : function(data, status) {
						if (data != null || data != undefined) {
							$.each(data.list, function(key, value) {
								$("#keygugun").append("<option value='" + value.GUGUNKEY + "'>" + value.VAL + "</option>");
							});
						} else {
							alert("정상적으로 처리되지 않았습니다.");
						}
					},
					error: function(e){
						alert(e.responseText);
					}
				});
			});
			
			$("#search").on("click", function(e) { // 검색버튼
				e.preventDefault();
				fn_searchStoreList();
			});
		});
		
		function fn_openStoreWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/info/openStoreWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openStoreDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/info/openStoreDetail.do' />");
			comSubmit.addParam("seq", obj.parent().find("#seq").val());
			comSubmit.submit();
		}
		
		function fn_selectStoreList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/info/selectStoreList.do' />");
			comAjax.setCallback("fn_selectStoreListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}
		
		function fn_searchStoreList() {
			var serviceOptionChk = "";
			$('input[name="service"]:checked').each(function() { // 같은 네임을 가진 체크박스중에 Checked 인 녀석들만 추출하는 과정입니다.
				serviceOptionChk += this.value + ",";
			});
			$("#makeservice").val(serviceOptionChk);
			
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/info/selectStoreList.do' />");
			comAjax.setCallback("fn_selectStoreListCallback");
			comAjax.addParam("keysido", $("#keysido").val());
			comAjax.addParam("keygugun", $("#keygugun").val());
			comAjax.addParam("makeservice", $("#makeservice").val());
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}
		
		function fn_selectStoreListCallback(data) {
			var total = data.TOTAL;
			var body = $("table > tbody");
			body.empty();
			if (total == 0) {
				var str = "<tr>" +
					"<td colspan='5'>조회된 결과가 없습니다.</td>" +
					"</tr>";
				body.append(str);
			} else {
				var recordCount = 10;
				
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectStoreList",
					recordCount : recordCount
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value) {
					str += "<tr>" +
							"<td>" + value.RNUM + "</td>" +
							"<td class='title'>" +
								"<a href='#this' name='title'>" + value.TITLE + "</a>" +
								"<input type='hidden' id='seq' name='seq' value='"+ value.SEQ + "'>" +
							"</td>" +
							"<td>" + value.STOREADDRESS1 + "</td>" +
							"<td>" + value.STORETELNUMBER + "</td>";
							
							if(value.STORESERVICE == "null" || value.STORESERVICE == undefined){
								str += "<td> - </td>";
							}else{
								var result = value.STORESERVICE;
								
								var result1 = result.search("make");
								var result2 = result.search("repair");
								var result3 = result.search("sell");
								
								if(result1 != '-1' && result2 != '-1' && result3 != '-1'){
									str += "<td>제조 / 수리 / 판매</td>";
								}else if(result1 != '-1' && result2 != '-1' && result3 == '-1'){
									str += "<td>제조 / 수리 </td>";
								}else if(result1 != '-1' && result2 == '-1' && result3 != '-1'){
									str += "<td>제조 / 판매 </td>";
								}else if(result1 == '-1' && result2 != '-1' && result3 != '-1'){
									str += "<td>수리 / 판매 </td>";
								}else if(result1 != '-1' && result2 == '-1' && result3 == '-1'){
									str += "<td>제조 </td>";
								}else if(result1 == '-1' && result2 != '-1' && result3 == '-1'){
									str += "<td>수리 </td>";
								}else if(result1 == '-1' && result2 == '-1' && result3 != '-1'){
									str += "<td>판매</td>";
								}
							}
							
					str += 	"</tr>";
				});
				body.append(str);
	
				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_openStoreDetail($(this));
				});
			}
		}
		
	</script>
</body>
</html>

