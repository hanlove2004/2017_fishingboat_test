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
	
			<h2>어선매도 수정</h2>
			<br />
			<form id="frm" name="frm">
				<h4>* 매도인 현황</h4>
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="20%" />
						<col width="30%" />
						<col width="20%" />
						<col width="30%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">매도인</th>
							<td><c:out value="${sellResult.NAM }" /></td>
							<th scope="row">작성일</th>
							<td><c:out value="${sellResult.REG_DAT }" /></td>
						</tr>
						<tr>
							<th scope="row">어업의 종류</th>
							<td><c:out value="${sellResult.CODE_CTN }" /></td>
							<th scope="row">어선 소재지</th>
							<td><c:out value="${sellResult.HANG_NAME }" /></td>
						</tr>
						<tr>
							<th scope="row">총톤수</th>
							<td colspan="3"><c:out value="${sellResult.TON }" /> 톤</td>
						</tr>
						<tr>
							<th scope="row">희망가격</th>
							<td>
								<input type="text" id="price" name="price" style="text-align: right;" maxlength="15" class="form-control"
									onkeypress="isNumObj(this);" onkeyup="InputMoney(this, document.frm.HMONEY);"
									value="<c:out value='${sellResult.HOPE_PRICE }' />" />
							</td>
							<td>
								<input type="text" name="HMONEY" id="HMONEY" readonly="readonly" class="form-control">
							</td>
							<td> 원</td>
						</tr>
					</tbody>
				</table>
				<h4>* 어선 정보</h4>
				<table class="table table-striped table-bordered table-hover">
					<colgroup>
						<col width="20%" />
						<col width="30%" />
						<col width="20%" />
						<col width="30%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">어선명</th>
							<td><c:out value="${sellResult.SHP_NM }" /></td>
							<th scope="row">어선번호</th>
							<td><c:out value="${sellResult.TITLE }" /></td>
						</tr>
						<tr>
							<th scope="row">이력확인서</th>
							<td colspan="3"><a href="javascript:fn_clipReport();" class="btn btn-success">이력확인서</a></td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" id="usrid" name="usrid" value="<c:out value='${mberInfo.USR_ID }' />" >
				<input type="hidden" id="seq" name="seq" value="<c:out value='${sellResult.SEQ }' />" >
			</form>
			<div align="right" style="text-align: center; height: 50px;">
				<a href="#this" class="btn" id="list">목록</a>&nbsp;&nbsp;
				<a href="#this" class="btn" id="update">수정</a>
			</div>
			
			<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		</div>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
		
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	
	<script type="text/javascript">
	
		$(document).ready(function() {
			fn_pageLog();
			
			$("#list").on("click", function(e) { // 목록 버튼
				e.preventDefault();
				fn_openSellList();
			});
			
			$("#update").on("click", function(e) { //수정 버튼
				e.preventDefault();
				fn_updateSell();
			});
		});
		
		function fn_openSellList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deal/openSellList.do' />");
			comSubmit.submit();
		}
		
		function fn_clipReport() {
			alert("개발 예정 항목입니다.");
			return;
		}
		
		function fn_updateSell() {
			if(!$("#price").val()){
				alert("가격을 입력해 주세요.");
				$("#price").focus();
				return;
			} else {
				if(confirm("수정하시겠습니까?")){
					$.ajax({
						url : "<c:url value='/deal/updateSell.do' />",
						type : "POST",
						data : $("#frm").serialize(),
						async : false,
						success : function(data, status) {
							if (data != null || data != undefined) {
								alert("수정되었습니다.\n목록으로 이동합니다.");
								fn_openSellList();
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

