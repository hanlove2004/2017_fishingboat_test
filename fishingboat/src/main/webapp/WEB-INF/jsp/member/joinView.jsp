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
		
			<div id="join" align="center">
				<h2>회원가입</h2>
				<div class="well well-lg" align="center" style="margin: auto; height: 100%; width: 50%; background-color: #E5F1B5; box-shadow: 0 0 10px gray inset, 0 0 10px black">
					<form class="form-horizontal" id="joinform" method="post">
						<div class="form-group">
							<label for="id" class="col-sm-3 control-label">아이디</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-sm" name="usrid" id="usrid" placeholder="아이디">
							</div>
							<div class="col-sm-4" id="idcheck" align="left"></div>
						</div>
						<div class="form-group">
							<label for="pwd" class="col-sm-3 control-label">비밀번호</label>
							<div class="col-sm-6">
								<input type="password" class="form-control input-sm" name="usrpw" id="usrpw" placeholder="문자, 숫자, 특수문자 조합으로 9자 이상">
							</div>
						</div>
						<div class="form-group">
							<label for="confirmpwd" class="col-sm-3 control-label">비밀번호확인</label>
							<div class="col-sm-6">
								<input type="password" class="form-control input-sm" name="usrpw2" id="usrpw2" placeholder="비밀번호 확인">
							</div>
						</div>
						<div class="form-group">
							<label for="pwdcheck" class="col-sm-3 control-label"></label>
							<div class="col-sm-6" id="pwdcheck">필수정보 입니다.</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">이름</label>
							<div class="col-sm-6">
								<input type="text" class="form-control input-sm" name="name" id="name" placeholder="이름">
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-3 control-label">연락처</label>
							<div class="col-sm-2" style="padding-right: 0px;">
								<input type="text" class="form-control input-sm" name="phone_select" id="phone_select" onkeypress="javascript:onlyNumber();">
							</div>
							<div class="col-sm-1">-</div>
							<div class="col-sm-2" style="padding: 0px;">
								<input type="text" class="form-control input-sm" name="phone" id="phone" onkeypress="javascript:onlyNumber();">
							</div>
							<div class="col-sm-1">-</div>
							<div class="col-sm-2" style="padding: 0px;">
								<input type="text" class="form-control input-sm" name="phone1" id="phone1" onkeypress="javascript:onlyNumber();">
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-3 control-label">이메일</label>
							<div class="col-sm-2" style="padding-right: 0px;">
								<input type="text" class="form-control input-sm" name="email" id="email">
							</div>
							<div class="col-sm-1">
								@
							</div>
							<div class="col-sm-2" style="padding-left: 0px;">
								<input type="text" class="form-control input-sm" name="email2" id="email2" readonly="readonly">
							</div>
							<div class="col-sm-3" style="padding-left: 0px;">
								<select class="form-control input-sm" name="email_select" id="email_select" onchange="fn_domainChange()">
									<option value="" selected="selected">선택하세요</option>
									<option value="naver.com">naver.com</option>
									<option value="nate.com">nate.com</option>
									<option value="paran.com">paran.com</option>
									<option value="lycos.co.kr">lycos.co.kr</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="hanmail.com">hanmail.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="1">직접입력</option>
								</select>
							</div>
						</div>
					</form>
					<button type="submit" class="btn btn-success" name="check" id="check">가입</button>
					<button type="reset" class="btn btn-info" onclick="location.href='javascript:joinform.reset()'">재작성</button>
					<button type="submit" class="btn btn-warning" name="cancle" id="cancle" onclick="javascript:$(location).attr('href','<c:url value='/openMainView.do' />');">취소</button>
				</div>
			</div>
			
			<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		</div>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
		
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>

	<script type="text/javascript">
		$(document).ready(function() {
			fn_pageLog();
			
			//회원가입 아이디 중복검사 (text로 처리)
			$("#usrid").keyup(function() {
				var usrid = $('#usrid').val();
				$.ajax({
					type : "post",
					url : "<c:url value='/member/selectIdCheck.do' />",
					data : "usrid=" + usrid,
					success : function(data) {  
						console.log(data.result.RESULT);
						if (data.result.RESULT == 1) {
							$("#idcheck").html("아이디중복");
							$('#idcheck').css("color", "red");
						} else {
							$("#idcheck").html("");
						}
					},
					error: function(e){
						alert(e.responseText);
					}
				});
			});
	
			//회원가입 아이디 중복검사 (다시 입력할 수 있도록 강제)
			$("#usrid").focusout(function() {
				var usrid = $('#usrid').val();
				$.ajax({
					type : "post",
					url : "<c:url value='/member/selectIdCheck.do' />",
					data : "usrid=" + usrid,
					success : function(data) { //callback  
						console.log(data.result.RESULT);
						if (data.result.RESULT == 1) {
							alert("중복된 아이디 입니다. 다시 입력해주세요");
							$('#usrid').val("");
							$('#usrid').focus();
						}
					},
					error: function(e){
						alert(e.responseText);
					}
				});
			});
	
			$('#check').click(function() {

				//회원가입 유효성 검사
				//아이디 검사식 (4~16글자)
				var re_id = /^[a-z0-9_-]{4,16}$/;
				// 비밀번호 검사식 (9~15글자, 영대소문자,숫자,특수문자 포함)
				var re_pw = /^.*(?=^.{9,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
				// 이메일
				var re_email = /^(\w+)(((\.?)(\w+))*)[@](((\w+)[.])+)(\w{2,3})$/;
	
				//일력한 값 변수 할당
				var usrid = $("#usrid").val();
				var usrpw = $("#usrpw").val();
				var usrpw2 = $("#usrpw2").val();
				var name = $("#name").val();
				var phone_select = $("#phone_select").val();
				var phone = $("#phone").val();
				var phone1 = $("#phone1").val();
				var email = $("#email").val() + "@" + $("#email2").val();
	
				if (re_id.test(usrid) != true) { // 아이디 검사
					alert('[아이디 입력 오류] 유효한 ID를 입력해 주세요.');
					$("#usrid").focus();
					return false;
				} else if (re_pw.test(usrpw) != true) { // 비밀번호 검사
					alert('[비밀번호 입력 오류] 유효한 비밀번호를 입력해 주세요.');
					$("#usrpw").focus();
					return false;
				} else if (re_pw.test(usrpw2) != true) { // 비밀번호 검사
					alert('[비밀번호 입력 오류] 유효한 비밀번호를 입력해 주세요.');
					$("#usrpw2").focus();
					return false;
				} else if (name == "") { // 이름 검사
					alert('[이름 입력 오류] 이름을 입력해 주세요.');
					$("#name").focus();
					return false;
				} else if (phone_select == "") { // 전화번호 검사
					alert('[전화번호 입력 오류] 전화번호를 입력하세요.');
					$("#phone_select").focus();
					return false;
				} else if (phone == "") { // 전화번호 검사
					alert('[전화번호 입력 오류] 전화번호를 입력하세요.');
					$("#phone").focus();
					return false;
				} else if (phone1 == "") { // 전화번호 검사
					alert('[전화번호 입력 오류] 전화번호를 입력하세요.');
					$("#phone1").focus();
					return false;
				} else if (re_email.test(email) != true) { // 이메일 검사
					alert('[이메일 입력 오류] 유효한 이메일을 입력해 주세요.');
					$("#email").focus();
					return false;
				} else {
					if(confirm("입력하신 내용으로 가입하시겠습니까?") == true) {
						$.ajax({
							url : "<c:url value='/member/insertJoin.do' />",
							type : "POST",
							data : $("#joinform").serialize(),
							async : false,
							success : function(data, status) {
								console.log(data);
								if (data != null || data != undefined) {
									//페이지 이동
									alert("회원가입이 완료되었습니다. 메인화면으로 이동합니다.");
									
									var url = "<c:url value='/main/openMainView.do' />"; 
									$(location).attr('href',url);
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
			});
			
			// 비밀번호 확인시 이벤트
			function passwordcheck(confirmpwd, pwd) {
				if (confirmpwd != pwd) {
					$('#pwdcheck').text('');
					$('#pwdcheck').html("비밀번호 불일치");
					$('#pwdcheck').css("color", "red");
				} else if (confirmpwd != "" && pwd != "" && confirmpwd == pwd) {
					$('#pwdcheck').text('');
					$('#pwdcheck').html("비밀번호 일치");
					$('#pwdcheck').css("color", "blue");
				} else if ((confirmpwd == "") || (pwd == "")) {
					$('#pwdcheck').text('');
					$('#pwdcheck').html("비밀번호를 입력해 주세요");
					$('#pwdcheck').css("color", "black");
				}
			}
	
			// pwd / confirmpwd 에 입력시 비밀번호 체크
			$('#usrpw2').keyup(function() {
				var usrpw = $('#usrpw').val();
				var usrpw2 = $('#usrpw2').val();
				passwordcheck(usrpw2, usrpw);
			});
	
			$('#usrpw').keyup(function() {
				var usrpw = $('#usrpw').val();
				var usrpw2 = $('#usrpw2').val();
				passwordcheck(usrpw2, usrpw);
			});
		});
		
		// domain 변경 시 이벤트
		function fn_domainChange() {
			if($("#email_select").val() == "") {
				$("#email2").val("");
				$("#email2").attr("readonly", "readonly");
			} else if($("#email_select").val() == "1") {
				$("#email2").removeAttr("readonly");
			} else {
				$("#email2").val($("#email_select").val());
				$("#email2").attr("readonly", "readonly");
			}
		}
	</script>
</body>
</html>

