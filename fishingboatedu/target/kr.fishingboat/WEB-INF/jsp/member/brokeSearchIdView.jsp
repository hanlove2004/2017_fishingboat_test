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
				<div class="well" style="text-align: center; vertical-align: middle; margin: auto; width: 500px; border-radius: 0.5em; background-color: #E5F1B5; box-shadow: 0 0 10px gray inset, 0 0 10px black;">
					<h1 style="font-family: myfont05;">아이디찾기</h1>
					<hr>
					<form id="searchform" method="post">
						<div class="form-group">
							<label for="username" class="col-sm-4 control-label" style="font-size: 20px; text-align: right; vertical-align: middle;">
								<span class="glyphicon glyphicon-user">&nbsp;이름</span>
							</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="nam" name="nam" placeholder="이름" onkeydown="if(event.keyCode == 13){$('#email').focus();}">
							</div>
						</div>
		
						<div class="form-group">
							<label for="password" class="col-sm-4 control-label" style="font-size: 20px; text-align: right; vertical-align: middle;">
								<span class="glyphicon glyphicon-envelope">&nbsp;이메일</span>
							</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="email" name="email" placeholder="이메일"  onkeydown="if(event.keyCode == 13){$('#searchbtn').click();}">
							</div>
						</div>
					</form>
					<br /><br />
					<button type="submit" id="searchbtn" class="btn btn-success" onclick="fn_selectBrokeUsrIdSearch();">찾기</button>
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
		
		function fn_selectBrokeUsrIdSearch(){
			$.ajax({
				url : "<c:url value='/member/selectBrokeUsrIdSearch.do' />",
				type : "POST",
				data : $("#searchform").serialize(),
				async : false,
				success : function(data, status) {
					console.log(data.result);
					if (data.result != undefined) {
						alert("입력하신 " + data.result.USR_EMAIL + " 로 아이디를 발송했습니다. 로그인 페이지로 이동합니다.");

						//페이지 이동
						var url = "<c:url value='/member/openBrokeLoginView.do' />"; 
						$(location).attr('href',url);
					} else {
						alert("정보가 맞지 않습니다. 다시 입력해주세요.");
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

