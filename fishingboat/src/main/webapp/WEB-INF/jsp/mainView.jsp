<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/include/include-header.jspf"%>

	<style>
	.carousel-inner > .item > img,
	.carousel-inner > .item > a > img {
		width: 100%;
		margin: auto;
	}
	</style>
</head>
<body>

	<div class="container">

		<%@ include file="/WEB-INF/include/include-top.jsp"%>

		<div id="content">
			<br />
			<div class="row">
				<div class="col-sm-8">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
							<li data-target="#myCarousel" data-slide-to="3"></li>
						</ol>
	
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="/file/images/slider/fishingboat-01.jpg" alt="어선01">
								<div class="carousel-caption">
									<h3>어선 01</h3>
									<p>어선거래</p>
								</div>
							</div>
							<div class="item">
								<img src="/file/images/slider/fishingboat-02.jpg" alt="어선02">
								<div class="carousel-caption">
									<h3>어선 02</h3>
									<p>어선관련정보</p>
								</div>
							</div>
							<div class="item">
								<img src="/file/images/slider/fishingboat-03.jpg" alt="어선03">
								<div class="carousel-caption">
									<h3>어선 03</h3>
									<p>민원안내</p>
								</div>
							</div>
							<div class="item">
								<img src="/file/images/slider/fishingboat-04.jpg" alt="어선04">
								<div class="carousel-caption">
									<h3>어선 04</h3>
									<p>커뮤니티</p>
								</div>
							</div>
						</div>
	
						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> 
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> 
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="well">
						<h4 align="center" style="margin-top: 0px;"><b>알림창</b></h4>
						<div id="myCarousel2" class="carousel slide" data-ride="carousel">
							<c:set var="popCnt" value="${fn:length(popupList) }" />
							
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<c:forEach var="i" begin="0" end="${popCnt - 1 }" varStatus="status">
									<li data-target="#myCarousel2" data-slide-to="${i }" <c:if test="${i eq 0 }">class='active'</c:if>></li>
								</c:forEach>
							</ol>
		
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<c:forEach items="${popupList }" var="row" varStatus="status">
									<div class="item<c:if test="${row.RNUM eq '1' }"> active</c:if>">
										<img src="/file/popup/${row.SAV_FLE_NAM }" alt="${row.TITLE }" style="width: 100%; height: 200px;">
										<div class="carousel-caption">
											<h3><c:out value="${row.TITLE }" /></h3>
										</div>
									</div>
								</c:forEach>
							</div>
		
							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev"> 
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next"> 
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div class="well">
						<p><b>매물현황 : </b> <c:out value="${shipTotal.DEAL_COUNT }" /> 건</p>
						<p><b>매수 : </b> <c:out value="${shipTotal.SELL_COUNT }" /> 건</p>
						<p><b>매도 : </b> <c:out value="${shipTotal.BUY_COUNT }" /> 건</p>
					</div>
				</div>
			</div>
			<hr style="margin : 0;">
			<div class="container text-center">
				<br>
				<div class="row">
					<div class="col-sm-3">
						<div class="well" style="padding: 10px;">
							<h3><b>매물정보 조회</b></h3>
							<br />
							<form class="form-horizontal">
								<div class="form-group">
									<label class="control-label col-sm-4" for="keywordnum1">어선번호</label>
									<div class="col-sm-4">
										<input class="form-control" id="keywordnum1" name="keywordnum1" type="text" value="${param.keywordnum1 }">
									</div>
									<div class="col-sm-4">
										<input class="form-control" id="keywordnum2" name="keywordnum2" type="text"> 
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="keywordnam">어선명</label>
									<div class="col-sm-8">
										<input class="form-control" id="keywordnam" name="keywordnam" type="text">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="keywordton">총톤수</label>
									<div class="col-sm-8">
										<select class="form-control" name="keywordton" id="keywordton">
											<option value="0">선택</option>
											<option value="1">2톤 이하</option>
											<option value="2">2톤 ~ 3톤</option>
											<option value="3">3톤 ~ 5톤</option>
											<option value="4">5톤 ~ 10톤</option>
											<option value="5">10톤 ~ 20톤</option>
											<option value="6">20톤 ~ 40톤</option>
											<option value="7">40톤 ~ 80톤</option>
											<option value="8">80톤 이상</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="keywordarea">지역</label>
									<div class="col-sm-8">
										<input class="form-control" id="keywordarea" name="keywordarea" type="text">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="keywordjob">어업종류</label>
									<div class="col-sm-8">
										<select class="form-control" name="keywordjob" id="keywordjob">
											<option value="">선택</option>
											<option value="01">허가</option>
											<option value="02">한천가공업</option>
											<option value="03">건제품가공업</option>
											<option value="04">연안선망어업</option>
											<option value="05">연안선인망어업</option>
											<option value="06">원양기선저인망어업</option>
											<option value="07">원양봉수망어업</option>
											<option value="08">연근해어획물운반업</option>
											<option value="09">낚시어선업</option>
											<option value="10">수하식양식어업</option>
											<option value="11">근해자망어업</option>
											<option value="12">연안자망어업</option>
											<option value="13">양식어업</option>
											<option value="14">정치어업</option>
											<option value="15">외줄낚시어업</option>
											<option value="16">분기초망어업</option>
											<option value="17">어유(간유)가공업</option>
											<option value="18">관상어양식어업</option>
											<option value="19">근해연승어업</option>
											<option value="20">원양통발어업</option>
											<option value="21">통발어업</option>
											<option value="22">냉동.냉장업</option>
											<option value="23">바닥식양식어업</option>
											<option value="24">축제식양식어업</option>
											<option value="25">잠수기어업</option>
											<option value="26">원양선망어업</option>
											<option value="27">어로어업</option>
											<option value="28">자망어업</option>
											<option value="29">종묘채포어업</option>
											<option value="30">어살어업</option>
											<option value="31">기타신고어업</option>
											<option value="32">수산피혁가공업</option>
											<option value="33">젓갈.절임가공업</option>
											<option value="34">마을어업</option>
											<option value="35">연안통발어업</option>
											<option value="36">연안연승어업</option>
											<option value="37">근해안강망어업</option>
											<option value="38">연안복합어업</option>
											<option value="39">각망어업</option>
											<option value="40">패류채취어업</option>
											<option value="41">연승어업</option>
											<option value="42">연안채낚기어업</option>
											<option value="43">손꽁치어업</option>
											<option value="44">해조채취어업</option>
											<option value="45">활선어운반선</option>
											<option value="46">해조류가공업</option>
											<option value="47">가두리양식어업</option>
											<option value="48">협동양식어업</option>
											<option value="49">근해봉수망어업</option>
											<option value="50">나잠어업</option>
											<option value="51">시험어업</option>
											<option value="52">원양안강망어업</option>
											<option value="53">낚시업</option>
											<option value="54">육상양식어업</option>
											<option value="55">연안형망어업</option>
											<option value="56">육상종묘생산어업</option>
											<option value="57">냉동운반선</option>
											<option value="58">근해채낚기어업</option>
											<option value="59">문어단지어업</option>
											<option value="60">연안안강망어업</option>
											<option value="61">연안들망어업</option>
											<option value="62">낭장망어업</option>
											<option value="63">해선망어업</option>
											<option value="64">맨손어업</option>
											<option value="65">투망어업</option>
											<option value="66">원양트롤어업</option>
											<option value="67">원양채낚기어업</option>
											<option value="68">공동어업</option>
											<option value="69">조류채취어업</option>
											<option value="70">연안유자망어업</option>
										</select>
									</div>
								</div>
							</form>
							<a href="#this" id="search" class="btn btn-primary btn-block">조회하기</a>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="thumbnail">
							<img src="/file/images/sell_button.png" alt="어선매수" style="width: 75%">
							<p><strong>어선매수</strong></p>
							<p>매수어선 신청 및 매수절차를 확인하실 수 있습니다.</p>
							<a href="<c:url value='/deal/openSellList.do' />" class="btn btn-danger btn-block">자세히 알아보기</a>
						</div>
						<div class="thumbnail">
							<img src="/file/images/buy_button.png" alt="어선매도" style="width: 75%">
							<p><strong>어선매도</strong></p>
							<p>매도어선 등록 및 매도절차를 확인하실 수 있습니다.</p>
							<a href="<c:url value='/deal/openBuyList.do' />" class="btn btn-danger btn-block">자세히 알아보기</a>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="well">
							<h4>공지사항&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/community/openNoticeList.do' />" style="font-size: 14px;">더보기</a></h4>
							<table class="table table-bordered">
								<colgroup>
									<col width="80%" />
									<col width="*" />
								</colgroup>
								<thead>
									<tr>
										<td><b>내용</b></td>
										<td><b>등록일</b></td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${noticeList }" var="row" varStatus="status">
										<c:if test="${status.index < 3 }">
											<tr>
												<td>
													<c:choose>
														<c:when test="${fn:length(row.TITLE) > 14 }">
															<c:out value="${fn:substring(row.TITLE, 0, 14) }" /> ...
														</c:when>
														<c:otherwise>
															<c:out value="${row.TITLE }" />
														</c:otherwise>
													</c:choose>
												</td>
												<td><c:out value="${row.REG_DAT }" /></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="well">
							<h4>최근 매물&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/deal/openDealList.do' />" style="font-size: 14px;">더보기</a></h4>
							<table class="table table-bordered">
								<colgroup>
									<col width="80%" />
									<col width="*" />
								</colgroup>
								<thead>
									<tr>
										<td><b>정보</b></td>
										<td><b>등록일</b></td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${dealList }" var="row" varStatus="status">
										<c:if test="${status.index < 3 }">
											<tr>
												<td>
													[<c:out value="${row.TITLE }" />] <c:out value="${row.TON }" /> 톤 <c:out value="${row.CODE_CTN }" /> <c:out value="${row.HOPE_PRICE }" /> 원
												</td>
												<td><c:out value="${row.REG_DAT }" /></td>
											</tr>
										</c:if>
									</c:forEach>
									<!-- [<c:out value="${row.TITLE }" />] <c:out value="${row.TON }" /> 톤 <c:out value="${row.CODE_CTN }" /> <c:out value="${row.HOPE_PRICE }" /> 원 -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<hr style="margin : 0;">
			</div>
			<div class="row" style="padding: 25px;">
				<div class="col-md-3">
					<div class="thumbnail" style="margin: 0;">
						<a href="https://www.mof.go.kr" target="_blank"> 
							<img src="<c:url value='/images/banner/bn01.png' />" alt="해양수산부" style="width: 100%">
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail" style="margin: 0;">
						<a href="https://www.kst.or.kr" target="_blank"> 
							<img src="<c:url value='/images/banner/bn02.png' />" alt="선박안전기술공단" style="width: 100%">
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail" style="margin: 0;">
						<a href="https://www.nfrdi.re.kr" target="_blank">
							<img src="<c:url value='/images/banner/bn03.png' />" alt="국립수산과학원" style="width: 100%">
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail" style="margin: 0;">
						<a href="http://www.suhyup.co.kr" target="_blank"> 
							<img src="<c:url value='/images/banner/bn04.png' />" alt="수협중앙회" style="width: 100%">
						</a>
					</div>
				</div>
			</div>
		</div>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>

	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>

	<script type="text/javascript">
		$(document).ready(function() {
			fn_pageLog();
			
			// 매물정보 조회
			$("#search").on("click", function(e) { // 조회하기 버튼
				e.preventDefault();
				fn_searchDealList();
			});
			
			function fn_searchDealList(){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/deal/openDealList.do' />");
				comSubmit.addParam("keywordnum1", $("#keywordnum1").val());
				comSubmit.addParam("keywordnum2", $("#keywordnum2").val());
				comSubmit.addParam("keywordnam", $("#keywordnam").val());
				comSubmit.addParam("keywordton", $("#keywordton").val());
				comSubmit.addParam("keywordarea", $("#keywordarea").val());
				comSubmit.addParam("keywordjob", $("#keywordjob").val());
				comSubmit.submit();
			}
			
		});
	</script>
</body>
</html>

