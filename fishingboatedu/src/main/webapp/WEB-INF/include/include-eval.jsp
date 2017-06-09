<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="well" style="padding-top: 40px;">
	<div class="panel panel-warning">
		<div class="panel-heading"><b>콘텐츠 담당자 :</b> 관리자 &nbsp;&nbsp;&nbsp;&nbsp;<b>문의전화 :</b> 000-000-0000</div>
		<div class="panel-body">
			<b>열람하신 정보에 만족하십니까?</b>&nbsp;&nbsp;<a href="#this" id="eval" class="btn btn-success btn-xs">평가하기</a>
			<hr style="margin: 5px;">
			<form name="evalForm" id="evalForm">
				<label class="radio-inline"><input type="radio" name="evalchk" value="5" checked="checked">매우만족</label>
				<label class="radio-inline"><input type="radio" name="evalchk" value="4">만족</label>
				<label class="radio-inline"><input type="radio" name="evalchk" value="3">보통</label>
				<label class="radio-inline"><input type="radio" name="evalchk" value="2">불만족</label>
				<label class="radio-inline"><input type="radio" name="evalchk" value="1">매우불만족</label>
				<input type="hidden" name="page" value="<c:out value='${page }'/>" />
				<input type="hidden" name="evalid" value="<c:out value='${mberInfo.USR_ID }'/>" />
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$("#eval").on("click", function(e) { // 평가하기 버튼
			e.preventDefault();
			fn_insertPageEval();
		});
	});
	
	function fn_insertPageEval() {
		$.ajax({
			url : "<c:url value='/main/insertEval.do' />",
			type : "POST",
			data : $("#evalForm").serialize(),
			async : false,
			success : function(data, status) {
				if (data != null || data != undefined) {
					alert("평가해주셔서 감사합니다.");
					return;
				} else {
					alert("정상적으로 처리되지 않았습니다.");
					return;
				}
			},
			error: function(e){
				alert(e.responseText);
			}
		});
	}

</script>
