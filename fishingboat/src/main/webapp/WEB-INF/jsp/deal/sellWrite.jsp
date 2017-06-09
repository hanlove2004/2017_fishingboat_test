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
			<h2>어선매도 신청</h2>
			<form id="frm" name="frm" enctype="multipart/form-data">
				<h4> * 어선입력정보</h4>
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="20%">
						<col width="30%" />
						<col width="20%" />
						<col width="30%" />
					</colgroup>
					<tbody id="shipInfo">
						<tr>
							<th scope="row">작성자</th>
							<td colspan="3"><c:out value="${mberInfo.NAM }" /></td>
						</tr>
						<tr>
							<th scope="row">어선번호</th>
							<td>
								<input type="text" id="shipno" name="shipno" title="어선번호" placeholder="어선번호" class="form-control"
									onkeypress="if ((event.keyCode < 48) || (event.keyCode>57)) event.returnValue=false;"
									onkeydown="if(event.keyCode == 13){$('#price').focus();}" />
							</td>
							<td><a href="#this" id="shipChk" name="shipChk" class="btn btn-success btn-sm">어선번호 확인</a></td>
							<td><span style="color: red;">* 숫자만 입력하세요.</span></td>
						</tr>
						<tr>
							<th scope="row">희망가격</th>
							<td>
								<input type="text" id="price" name="price" style="text-align: right;" maxlength="15" class="form-control"
									onkeypress="isNumObj(this);"
									onkeyup="InputMoney(this, document.frm.HMONEY);" />
							</td>
							<td>
								<input type="text" name="HMONEY" id="HMONEY" readonly="readonly" class="form-control">
							</td>
							<td> 원</td>
						</tr>
						
						<!-- 어선번호 확인 후 append로 처리해야할 영역 -->
						<!-- <tr>
							<th scope="row">상세설명</th>
							<td colspan="3">
								<textarea name="memo" id="memo" style="width : 430px; height : 100px; resize : none;" maxlength="200"></textarea>
							</td>
						</tr>
						<tr>
							<th scope="row" colspan="4" style="text-align: center;">사진등록</th>
						</tr>
						<tr>
							<th scope="row">
								<img src="../../images/icon/noimage.gif" id="original1" style="width: 83px; height: 65px;">
							</th>
							<td>
								정면&nbsp;<span style="color: red;">[필수]</span>
								<input type="file" name="fileName1" id="fileName1" style="width: 200px;">
							</td>
							<th scope="row">
								<img src="../../images/icon/noimage.gif" id="original2" style="width: 83px; height: 65px;">
							</th>
							<td>
								정면&nbsp;<span style="color: red;">[필수]</span>
								<input type="file" name="fileName2" id="fileName2" style="width: 200px;">
							</td>
						</tr>
						<tr>
							<th scope="row">
								<img src="../../images/icon/noimage.gif" id="original3" style="width: 83px; height: 65px;">
							</th>
							<td>
								우측면&nbsp;<span style="color: red;">[필수]</span>
								<input type="file" name="fileName3" id="fileName3" style="width: 200px;">
							</td>
							<th scope="row">
								<img src="../../images/icon/noimage.gif" id="original4" style="width: 83px; height: 65px;">
							</th>
							<td>
								좌측면&nbsp;<span style="color: red;">[필수]</span>
								<input type="file" name="fileName4" id="fileName4" style="width: 200px;">
							</td>
						</tr>
						<tr>
							<th scope="row">
								<img src="../../images/icon/noimage.gif" id="original5" style="width: 83px; height: 65px;">
							</th>
							<td>
								기타&nbsp;<span>[선택]</span>
								<input type="file" name="fileName5" id="fileName5" style="width: 200px;">
							</td>
							<th scope="row">
								<img src="../../images/icon/noimage.gif" id="original6" style="width: 83px; height: 65px;">
							</th>
							<td>
								기타&nbsp;<span>[선택]</span>
								<input type="file" name="fileName6" id="fileName6" style="width: 200px;">
							</td>
						</tr>
						<tr>
							<th scope="row">
								<img src="../../images/icon/noimage.gif" id="original7" style="width: 83px; height: 65px;">
							</th>
							<td>
								기타&nbsp;<span>[선택]</span>
								<input type="file" name="fileName7" id="fileName7" style="width: 200px;">
							</td>
							<th scope="row">
								<img src="../../images/icon/noimage.gif" id="original8" style="width: 83px; height: 65px;">
							</th>
							<td>
								기타&nbsp;<span>[선택]</span>
								<input type="file" name="fileName8" id="fileName8" style="width: 200px;">
							</td>
						</tr> -->
					</tbody>
				</table>
				<input type="hidden" name="usrid" value="<c:out value='${mberInfo.USR_ID }'/>"/>
				
				<!-- 어선번호 확인 후 append로 처리해야할 영역 -->
				<div id="shipInfo01"></div>
				<!-- <h4> * 어선기본정보</h4>
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="20%">
						<col width="30%" />
						<col width="20%" />
						<col width="30%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">어선명</th>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row">어선 소재지</th>
							<td></td>
							<th scope="row">연안복합어업</th>
							<td></td>
						</tr>
						<tr>
							<th scope="row">주기관 종류</th>
							<td></td>
							<th scope="row">주기관 출력(마력)</th>
							<td> hp</td>
						</tr>
						<tr>
							<th scope="row">엔진kw</th>
							<td> kw</td>
							<th scope="row">주기관의 수</th>
							<td> 개</td>
						</tr>
						<tr>
							<th scope="row">길이</th>
							<td> m</td>
							<th scope="row">너비</th>
							<td> m</td>
						</tr>
						<tr>
							<th scope="row">깊이</th>
							<td> m</td>
							<th scope="row">총톤수</th>
							<td> 톤</td>
						</tr>
					</tbody>
				</table>
				
				<h4> * 이력확인 지부</h4>
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="20%">
						<col width="30%" />
						<col width="20%" />
						<col width="30%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">어선명</th>
							<td colspan="2">
								<select name="gb" id="gb" class="form-control">
									<option value="선택">선택</option>
									<option value="kst001">부산지부</option>
									<option value="kst002">인천지부</option>
									<option value="kst003">강원지부</option>
									<option value="kst004">속초출장소</option>
									<option value="kst005">보령지부</option>
									<option value="kst006">태안지부</option>
									<option value="kst007">군산지부</option>
									<option value="kst008">목포지부</option>
									<option value="kst009">여수지부</option>
									<option value="kst010">고흥지부</option>
									<option value="kst011">완도지부</option>
									<option value="kst012">포항지부</option>
									<option value="kst013">창원지부</option>
									<option value="kst014">통영지부</option>
									<option value="kst015">사천지부</option>
									<option value="kst016">제주지부</option>
								</select>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table> -->
				
				<input type="hidden" id="idd" name="idd" value="" />
			</form>
			<div align="right" style="text-align: center; height: 50px;">
				<a href="#this" class="btn" id="write">등록</a>&nbsp;&nbsp;
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
				fn_openSellList();
			});
			
			$("#write").on("click", function(e) { //등록 버튼
				e.preventDefault();
				fn_insertSell();
			});
			
			$("#shipChk").on("click", function(e) { //등록 버튼
				e.preventDefault();
				if(!$("#shipno").val()){
					alert("어선번호를 입력하세요.");
					$("#shipno").focus();
					return;
				}else{
					fn_selectShipChk();
				}
			});
			
			
		});
		
		function fn_openSellList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deal/openSellList.do' />");
			comSubmit.submit();
		}
		
		function fn_insertSell() {
			if(!$("#shipno").val()){
				alert("어선번호를 다시 입력해 주세요.");
				$("#shipno").focus();
				return false;
			} else if(!$("#price").val()){
				alert("가격을 입력해 주세요.");
				$("#price").focus();
				return false;
			} else if($("#gb").val() == '선택'){
				alert("이력확인 지부를 선택해 주세요.");
				$("#gb").focus();
				return false;
			} else if(!$("#fileName1").val()){
				alert("정면사진을 등록해 주세요.");
				$("#fileName1").focus();
				return false;
			} else if(!$("#fileName2").val()){
				alert("후면사진을 입력해 주세요.");
				$("#fileName2").focus();
				return false;
			} else if(!$("#fileName3").val()){
				alert("우측면사진을 입력해 주세요.");
				$("#fileName3").focus();
				return false;
			} else if(!$("#fileName4").val()){
				alert("좌측면사진을 입력해 주세요.");
				$("#fileName4").focus();
				return false;
			} else {
				$.ajax({
					url : "<c:url value='/deal/insertSell.do' />",
					type : "POST",
					data : $("#frm").serialize(),
					async : false,
					success : function(data, status) {
						if (data != null || data != undefined) {
							fn_insertSellSms();
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
		
		function fn_insertSellSms() {
			$.ajax({
				url : "<c:url value='/deal/insertSellSms.do' />",
				type : "POST",
				data : $("#frm").serialize(),
				async : false,
				success : function(data, status) {
					if (data != null || data != undefined) {
						fn_insertSellPic();
					} else {
						alert("정상적으로 처리되지 않았습니다.");
					}
				},
				error: function(e){
					alert(e.responseText);
				}
			});
		}
		
		function fn_insertSellPic() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/deal/insertSellPic.do' />");
			comSubmit.addParam("path", "sellpic");
			comSubmit.submit();
		}
		
		function fn_selectShipChk() {
			$.ajax({
				url : "<c:url value='/deal/selectShipChk.do' />",
				type : "POST",
				data : {
					shipno : $("#shipno").val()
				},
				async : false,
				success : function(data, status) {
					console.log("data.shipResult : " + data.shipResult);
					if (data.shipResult != undefined) {
						var result = data.shipResult;
						if(result.RGT_MBD_NM != "${mberInfo.NAM}"){
							alert("시스템에 등록된 회원명과 \n어선원부에 등록된 선주명이 일치하지 않습니다.");
							location.reload();
						} else {
							alert("어선번호가 확인되었습니다.");
							var html = "";
							html += '<tr>' 
							+ 	'<th scope="row">상세설명</th>'
							+ 		'<td colspan="3">'
							+ 			'<textarea name="memo" id="memo" style="width : 430px; height : 100px; resize : none;" maxlength="200"></textarea>'
							+ 		'</td>'
							+ '</tr>'
							+ '<tr>'
							+ 	'<th scope="row" colspan="4" style="text-align: center;">사진등록</th>'
							+ '</tr>'
							+ '<tr>'
							+ 	'<th scope="row">'
							+ 		'<img src="../../images/icon/noimage.gif" id="original1" style="width: 83px; height: 65px;">'
							+ 	'</th>'
							+ 	'<td>'
							+ 		'정면&nbsp;<span style="color: red;">[필수]</span>'
							+ 		'<input type="file" name="fileName1" id="fileName1" style="width: 200px;">'
							+ 	'</td>'
							+ 	'<th scope="row">'
							+ 		'<img src="../../images/icon/noimage.gif" id="original2" style="width: 83px; height: 65px;">'
							+ 	'</th>'
							+ 	'<td>'
							+ 		'정면&nbsp;<span style="color: red;">[필수]</span>'
							+ 		'<input type="file" name="fileName2" id="fileName2" style="width: 200px;">'
							+ 	'</td>'
							+ '</tr>'
							+ '<tr>'
							+ 	'<th scope="row">'
							+ 		'<img src="../../images/icon/noimage.gif" id="original3" style="width: 83px; height: 65px;">'
							+ 	'</th>'
							+ 	'<td>'
							+ 		'우측면&nbsp;<span style="color: red;">[필수]</span>'
							+ 		'<input type="file" name="fileName3" id="fileName3" style="width: 200px;">'
							+ 	'</td>'
							+ 	'<th scope="row">'
							+ 		'<img src="../../images/icon/noimage.gif" id="original4" style="width: 83px; height: 65px;">'
							+ 	'</th>'
							+ 	'<td>'
							+ 		'좌측면&nbsp;<span style="color: red;">[필수]</span>'
							+ 		'<input type="file" name="fileName4" id="fileName4" style="width: 200px;">'
							+ 	'</td>'
							+ '</tr>'
							+ '<tr>'
							+ 	'<th scope="row">'
							+ 		'<img src="../../images/icon/noimage.gif" id="original5" style="width: 83px; height: 65px;">'
							+ 	'</th>'
							+ 	'<td>'
							+ 		'기타&nbsp;<span>[선택]</span>'
							+ 		'<input type="file" name="fileName5" id="fileName5" style="width: 200px;">'
							+ 	'</td>'
							+ 	'<th scope="row">'
							+ 		'<img src="../../images/icon/noimage.gif" id="original6" style="width: 83px; height: 65px;">'
							+ 	'</th>'
							+ 	'<td>'
							+ 		'기타&nbsp;<span>[선택]</span>'
							+ 		'<input type="file" name="fileName6" id="fileName6" style="width: 200px;">'
							+ 	'</td>'
							+ '</tr>'
							+ '<tr>'
							+ 	'<th scope="row">'
							+ 		'<img src="../../images/icon/noimage.gif" id="original7" style="width: 83px; height: 65px;">'
							+ 	'</th>'
							+ 	'<td>'
							+ 		'기타&nbsp;<span>[선택]</span>'
							+ 		'<input type="file" name="fileName7" id="fileName7" style="width: 200px;">'
							+ 	'</td>'
							+ 	'<th scope="row">'
							+ 		'<img src="../../images/icon/noimage.gif" id="original8" style="width: 83px; height: 65px;">'
							+ 	'</th>'
							+ 	'<td>'
							+ 		'기타&nbsp;<span>[선택]</span>'
							+ 		'<input type="file" name="fileName8" id="fileName8" style="width: 200px;">'
							+ 	'</td>'
							+ '</tr>';
							$("#shipInfo").append(html);
							
							//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
							$("#fileName1").change(function(){
							/* alert(this.value); */ //선택한 이미지 경로 표시
								readURL1(this);
							});
							$("#fileName2").change(function(){
								/* alert(this.value); */ //선택한 이미지 경로 표시
								readURL2(this);
							});
							$("#fileName3").change(function(){
								/* alert(this.value); */ //선택한 이미지 경로 표시
								readURL3(this);
							});
							$("#fileName4").change(function(){
								/* alert(this.value); */ //선택한 이미지 경로 표시
								readURL4(this);
							});
							$("#fileName5").change(function(){
								/* alert(this.value); */ //선택한 이미지 경로 표시
								readURL5(this);
								});
							$("#fileName6").change(function(){
								/* alert(this.value); */ //선택한 이미지 경로 표시
								readURL6(this);
								});
							$("#fileName7").change(function(){
								/* alert(this.value); */ //선택한 이미지 경로 표시
								readURL7(this);
								});
							$("#fileName8").change(function(){
								/* alert(this.value); */ //선택한 이미지 경로 표시
								readURL8(this);
							});
							
							var html01 = "";
							html01 += '<h4> * 어선기본정보</h4>'
							+ '<table class="table table-striped table-bordered table-hover">'
							+	'<colgroup>'
							+		'<col width="20%">'
							+		'<col width="30%" />'
							+		'<col width="20%" />'
							+		'<col width="30%" />'
							+	'</colgroup>'
							+	'<tbody>'
							+		'<tr>'
							+			'<th scope="row">어선명</th>'
							+			'<td colspan="3">';
							if(result.SHP_NM == 'null'){
								html01 += '-';
							} else {
								html01 += result.SHP_NM;
							}
							html01 +=	'</td>'
							+		'</tr>'
							+		'<tr>'
							+			'<th scope="row">어선 소재지</th>'
							+			'<td>';
							if(result.HANG_NAME == 'null'){
								html01 += '-';
							} else {
								html01 += result.HANG_NAME;
							}
							html01 +=	'</td>'
							+			'<th scope="row">어업의 종류</th>'
							+			'<td>';
							if(result.CODE_CTN == 'null'){
								html01 += '-';
							} else {
								html01 += result.CODE_CTN;
							}
							html01 +=	'</td>'
							+		'</tr>'
							+		'<tr>'
							+			'<th scope="row">주기관 종류</th>'
							+			'<td>';
							if(result.CODE_CTN_3 == 'null'){
								html01 += '-';
							} else {
								html01 += result.CODE_CTN_3;
							}
							html01 +=	'</td>'
							+			'<th scope="row">주기관 출력(마력)</th>'
							+			'<td>';
							if(result.ENGINE_PS == 'null'){
								html01 += '-';
							} else {
								html01 += result.ENGINE_PS + ' hp';
							}
							html01 +=	'</td>'
							+		'</tr>'
							+		'<tr>'
							+			'<th scope="row">엔진kw</th>'
							+			'<td>';
							if(result.ENGINE_KW == 'null'){
								html01 += '-';
							} else {
								html01 += result.ENGINE_KW + ' kw';
							}
							html01 +=	'</td>'
							+			'<th scope="row">주기관의 수</th>'
							+			'<td>';
							if(result.ENGINE_NUM == 'null' || result.ENGINE_NUM == '0'){
								html01 += '-';
							} else {
								html01 += result.ENGINE_NUM + ' 개';
							}
							html01 +=	'</td>'
							+		'</tr>'
							+		'<tr>'
							+			'<th scope="row">길이</th>'
							+			'<td>';
							if(result.LEN == 'null' || result.LEN == '0'){
								html01 += '-';
							} else {
								html01 += result.LEN + ' m';
							}
							html01 +=	'</td>'
							+			'<th scope="row">너비</th>'
							+			'<td>';
							if(result.BRE == 'null' || result.BRE == '0'){
								html01 += '-';
							} else {
								html01 += result.BRE + ' m';
							}
							html01 +=	'</td>'
							+		'</tr>'
							+		'<tr>'
							+			'<th scope="row">깊이</th>'
							+			'<td>';
							if(result.DPH == 'null' || result.DPH == '0'){
								html01 += '-';
							} else {
								html01 += result.DPH + ' m';
							}
							html01 +=	'</td>'
							+			'<th scope="row">총톤수</th>'
							+			'<td>';
							if(result.TON == 'null' || result.TON == '0'){
								html01 += '-';
							} else {
								html01 += result.TON + ' 톤';
							}
							html01 +=	'</td>'
							+		'</tr>'
							+	'</tbody>'
							+'</table>'
							+'<h4> * 이력확인 지부</h4>'
							+'<table class="table table-striped table-bordered table-hover">'
							+	'<colgroup>'
							+		'<col width="20%">'
							+		'<col width="30%" />'
							+		'<col width="20%" />'
							+		'<col width="30%" />'
							+	'</colgroup>'
							+	'<tbody>'
							+		'<tr>'
							+			'<th scope="row">이력확인 지부 선택</th>'
							+			'<td colspan="2">'
							+				'<select name="gb" id="gb" class="form-control">'
							+					'<option value="선택">선택</option>'
							+					'<option value="kst001">부산지부</option>'
							+					'<option value="kst002">인천지부</option>'
							+					'<option value="kst003">강원지부</option>'
							+					'<option value="kst004">속초출장소</option>'
							+					'<option value="kst005">보령지부</option>'
							+					'<option value="kst006">태안지부</option>'
							+					'<option value="kst007">군산지부</option>'
							+					'<option value="kst008">목포지부</option>'
							+					'<option value="kst009">여수지부</option>'
							+					'<option value="kst010">고흥지부</option>'
							+					'<option value="kst011">완도지부</option>'
							+					'<option value="kst012">포항지부</option>'
							+					'<option value="kst013">창원지부</option>'
							+					'<option value="kst014">통영지부</option>'
							+					'<option value="kst015">사천지부</option>'
							+					'<option value="kst016">제주지부</option>'
							+				'</select>'
							+			'</td>'
							+			'<td></td>'
							+		'</tr>'
							+	'</tbody>'
							+'</table>';
							$("#shipInfo01").append(html01);
							$("#shipChk").hide();
						}
					} else {
						alert("정상적으로 처리되지 않았습니다.");
					}
				},
				error: function(e){
					alert(e.responseText);
				}
			});
		}
		
		
		
		
		
		function readURL1(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function (e) {
					$('#original1').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				}
				reader.readAsDataURL(input.files[0]);//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}
		
		function readURL2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function(e){
					$('#original2').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				}
				reader.readAsDataURL(input.files[0]); //File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}
		
		function readURL3(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function (e) {
					$('#original3').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				}
				reader.readAsDataURL(input.files[0]);//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}
		
		function readURL4(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function (e) {
					$('#original4').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				}
				reader.readAsDataURL(input.files[0]);//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}
		
		function readURL5(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function (e) {
					$('#original5').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				}
				reader.readAsDataURL(input.files[0]);//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}
		
		function readURL6(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function (e) {
					$('#original6').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				}
				reader.readAsDataURL(input.files[0]);//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}
		
		function readURL7(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function (e) {
					$('#original7').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				}
				reader.readAsDataURL(input.files[0]);//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}
		
		function readURL8(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function (e) {
					$('#original8').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				}
				reader.readAsDataURL(input.files[0]);//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}
		
	</script>
	
	<script type="text/javascript">
		function InputMoney(input,obj){
			str = input.value;
			str = unComma(str);
			MoneyToHan(str,obj)
			str = Comma(str);
			input.value = str;
		}
		
		function MoneyToHan(str,obj){
			arrayNum=new Array("","일","이","삼","사","오","육","칠","팔","구");
			arrayUnit=new Array("","십","백","천","만 ","십만 ","백만 ","천만 ","억 ","십억 ","백억 ","천억 ","조 ","십조 ","백조");
			arrayStr= new Array()
			len = str.length;
			hanStr = "";
			for(i=0;i<len;i++) { arrayStr[i] = str.substr(i,1) }
			code = len;
			for(i=0;i<len;i++) {
				code--;
				tmpUnit = "";
				if(arrayNum[arrayStr[i]] != ""){
					tmpUnit = arrayUnit[code];
					if(code>4) {
						if(( Math.floor(code/4) == Math.floor((code-1)/4) && arrayNum[arrayStr[i+1]] != "") 
								|| ( Math.floor(code/4) == Math.floor((code-2)/4) && arrayNum[arrayStr[i+2]] != "")) {
							tmpUnit=arrayUnit[code].substr(0,1);
						}
					}
				}
				hanStr +=  arrayNum[arrayStr[i]]+tmpUnit;
			}
			obj.value = hanStr;
		}
		
		function isNumObj(obj){
			for (var i = 0; i < obj.value.length ; i++){
				chr = obj.value.substr(i,1);		
				chr = escape(chr);
				key_eg = chr.charAt(1);
				if (key_eg == 'u'){
					key_num = chr.substr(i,(chr.length-1));
					if((key_num < "AC00") || (key_num > "D7A3")) { 
						event.returnValue = false;
					}
				}
			}
			if (event.keyCode >= 48 && event.keyCode <= 57) {
				
			} else {
				event.returnValue = false;
			}
		}
		
		function Comma(num) {
			re = /(\d+)/;
			if(re.test(num)){ 
				re.exec(num); num = RegExp.$1; 
				re = /(\d+)(\d{3})/;
				while(re.test(num)){
					num = num.replace(re,"$1,$2");
				}
			}
			return (num);
		}
		
		function unComma(str) {
			return str.replace(/,/g,"");
		}
	</script>
</body>
</html>

