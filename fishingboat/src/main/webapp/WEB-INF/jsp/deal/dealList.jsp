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

			<h2>매물현황</h2>
			<br /><br />
			<form class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-sm-2" for="keywordnum1">어선번호</label>
					<div class="col-sm-3">
						<input class="form-control" id="keywordnum1" name="keywordnum1" type="text" value="${param.keywordnum1 }">
					</div>
					<div class="col-sm-1" style="text-align: center; font-size: 15px;"><strong> - </strong></div>
					<div class="col-sm-3">
						<input class="form-control" id="keywordnum2" name="keywordnum2" type="text" value="${param.keywordnum2 }"> 
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="keywordnam">어선명</label>
					<div class="col-sm-8">
						<input class="form-control" id="keywordnam" name="keywordnam" type="text" value="${param.keywordnam }">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="keywordton">총톤수</label>
					<div class="col-sm-8">
						<select class="form-control" name="keywordton" id="keywordton">
							<option value="0">선택</option>
							<option value="1">2톤 이하</option>
							<option value="2">2톤 ~ 3톤</option>
							<option value="3">3톤 ~ 5톤</option>
							<option value="4">5톤 ~ 10톤</option>
							<option value="5">10톤 ~ 20톤</option>
							<option value="6">20톤 ~ 40톤</option>
							<option value="7">40톤 ~ 80톤</option>
							<option value="8">80톤 이상</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="keywordarea">어선 소재지</label>
					<div class="col-sm-8">
						<input class="form-control" id="keywordarea" name="keywordarea" type="text" value="${param.keywordarea }">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="keywordjob">어업의 종류</label>
					<div class="col-sm-8">
						<select class="form-control" name="keywordjob" id="keywordjob">
							<option value="">선택</option>
							<option value="01">허가</option>
							<option value="02">한천가공업</option>
							<option value="03">건제품가공업</option>
							<option value="04">연안선망어업</option>
							<option value="05">연안선인망어업</option>
							<option value="06">원양기선저인망어업</option>
							<option value="07">원양봉수망어업</option>
							<option value="08">연근해어획물운반업</option>
							<option value="09">낚시어선업</option>
							<option value="10">수하식양식어업</option>
							<option value="11">근해자망어업</option>
							<option value="12">연안자망어업</option>
							<option value="13">양식어업</option>
							<option value="14">정치어업</option>
							<option value="15">외줄낚시어업</option>
							<option value="16">분기초망어업</option>
							<option value="17">어유(간유)가공업</option>
							<option value="18">관상어양식어업</option>
							<option value="19">근해연승어업</option>
							<option value="20">원양통발어업</option>
							<option value="21">통발어업</option>
							<option value="22">냉동.냉장업</option>
							<option value="23">바닥식양식어업</option>
							<option value="24">축제식양식어업</option>
							<option value="25">잠수기어업</option>
							<option value="26">원양선망어업</option>
							<option value="27">어로어업</option>
							<option value="28">자망어업</option>
							<option value="29">종묘채포어업</option>
							<option value="30">어살어업</option>
							<option value="31">기타신고어업</option>
							<option value="32">수산피혁가공업</option>
							<option value="33">젓갈.절임가공업</option>
							<option value="34">마을어업</option>
							<option value="35">연안통발어업</option>
							<option value="36">연안연승어업</option>
							<option value="37">근해안강망어업</option>
							<option value="38">연안복합어업</option>
							<option value="39">각망어업</option>
							<option value="40">패류채취어업</option>
							<option value="41">연승어업</option>
							<option value="42">연안채낚기어업</option>
							<option value="43">손꽁치어업</option>
							<option value="44">해조채취어업</option>
							<option value="45">활선어운반선</option>
							<option value="46">해조류가공업</option>
							<option value="47">가두리양식어업</option>
							<option value="48">협동양식어업</option>
							<option value="49">근해봉수망어업</option>
							<option value="50">나잠어업</option>
							<option value="51">시험어업</option>
							<option value="52">원양안강망어업</option>
							<option value="53">낚시업</option>
							<option value="54">육상양식어업</option>
							<option value="55">연안형망어업</option>
							<option value="56">육상종묘생산어업</option>
							<option value="57">냉동운반선</option>
							<option value="58">근해채낚기어업</option>
							<option value="59">문어단지어업</option>
							<option value="60">연안안강망어업</option>
							<option value="61">연안들망어업</option>
							<option value="62">낭장망어업</option>
							<option value="63">해선망어업</option>
							<option value="64">맨손어업</option>
							<option value="65">투망어업</option>
							<option value="66">원양트롤어업</option>
							<option value="67">원양채낚기어업</option>
							<option value="68">공동어업</option>
							<option value="69">조류채취어업</option>
							<option value="70">연안유자망어업</option>
						</select>
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
						<col width="15%" />
						<col width="15%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">순번</th>
							<th scope="col">사진</th>
							<th scope="col">어선 소재지</th>
							<th scope="col">총톤수</th>
							<th scope="col">어업의 종류</th>
							<th scope="col">희망가격</th>
							<th scope="col">작성일</th>
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
			
			var keywordnum1 = "${param.keywordnum1}";
			var keywordnum2 = "${param.keywordnum2}";
			var keywordnam = "${param.keywordnam}";
			var keywordton = "${param.keywordton}";
			var keywordarea = "${param.keywordarea}";
			var keywordjob = "${param.keywordjob}";
			
			$("#keywordton").val(keywordton);
			$("#keywordjob").val(keywordjob);
			
			if(keywordnum1 == "" && keywordnum2 == "" && keywordnam == ""
				&& keywordton == "" && keywordton == "" && keywordjob == ""){
				fn_selectDealList(1);
			} else {
				fn_searchDealList();
			}
			
			$("#search").on("click", function(e) { // 검색버튼
				e.preventDefault();
				fn_searchDealList();
			});
			
		});
		
		function fn_openDealDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deal/openDealDetail.do' />");
			comSubmit.addParam("seq", obj.parent().find("#seq").val());
			comSubmit.addParam("brotype", obj.parent().find("#brotype").val());
			comSubmit.addParam("broke_id", obj.parent().find("#broke_id").val());
			if(obj.parent().find("#brotype").val() == "sell"){
				comSubmit.addParam("ship_no", obj.parent().find("#ship_no").val());
			}
			comSubmit.submit();
		}
		
		function fn_selectDealList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/deal/selectDealList.do' />");
			comAjax.setCallback("fn_selectDealListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}
		
		function fn_searchDealList() {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/deal/selectDealList.do' />");
			comAjax.setCallback("fn_selectDealListCallback");
			comAjax.addParam("keywordnum1", $("#keywordnum1").val());
			comAjax.addParam("keywordnum2", $("#keywordnum2").val());
			comAjax.addParam("keywordnam", $("#keywordnam").val());
			comAjax.addParam("keywordton", $("#keywordton").val());
			comAjax.addParam("keywordarea", $("#keywordarea").val());
			comAjax.addParam("keywordjob", $("#keywordjob").val());
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}
		
		function fn_selectDealListCallback(data) {
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
					eventName : "fn_selectDealList",
					recordCount : recordCount
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value) {
					str += "<tr>" +
							"<td>" + value.RNUM + "</td>";
							if(value.SELLPIC == "null"){
								str += "<td> - </td>";
							} else if(value.SELLPIC == undefined) {
								str += "<td> - </td>";
							} else if(value.SELLPIC == "SAV_FLE_NAM") {
								str += "<td> - </td>";
							} else {
								str += "<td><img src='/file/sellpic/" + value.SELLPIC + "' style='width: 100px; height: 100px;'/></td>";
							}
					str += "<td class='title'>" +
								"<a href='#this' name='title' class='btn btn-danger'>" + value.TITLE + "</a>" +
								"<input type='hidden' id='seq' name='seq' value='"+ value.SEQ + "'>" +
								"<input type='hidden' id='brotype' name='brotype' value='"+ value.BROTYPE + "'>" +
								"<input type='hidden' id='broke_id' name='broke_id' value='"+ value.BROKE_ID + "'>" +
								"<input type='hidden' id='ship_no' name='ship_no' value='"+ value.SHIP_NO + "'>" +
							"</td>" +
							"<td>" + value.TON + " 톤</td>" +
							"<td>" + value.CODE_CTN + "</td>" +
							"<td>" + value.HOPE_PRICE + " 원</td>" +
							"<td>" + value.REG_DAT + "</td>";
							if(value.BROTYPE == 'sell'){
								str += "<td>매도</td>";
							} else if(value.BROTYPE == 'buy') {
								str += "<td>매수</td>";
							}
					str += "</tr>";
				});
				body.append(str);
	
				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_openDealDetail($(this));
				});
			}
		}
		
	</script>
</body>
</html>

