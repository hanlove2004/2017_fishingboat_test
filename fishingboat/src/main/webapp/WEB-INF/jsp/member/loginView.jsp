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
		
		<div id="content">
			<div id="login" style="margin: 80px;">
				<div class="well" style="text-align: center; vertical-align: middle; margin: auto; width: 350px; border-radius: 0.5em; background-color: #E5F1B5; box-shadow: 0 0 10px gray inset, 0 0 10px black;">
					<h1 style="font-family: myfont05;">로그인</h1>
					<hr>
					<form id="loginform" method="post">
						<div class="form-group">
							<label for="username" class="col-sm-3 control-label" style="font-size: 20px; text-align: right; vertical-align: middle;">
								<span class="glyphicon glyphicon-user"></span>
							</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="usrid" name="usrid" placeholder="아이디" onkeydown="if(event.keyCode == 13){$('#usrpw').focus();}">
							</div>
						</div>
		
						<div class="form-group">
							<label for="password" class="col-sm-3 control-label" style="font-size: 20px; text-align: right; vertical-align: middle;">
								<span class="glyphicon glyphicon-lock"></span>
							</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" id="usrpw" name="usrpw" placeholder="비밀번호"  onkeydown="if(event.keyCode == 13){$('#loginbtn').click();}">
							</div>
						</div>
					</form>
					<br /><br />
					<button type="submit" id="loginbtn" class="btn btn-success" onclick="fn_selectLogin();">로그인</button>
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
						//페이지 이동
						alert("메인화면으로 이동합니다.");
						//location.href="fishingboat/openBoardList.do";
						//$("#commonForm").attr('action', '<c:url value="/openMainView.do" />');
						//$("#commonForm").submit();
						
						var url = "<c:url value='/main/openMainView.do' />"; 
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

