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
			<h2>어선매수 신청</h2>
			<form id="frm" name="frm">
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="20%">
						<col width="30%" />
						<col width="40%" />
						<col width="10%" />
					</colgroup>
					<tbody id="shipInfo">
						<tr>
							<th scope="row">작성자</th>
							<td colspan="3"><c:out value="${mberInfo.NAM }" /></td>
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
						<tr>
							<th scope="row">총톤수</th>
							<td>
								<input type="text" id="ton" name="ton" style="text-align: right;" maxlength="15" class="form-control" title="총톤수" placeholder="총톤수"
									onkeypress="isNumObj(this);"
									onkeydown="if(event.keyCode == 13){$('#price').focus();}" />
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row">어업의 종류</th>
							<td>
								<select name="type" id="type" class="form-control">
									<option value="선택">선택</option>
									<option value="허가">허가</option>
									<option value="한천가공업">한천가공업</option>
									<option value="건제품가공업">건제품가공업</option>
									<option value="연안선망어업">연안선망어업</option>
									<option value="연안선인망어업">연안선인망어업</option>
									<option value="원양기선저인망어업">원양기선저인망어업</option>
									<option value="원양봉수망어업">원양봉수망어업</option>
									<option value="연근해어획물운반업">연근해어획물운반업</option>
									<option value="낚시어선업">낚시어선업</option>
									<option value="수하식양식어업">수하식양식어업</option>
									<option value="근해자망어업">근해자망어업</option>
									<option value="연안자망어업">연안자망어업</option>
									<option value="양식어업">양식어업</option>
									<option value="정치어업">정치어업</option>
									<option value="외줄낚시어업">외줄낚시어업</option>
									<option value="분기초망어업">분기초망어업</option>
									<option value="어유(간유)가공업">어유(간유)가공업</option>
									<option value="관상어양식어업">관상어양식어업</option>
									<option value="근해연승어업">근해연승어업</option>
									<option value="원양통발어업">원양통발어업</option>
									<option value="통발어업">통발어업</option>
									<option value="냉동.냉장업">냉동.냉장업</option>
									<option value="신고">신고</option>
									<option value="바닥식양식어업">바닥식양식어업</option>
									<option value="축제식양식어업">축제식양식어업</option>
									<option value="잠수기어업">잠수기어업</option>
									<option value="원양선망어업">원양선망어업</option>
									<option value="어로어업">어로어업</option>
									<option value="자망어업">자망어업</option>
									<option value="종묘채포어업">종묘채포어업</option>
									<option value="어살어업">어살어업</option>
									<option value="기타신고어업">기타신고어업</option>
									<option value="수산피혁가공업">수산피혁가공업</option>
									<option value="젓갈.절임가공업">젓갈.절임가공업</option>
									<option value="마을어업">마을어업</option>
									<option value="연안통발어업">연안통발어업</option>
									<option value="연안연승어업">연안연승어업</option>
									<option value="면허">면허</option>
									<option value="근해안강망어업">근해안강망어업</option>
									<option value="연안복합어업">연안복합어업</option>
									<option value="각망어업">각망어업</option>
									<option value="패류채취어업">패류채취어업</option>
									<option value="연승어업">연승어업</option>
									<option value="연안채낚기어업">연안채낚기어업</option>
									<option value="손꽁치어업">손꽁치어업</option>
									<option value="해조채취어업">해조채취어업</option>
									<option value="활선어운반선">활선어운반선</option>
									<option value="해조류가공업">해조류가공업</option>
									<option value="기타">기타</option>
									<option value="가두리양식어업">가두리양식어업</option>
									<option value="협동양식어업">협동양식어업</option>
									<option value="근해봉수망어업">근해봉수망어업</option>
									<option value="나잠어업">나잠어업</option>
									<option value="시험어업">시험어업</option>
									<option value="원양안강망어업">원양안강망어업</option>
									<option value="낚시업">낚시업</option>
									<option value="육상양식어업">육상양식어업</option>
									<option value="연안형망어업">연안형망어업</option>
									<option value="육상종묘생산어업">육상종묘생산어업</option>
									<option value="냉동운반선">냉동운반선</option>
									<option value="근해채낚기어업">근해채낚기어업</option>
									<option value="문어단지어업">문어단지어업</option>
									<option value="연안안강망어업">연안안강망어업</option>
									<option value="연안들망어업">연안들망어업</option>
									<option value="낭장망어업	">낭장망어업</option>
									<option value="해선망어업">해선망어업</option>
									<option value="맨손어업">맨손어업</option>
									<option value="투망어업">투망어업</option>
									<option value="원양트롤어업">원양트롤어업</option>
									<option value="원양채낚기어업">원양채낚기어업</option>
									<option value="공동어업">공동어업</option>
									<option value="조류채취어업">조류채취어업</option>
									<option value="연안유자망어업">연안유자망어업</option>
								</select>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row">어선 소재지</th>
							<td>
								<select name="area" id="area" class="form-control">
									<option value="선택">선택</option>
									<option value="부산">부산</option>
									<option value="인천">인천</option>
									<option value="강원">강원</option>
									<option value="속초">속초</option>
									<option value="보령">보령</option>
									<option value="태안">태안</option>
									<option value="군산">군산</option>
									<option value="목포">목포</option>
									<option value="여수">여수</option>
									<option value="고흥">고흥</option>
									<option value="완도">완도</option>
									<option value="포항">포항</option>
									<option value="창원">창원</option>
									<option value="통영">통영</option>
									<option value="사천">사천</option>
									<option value="제주">제주</option>
								</select>
							</td>
							<td colspan="2"></td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" name="usrid" value="<c:out value='${mberInfo.USR_ID }'/>"/>
				<input type="hidden" id="phonebroke" name="phonebroke" value=""/>
				
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
				fn_openBuyList();
			});
			
			$("#write").on("click", function(e) { //등록 버튼
				e.preventDefault();
				fn_insertBuy();
			});
			
		});
		
		function fn_openBuyList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deal/openBuyList.do' />");
			comSubmit.submit();
		}
		
		function fn_insertBuy() {
			if(!$("#price").val()){
				alert("희망가격을 작성해 주세요.");
				$("#price").focus();
				return false;
			}
			if(!$("#ton").val()){
				alert("총톤수를 입력해 주세요.");
				$("#ton").focus();
				return false;
			}
			if($("#type").val() == "선택"){
				alert("어업의 종류를 선택해 주세요.");
				$("#type").focus();
				return false;
			}
			if($("#area").val() == "선택"){
				alert("어선소재지를 선택해 주세요.");
				$("#area").focus();
				return false;
			} else {
				if(confirm("등록하시겠습니까?")){
					$.ajax({
						url : "<c:url value='/deal/insertBuy.do' />",
						type : "POST",
						data : $("#frm").serialize(),
						async : false,
						success : function(data, status) {
							if (data != null || data != undefined) {
								//중개인 완료문자 처리 위치
								//처리 후 리스트로 이동
								
								fn_openBuyList();
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

