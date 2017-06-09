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
		
		<div id="content" style="min-height: 450px; width: 100%; text-align: center; padding-top: 100px;">
			<div class="well" style="text-align: center; display: inline-block; width: 350px; border-radius: 0.5em; background-color: #E5F1B5; box-shadow: 0 0 10px gray inset, 0 0 10px black;">
				<h2>로그인</h2>
				<hr style="margin: 20px;">
				<form id="loginform" method="post">
					<div class="form-group" style="height: 25px;">
						<label for="username" class="col-sm-3 control-label" style="font-size: 20px; text-align: right; vertical-align: middle;">
							<span class="glyphicon glyphicon-user"></span>
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="usrid" name="usrid" placeholder="접수번호" onkeydown="if(event.keyCode == 13){$('#usrpw').focus();}">
						</div>
					</div>
					<div class="form-group" style="height: 25px;">
						<label for="password" class="col-sm-3 control-label" style="font-size: 20px; text-align: right; vertical-align: middle;">
							<span class="glyphicon glyphicon-lock"></span>
						</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="usrpw" name="usrpw" placeholder="비밀번호"  onkeydown="if(event.keyCode == 13){$('#loginbtn').click();}">
						</div>
					</div>
				</form>
					<div class="form-group" style="height: 30px; margin-top: 30px;">
						<div class="col-sm-12">
						<button type="submit" id="loginbtn" class="btn btn-success btn-block" onclick="fn_selectLogin();">로그인</button>
						</div>
					</div>
			</div>
	
		</div>
		
		<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
		
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>

	<script type="text/javascript">
		$(document).ready(function() {
			fn_pageLog();
		});
		
		function fn_selectLogin(){
			$.ajax({
				url : "<c:url value='/member/selectLogin.do' />",
				type : "POST",
				data : $("#loginform").serialize(),
				async : false,
				success : function(data, status) {
					console.log(data.result.RESULT);
					if (data.result == "success") {
						alert("메인화면으로 이동합니다.");
						
						var url = "<c:url value='/main/openEduMainView.do' />"; 
						$(location).attr('href',url);
					} else if(data.result == "fail") {
						alert("아이디 또는 비밀번호가 맞지 않습니다.");
					}
				},
				error: function(e){
					alert(e.responseText);
				}
			});
		}
	</script>
</body>
</html>

