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
			<h2>업체정보 입력</h2>
			<form id="frm" name="frm">
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="20%" />
						<col width="30%" />
						<col width="20%" />
						<col width="30%" />
					</colgroup>
					<tbody id="shipInfo">
						<tr>
							<th scope="row">상호명</th>
							<td><input type="text" id="storename" name="storename" class="form-control"></td>
							<th scope="row">대표자</th>
							<td><input type="text" id="storeboss" name="storeboss" class="form-control"></td>
						</tr>
						<tr>
							<th scope="row">업체전화번호</th>
							<td>
								<select onkeydown="if(event.keyCode == 13){$('#phone').focus();}" name="storetel1" class="form-control" id="storetel1">
									<option value="">선택</option>
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="043">043</option>
									<option value="051">051</option>
									<option value="052">052</option>
									<option value="053">053</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="061">061</option>
									<option value="062">062</option>
									<option value="063">063</option>
									<option value="064">064</option>
									<option value="070">070</option>
									<option value="080">080</option>
									<option value="1544">1544</option>
									<option value="1566">1566</option>
									<option value="1577">1577</option>
									<option value="1588">1588</option>
									<option value="1599">1599</option>
									<option value="1644">1644</option>
									<option value="1661">1661</option>
									<option value="1670">1670</option>
								</select>
								<input type="text" id="storetel2" name="storetel2" class="form-control">
								<input type="text" id="storetel3" name="storetel3" class="form-control">
							</td>
							<th scope="row">휴대폰번호</th>
							<td>
								<select onkeydown="if(event.keyCode == 13){$('#phone').focus();}" name="phonenumber1" class="form-control" id="phonenumber1">
									<option value="">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select> 
								<input type="text" id="phonenumber2" name="phonenumber2" class="form-control">
								<input type="text" id="phonenumber3" name="phonenumber3" class="form-control">
							</td>
						</tr>
						<tr>
							<th scope="row">사업자등록번호</th>
							<td>
								<input type="text" id="storenumber" name="storenumber" class="form-control" onkeypress="if ((event.keyCode < 48) || (event.keyCode>57)) event.returnValue=false;">
							</td>
							<th scope="row">창업(개업)일자</th>
							<td><input type="text" id="storesdate" name="storesdate" class="form-control"></td>
						</tr>
						<tr>
							<th scope="row">홈페이지주소</th>
							<td colspan="3">
								http://<input type="text" id="storeurl" name="storeurl" class="form-control">
							</td>
						</tr>
						<tr>
							<th scope="row">사업장 주소</th>
							<td colspan="3">
								<input type="text" id="sample6_postcode" name="sample6_postcode" class="form-control" readonly="readonly"><a href="javascript:sample6_execDaumPostcode();" class="btn btn-success btn-sm" >우편번호찾기</a><br/>
								<input type="text" id="sample6_address" name="sample6_address" class="form-control" readonly="readonly">
								<input type="text" id="sample6_address2" name="sample6_address2" class="form-control">
							</td>
						</tr>
						<tr>
							<th scope="row">인사말</th>
							<td colspan="3">
								<textarea name="introtext" id="introtext" style="width : 430px; height : 100px; resize : none;" maxlength="200"></textarea>
							</td>
						</tr>
						<tr>
							<th scope="row">약도</th>
							<td colspan="3">
								<input type="file" name="addrfile" id="addrfile" style="width: 200px;">
							</td>
						</tr>
						<tr>
							<th scope="row" colspan="4" style="text-align: center;">서비스품목</th>
						</tr>
						<tr>
							<th scope="row">제조(건조)</th>
							<td colspan="3">
								<label class="checkbox-inline"><input type="checkbox" id="make01" name="service" value="make01">어선건조</label>
								<label class="checkbox-inline"><input type="checkbox" id="make02" name="service" value="make02">기관장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="make03" name="service" value="make03">항해장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="make04" name="service" value="make04">통신장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="make05" name="service" value="make05">구명장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="make06" name="service" value="make06">소방장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="make07" name="service" value="make07">어구어망</label>
							</td>
						</tr>
						<tr>
							<th scope="row">수리</th>
							<td colspan="3">
								<label class="checkbox-inline"><input type="checkbox" id="repair01" name="service" value="repair01">어선수리</label>
								<label class="checkbox-inline"><input type="checkbox" id="repair02" name="service" value="repair02">기관장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="repair03" name="service" value="repair03">항해장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="repair04" name="service" value="repair04">통신장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="repair05" name="service" value="repair05">구명장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="repair06" name="service" value="repair06">소방장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="repair07" name="service" value="repair07">어구어망</label>
							</td>
						</tr>
						<tr>
							<th scope="row">판매</th>
							<td colspan="3">
								<label class="checkbox-inline"><input type="checkbox" id="sell01" name="service" value="sell01">어선판매</label>
								<label class="checkbox-inline"><input type="checkbox" id="sell02" name="service" value="sell02">기관장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="sell03" name="service" value="sell03">항해장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="sell04" name="service" value="sell04">통신장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="sell05" name="service" value="sell05">구명장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="sell06" name="service" value="sell06">소방장비</label>
								<label class="checkbox-inline"><input type="checkbox" id="sell07" name="service" value="sell07">어구어망</label>
							</td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" id="usr_id" name="usr_id" value="<c:out value='${mberInfo.USR_ID }'/>" />
				<input type="hidden" id="storetel" name="storetel" value="" />
				<input type="hidden" id="phonenumber" name="phonenumber" value="" />
				<input type="hidden" id="makeservice" name="makeservice" value="" />
				
				<h4> * 개인정보의 수집 및 이용에 대한 안내</h4>
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="33%" />
						<col width="33%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">목적</th>
							<th scope="row">항목</th>
							<th scope="row">보유기간</th>
						</tr>
						<tr>
							<td>업체홍보</td>
							<td>상호명, 대표자, 사업자등록번호, 연락처, 업체전화, 업체주소</td>
							<td>업체홍보기간</td>
						</tr>
						<tr>
							<td colspan="3">
								개인정보의 수집 및 이용에 관한 사항에 동의합니다.&nbsp;&nbsp;<input type="checkbox" name="chkyn" id="chkyn">
							</td>
						</tr>
					</tbody>
				</table>
				
				<input type="hidden" id="ORIGINAL_FILE_NAME" name="ORIGINAL_FILE_NAME" value="" />
				<input type="hidden" id="STORED_FILE_NAME" name="STORED_FILE_NAME" value="" />
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
			
			$("#storesdate").datepicker({
				dateFormat: "yy-mm-dd",
				changeMonth: true, 
				changeYear: true,
				dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
				dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
				monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			});
			
			$("#list").on("click", function(e) { //목록 버튼
				e.preventDefault();
				fn_openStoreList();
			});
			
			$("#write").on("click", function(e) { //등록 버튼
				e.preventDefault();
				fn_insertStore();
			});
			
		});
		
		function fn_openStoreList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/info/openStoreList.do' />");
			comSubmit.submit();
		}
		
		function fn_insertStore() {
			if(!$("#storename").val()){
				alert("상호명을 입력하세요.");
				$("#storename").focus();
				return false;
			} else if(!$("#storeboss").val()){
				alert("대표자명을 입력하세요.");
				$("#storeboss").focus();
				return false;
			} else if(!$("#storetel2").val()){
				alert("업체전화번호를 입력하세요.");
				$("#storetel2").focus();
				return false;
			} else if(!$("#storetel3").val()){
				alert("업체전화번호를 입력하세요.");
				$("#storetel3").focus();
				return false;
			} else if(!$("#phonenumber2").val()){
				alert("휴대폰번호를 입력하세요.");
				$("#phonenumber2").focus();
				return false;
			} else if(!$("#phonenumber3").val()){
				alert("휴대폰번호를 입력하세요.");
				$("#phonenumber3").focus();
				return false;
			} else if(!$("#storenumber").val()){
				alert("사업자등록번호를 입력하세요.");
				$("#storenumber").focus();
				return false;
			} else if(!$("#storesdate").val()){
				alert("창업(개업)일자를 입력하세요.");
				$("#storesdate").focus();
				return false;
			} else if(!$("#sample6_address").val()){
				alert("사업장 주소를 입력하세요.");
				return false;
			} else if(!$("#sample6_address2").val()){
				alert("사업장 주소를 입력하세요.");
				return false;
			} else if(!$("#introtext").val()){
				alert("인사말을 입력하세요.");
				$("#introtext").focus();
				return false;
			} else if(!$("#addrfile").val()){
				alert("약도 이미지를 올려주세요.");
				$("#addrfile").focus();
				return false;
			} else if(!jQuery("#chkyn").is(":checked")){
				alert("약관에 동의 해주시기 바랍니다.");
				$("#chkyn").focus();
				return false;
			} else {
				var storetel1 = $("#storetel1").val();
				var storetel2 = $("#storetel2").val();
				var storetel3 = $("#storetel3").val(); 
				var storetel = storetel1 + "-" + storetel2 + "-" + storetel3;
				$("#storetel").val(storetel);
				
				var phonenumber1 = $("#phonenumber1").val();
				var phonenumber2 = $("#phonenumber2").val();
				var phonenumber3 = $("#phonenumber3").val(); 
				var phonenumber = phonenumber1 + "-" + phonenumber2 + "-" + phonenumber3;
				$("#phonenumber").val(phonenumber);
				
				var serviceOptionChk = "";
				$('input[name="service"]:checked').each(function() { // 같은 네임을 가진 체크박스중에 Checked 인 녀석들만 추출하는 과정입니다.
					serviceOptionChk += this.value + ",";
				});
				$("#makeservice").val(serviceOptionChk);
				
				var data = new FormData();
				$.each($('#addrfile')[0].files, function(i, file) {
					data.append('file-' + i, file);
				});
				
				$.ajax({
					url : "<c:url value='/info/addrUpload.do' />",
					type : "POST",
					data : data,
					processData: false,
					contentType: false,
					success : function(data, status) {
						if (data != null || data != undefined) {
							$("#STORED_FILE_NAME").val(data.file.STORED_FILE_NAME);
							$("#ORIGINAL_FILE_NAME").val(data.file.ORIGINAL_FILE_NAME);
							
							fn_insertStoreProcess();
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
		
		function fn_insertStoreProcess() {
			$.ajax({
				url : "<c:url value='/info/insertStore.do' />",
				type : "POST",
				data : $("#frm").serialize(),
				async : false,
				success : function(data, status) {
					if (data != null || data != undefined) {
						alert("업체정보가 등록되었습니다.");
						fn_openStoreList();
					} else {
						alert("정상적으로 처리되지 않았습니다.");
					}
				},
				error: function(e){
					alert(e.responseText);
				}
			});
		}
		
	</script>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수
					
					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;
					
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}
					
					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if(data.userSelectedType === 'R'){
						//법정동명이 있을 경우 추가한다.
						if(data.bname !== ''){
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if(data.buildingName !== ''){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
					}
					
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('sample6_address').value = fullAddr;
					
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('sample6_address2').focus();
				}
			}).open();
		}
	</script>
</body>
</html>

