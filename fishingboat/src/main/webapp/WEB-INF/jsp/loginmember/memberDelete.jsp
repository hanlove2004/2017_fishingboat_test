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
				<h2>회원탈퇴</h2>
				<div class="well well-lg" align="center" style="margin: auto; height: 100%; width: 50%; background-color: #E5F1B5; box-shadow: 0 0 10px gray inset, 0 0 10px black">
					<form class="form-horizontal" id="updateform" method="post">
						<div class="form-group">
							<label for="pwd" class="col-sm-3 control-label">비밀번호</label>
							<div class="col-sm-6">
								<input type="password" class="form-control input-sm" name="usrpw" id="usrpw">
							</div>
						</div>
						<div class="form-group">
							<label for="confirmpwd" class="col-sm-3 control-label">비밀번호확인</label>
							<div class="col-sm-6">
								<input type="password" class="form-control input-sm" name="usrpw2" id="usrpw2">
							</div>
						</div>
						<div class="form-group">
							<label for="pwdcheck" class="col-sm-3 control-label"></label>
							<div class="col-sm-6" id="pwdcheck">비밀번호를 입력해주세요.</div>
						</div>
					</form>
					<button type="submit" class="btn btn-success" name="check" id="check">탈퇴</button>
					<button type="submit" class="btn btn-warning" name="cancle" id="cancle" onclick="javascript:$(location).attr('href','<c:url value='/openMainView.do' />');">취소</button>
				</div>
			</div>
			
			<input type="hidden" name="originalPw" id="originalPw" value="<c:out value="${memberResult.PW }" />" />
			
			<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		</div>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
		
	</div>
	
	<%@ include file="/WEB-INF/include/include-body.jspf"%>

	<script type="text/javascript">
		$(document).ready(function() {
			fn_pageLog();
			
			
			$('#check').click(function() {
				var originalPw = $("#originalPw").val();
				var usrpw = $('#usrpw').val();
				if(usrpw == originalPw){
					if(confirm("탈퇴하시겠습니까?")){
						$.ajax({
							url : "<c:url value='/loginmember/deleteMember.do' />",
							type : "POST",
							data : $("#updateform").serialize(),
							async : false,
							success : function(data, status) {
								console.log(data);
								if (data != null || data != undefined) {
									//페이지 이동
									alert("탈퇴되었습니다. 메인화면으로 이동합닌다.");
									
									var url = "<c:url value='/main/openMainView.do' />"; 
									$(location).attr('href', url);
								} else {
									alert("정상적으로 처리되지 않았습니다.");
								}
							},
							error: function(e){
								alert(e.responseText);
							}
						});
					} else {
						return;
					}
				} else {
					alert("비밀번호를 다시 입력해주세요.");
					$('#usrpw').focus();
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
	</script>
</body>
</html>

