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
	
			<h2>업체정보</h2>
			<br />
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="30%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">상호명</th>
						<td><c:out value="${storeResult.TITLE }" /></td>
						<th scope="row">대표자</th>
						<td><c:out value="${storeResult.STOREBOSS }" /></td>
					</tr>
					<tr>
						<th scope="row">업체 전화번호</th>
						<td><c:out value="${storeResult.STORETELNUMBER }" /></td>
						<th scope="row">휴대폰번호</th>
						<td><c:out value="${storeResult.PHONENUMBER }" /></td>
					</tr>
					<tr>
						<th scope="row">사업자등록번호</th>
						<td><c:out value="${storeResult.STORENUMBER }" /></td>
						<th scope="row">창업(개업)일자</th>
						<td><c:out value="${storeResult.STORESDATE }" /></td>
					</tr>
					<tr>
						<th scope="row">홈페이지 주소</th>
						<td><a href="http://${storeResult.STOREURL }" target="_blank" class="btn btn-success btn-sm"><c:out value="${storeResult.STOREURL }" /></a></td>
						<th scope="row">정보입력일</th>
						<td><c:out value="${storeResult.STOREEDATE }" /></td>
					</tr>
					<tr>
						<th scope="row">사업장 주소</th>
						<td colspan="3">
							(<c:out value="${storeResult.STOREADDRESS }" />) <c:out value="${storeResult.STOREADDRESS1 }" /> <c:out value="${storeResult.STOREADDRESS2 }" />
						</td>
					</tr>
					<tr>
						<th scope="row">인사말</th>
						<td colspan="3"><c:out value="${storeResult.INTROTEXT }" /></td>
					</tr>
					<tr>
						<th scope="row">약도</th>
						<td colspan="3">
							<img src="/file/store/${storeResult.FLE_SAV_NAM }" style="max-width: 100%; height: auto;" />
						</td>
					</tr>
					<tr>
						<th scope="row" colspan="4" style="text-align: center;">서비스품목</th>
					</tr>
					<tr>
						<th scope="row">제조(건조)</th>
						<td colspan="3" id="make"></td>
					</tr>
					<tr>
						<th scope="row">수리</th>
						<td colspan="3" id="repair"></td>
					</tr>
					<tr>
						<th scope="row">판매</th>
						<td colspan="3" id="sell"></td>
					</tr>
				</tbody>
			</table>
			<div align="right" style="text-align: center; height: 50px;">
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
			
			$("#list").on("click", function(e) { // 목록 버튼
				e.preventDefault();
				fn_openStoreList();
			});
			
			var result = "${storeResult.STORESERVICE}";
			fn_setService(result);
		});
		
		function fn_openStoreList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/info/openStoreList.do' />");
			comSubmit.submit();
		}
		
		function fn_setService(result) {
			make1 = result.search("make01");
			make2 = result.search("make02");
			make3 = result.search("make03");
			make4 = result.search("make04");
			make5 = result.search("make05");
			make6 = result.search("make06");
			make7 = result.search("make07");
			
			if(make1 != '-1'){	$("#make").append("어선건조&nbsp;&nbsp;");	}
			if(make2 != '-1'){	$("#make").append("기관장비&nbsp;&nbsp;");	}
			if(make3 != '-1'){	$("#make").append("항해장비&nbsp;&nbsp;");	}
			if(make4 != '-1'){	$("#make").append("통신장비&nbsp;&nbsp;");	}
			if(make5 != '-1'){	$("#make").append("구명설비&nbsp;&nbsp;");	}
			if(make6 != '-1'){	$("#make").append("소방설비&nbsp;&nbsp;");	}
			if(make7 != '-1'){	$("#make").append("어구어망&nbsp;&nbsp;");	}
			
			repair1 = result.search("repair01");
			repair2 = result.search("repair02");
			repair3 = result.search("repair03");
			repair4 = result.search("repair04");
			repair5 = result.search("repair05");
			repair6 = result.search("repair06");
			repair7 = result.search("repair07");
			
			if(repair1 != '-1'){	$("#repair").append("어선수리&nbsp;&nbsp;");	}
			if(repair2 != '-1'){	$("#repair").append("기관장비&nbsp;&nbsp;");	}
			if(repair3 != '-1'){	$("#repair").append("항해장비&nbsp;&nbsp;");	}
			if(repair4 != '-1'){	$("#repair").append("통신장비&nbsp;&nbsp;");	}
			if(repair5 != '-1'){	$("#repair").append("구명설비&nbsp;&nbsp;");	}
			if(repair6 != '-1'){	$("#repair").append("소방설비&nbsp;&nbsp;");	}
			if(repair7 != '-1'){	$("#repair").append("어구어망&nbsp;&nbsp;");	}
			
			sell1 = result.search("sell01");
			sell2 = result.search("sell02");
			sell3 = result.search("sell03");
			sell4 = result.search("sell04");
			sell5 = result.search("sell05");
			sell6 = result.search("sell06");
			sell7 = result.search("sell07");
			
			if(sell1 != '-1'){	$("#sell").append("어선판매&nbsp;&nbsp;");	}
			if(sell2 != '-1'){	$("#sell").append("기관장비&nbsp;&nbsp;");	}
			if(sell3 != '-1'){	$("#sell").append("항해장비&nbsp;&nbsp;");	}
			if(sell4 != '-1'){	$("#sell").append("통신장비&nbsp;&nbsp;");	}
			if(sell5 != '-1'){	$("#sell").append("구명설비&nbsp;&nbsp;");	}
			if(sell6 != '-1'){	$("#sell").append("소방설비&nbsp;&nbsp;");	}
			if(sell7 != '-1'){	$("#sell").append("어구어망&nbsp;&nbsp;");	}
		}
		
	</script>
</body>
</html>

