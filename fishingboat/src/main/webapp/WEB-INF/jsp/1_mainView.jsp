<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/include/1_include-header.jspf"%>
</head>
<body id="main">
	<div id="wrap">
		<%@ include file="/WEB-INF/include/1_include-top.jsp"%>

		<section id="spot">
			<article id="article">				
				<div class="d_status">
					<span class="btn01"><a href="">15건</a></span>
					<span class="btn02"><a href="">70건</a></span>
					<span class="btn03"><a href="">30건</a></span>
				</div>
				<ul class="slidebtn">
				<li class="play"></li>
				<li class="stop"></li>
				<li class="on"></li>
				<li class="off"></li>
				<li class="off"></li>
				</ul>
				<div class="spot_txt">
					<p><span>안전하고 투명한<br/>어선거래</span>를 위해 <span>해양수산부</span>에서</p>
					<p><span>어선거래시스템</span>을 <span>지원</span>합니다</p>
				</div>
				<div class="img"></div>
			</article>
		</section>
		
		<!--매물정보 조회-->
		<section id="section">
			<article id="article">
				<div class="search round">
					<h2>매물정보 조회</h2>
					<form name="sale-searchform" title="매물정보조회">
						<div class="select_box">
							<label for="region">지역 선택</label>
							<select name="" title="지역 선택">
								<option value="all">지역 선택</option>
								<option value=""></option>
								<option value=""></option>
								<option value=""></option>
							</select>
						</div>
						<div class="select_box">
							<label for="shipname">선명 선택</label>
							<select name="" title="선명 선택">						
								<option value="all">선명 선택</option>
								<option value=""></option>
								<option value=""></option>
								<option value=""></option>
							</select>
						</div>
						<div class="select_box">
							<label for="tone">톤급 선택</label>
							<select name="keywordton" id="keywordton" title="톤급 선택">
								<option value="0">톤급 선택</option>
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
						<div class="select_box">
							<label for="fishery">어업종류 선택</label>
							<select name="keywordjob" id="keywordjob" title="어업종류 선택">
								<option value="">어업종류 선택</option>
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
						<input type="button" value="조회" id="search" class="search_input" />
					</form>					
				</div>
			</article>
		</section><!--//매물정보 조회-->

		<section id="section01">
			<article id="article">
				<div class="sale_list">
					<h2>매물정보</h2>
					<div class="listbox">
						<span class="prev"><img src="<c:url value='/images/new/main/btn_left.gif' />" alt="이전" title="이전"/></span>
						<div class="box" id="rollingSellList">
						<c:forEach items="${sellList }" var="row" varStatus="status">
							<c:if test="${row.SELLPIC ne null and row.SELLPIC ne '' }">
								<c:choose>
									<c:when test="${status.index < 4 }">
									<div style="display: block;">
										<a href="">
											<img src="/file/sellpic/${row.SELLPIC }" alt="어선사진" style="height: 122px; width: 184px;" />
											<ul>
											<li>
												<span class="name"><c:out value="${row.SHP_NM }" /></span>
												<c:if test="${row.BROKE_YN eq 'Y' }">
													<span class="btn_broker">중개</span>
												</c:if>
												<span class="btn_sale">급매</span>
											</li>
											<li>
												<span class="port"><c:out value="${row.SHIP_SGG }" /></span>
												<span class="price">￦ <c:out value="${row.HOPE_PRICE }" /></span>
											</li>
											</ul>
										</a>
									</div>
									</c:when>
									<c:otherwise>
									<div style="display: none;">
										<a href="">
											<img src="/file/sellpic/${row.SELLPIC }" alt="어선사진" style="height: 122px; width: 184px;" />
											<ul>
											<li>
												<span class="name"><c:out value="${row.SHP_NM }" /></span>
												<c:if test="${row.BROKE_YN eq 'Y' }">
													<span class="btn_broker">중개</span>
												</c:if>
												<span class="btn_sale">급매</span>
											</li>
											<li>
												<span class="port"><c:out value="${row.SHIP_SGG }" /></span>
												<span class="price">￦ <c:out value="${row.HOPE_PRICE }" /></span>
											</li>
											</ul>
										</a>
									</div>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
						</div>
						<span class="next"><img src="<c:url value='/images/new/main/btn_right.gif' />" alt="다음" title="다음"/></span>
					</div>
					<span class="more"><a href="<c:url value='/deal/openDealList.do' />"><img src="<c:url value='/images/new/main/btn_more.gif' />" alt="더보기" title="더보기"/></a></span>
				</div>
			</article>
			<!--//매물리스트-->
		</section>
		
		<section id="section02">
			<article id="article02">
				<div class="sell">
					<a href="<c:url value='/deal/openBuyList.do' />">
					<h2>내 배 팔기</h2>
					<span>자세히 알아보기</span>
					<img src="<c:url value='/images/new/main/bg_selling.jpg' />" alt="내 배 팔기" title="내 배 팔기"/>
					</a>
				</div>
				<div class="info">
					<a href="">
					<h2>어선거래시스템 소개</h2>
					<img src="<c:url value='/images/new/main/bg_info.jpg' />" alt="어선거래시스템 소개" title="어선거래시스템 소개"/>
					</a>
				</div>	
	
				<div class="findbroker">
					<a href="">
					<h2>어선중개업자 찾기</h2>
					<img src="<c:url value='/images/new/main/bg_srchbroker.jpg' />" alt="어선중개업자 찾기" title="어선중개업자 찾기"/>
					</a>
				</div>
				<div class="buy">
					<a href="<c:url value='/deal/openSellList.do' />">
					<h2>내 배 사기</h2>
					<span>자세히 알아보기</span>
					<img src="<c:url value='/images/new/main/bg_buying.jpg' />" alt="내 배 사기" title="내 배 사기"/>
					</a>
				</div>
			</article>
		</section>
		
		<section id="section03">
			<article id="article">
				<!--팝업-->
				<div class="popup">
					<h2>팝업</h2>
					<ul class="slidebtn">
						<li class="play"></li>
						<li class="stop"></li>
						<li class="on" id="popup1"></li>
						<li class="off" id="popup2"></li>
						<li class="off" id="popup3"></li>
					</ul>
					<div class="popupbox" id="popupdiv1" style="display: block;">
						<a href="">
							<img src="<c:url value='/images/new/main/popup01.jpg' />" alt="새로워진 어선거래시스템" title="새로워진 어선거래시스템"/>
						</a>
					</div>
					<div class="popupbox" id="popupdiv2" style="display: none;">
						<a href="">
							<img src="<c:url value='/images/new/main/popup01.jpg' />" alt="새로워진 어선거래시스템" title="새로워진 어선거래시스템"/>
						</a>
					</div>
					<div class="popupbox" id="popupdiv3" style="display: none;">
						<a href="">
							<img src="<c:url value='/images/new/main/popup01.jpg' />" alt="새로워진 어선거래시스템" title="새로워진 어선거래시스템"/>
						</a>
					</div>
				</div>	
				<!--//팝업-->
				<!--중개인 바로가기-->
				<div class="brokersite">
					<a href="">
						<img src="<c:url value='/images/new/main/brokerweb.jpg' />" alt="중개인 교육평가시스템 바로가기" title="중개인 교육평가시스템 바로가기"/>
					</a>
				</div>
				<!--공지사항 -->
				<div class="news_area">
					<div class="newstit">
						<h2>공지사항</h2>
					</div>
					<div class="viewbox">
						<ul class="view_list">
							<c:forEach items="${noticeList }" var="row" varStatus="status">
								<c:if test="${status.index < 5 }">
									<li>
										<a href="#this" name="notice_title">
											<c:choose>
												<c:when test="${fn:length(row.TITLE) > 25 }">
													<c:out value="${fn:substring(row.TITLE, 0, 25) }" /> ...
												</c:when>
												<c:otherwise>
													<c:out value="${row.TITLE }" />
												</c:otherwise>
											</c:choose>
										</a>
										<input type="hidden" id="notice_seq" name="notice_seq" value="${row.SEQ }">
										<span class="date"><c:out value="${row.REG_DAT }" /></span>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<span class="more">
						<a href="<c:url value='/community/openNoticeList.do' />">
							<img src="<c:url value='/images/new/main/btn_more.gif' />" alt="더보기" title="더보기"/>
						</a>
					</span>
				</div>
				<!--//공지사항-->
			</article>
		</section>
		
		<div id="rel_banner">
			<div id="article">
				<ul class="banner round">
					<li>
						<a href="https://www.mof.go.kr" target="_blank"> 
							<img title="해양수산부" alt="[새창열기]해양수산부 바로가기" src="<c:url value='/images/new/main/bn_agency01.gif' />">
						</a>
					</li>	 
					<li>
						<a href="https://www.kst.or.kr" target="_blank">
							<img title="선박안전기술공단" alt="[새창열기]선박안전기술공단 바로가기" src="<c:url value='/images/new/main/bn_agency02.gif' />">
						</a>
					</li>
					<li>
						<a href="https://www.nfrdi.re.kr" target="_blank">
							<img title="국립수산과학원" alt="[새창열기]국립수산과학 바로가기" src="<c:url value='/images/new/main/bn_agency03.gif' />">
						</a>
					</li>
					<li>
						<a href="http://www.suhyup.co.kr" target="_blank">
							<img title="수협" alt="[새창열기]수협 바로가기" src="<c:url value='/images/new/main/bn_agency04.gif' />">
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/include/1_include-footer.jsp"%>

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
			
			$("a[name='notice_title']").on("click", function(e) { //제목
				e.preventDefault();
				fn_openNoticeDetail($(this));
			});
			
			/* $('#slider').bxSlider({
				slideWidth: 300,
				minSlides: 2,
				maxSlides: 3,
				moveSlides: 1,
				slideMargin: 10
			}); */
			
			// 매물정보 rolling
			rollingJS.sellRolling("rollingSellList");
			
			// 팝업 rolling
			rollingJS.popRolling("popup", true);
		});
		
		function fn_openNoticeDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/openNoticeDetail.do' />");
			comSubmit.addParam("seq", obj.parent().find("#notice_seq").val());
			comSubmit.submit();
		}
		
		// 이미지 롤링
		var rollingJS = {
			sellRolling : function (autoRollingId){
				var findElement = $("#"+autoRollingId);
				var itemLength = findElement.find(" > div").length;
				var prev = $(".listbox").find(".prev");
				var next = $(".listbox").find(".next");
				//var timer = 0;
				//var speed = 3000;
				var move = 160;
				
				if(findElement.children().length <= 4){
					prev.hide();
					next.hide();
				}
				
				prev.on({
					"click" : function(){
						movePrevSlide();
					}
				});
				
				next.on({
					"click" : function(){
						moveNextSlide();
					}
				});
			
				function movePrevSlide(){
					var lastChild = findElement.children().filter(":last-child").clone(true);
					lastChild.prependTo(findElement);
					//findElement.css("left","-"+move+"px");
					findElement.children().filter(":last-child").remove();
					//findElement.children().animate({"left":"0"});
					
					findElement.children().filter(function(index) {
						if(index < 4){
							console.log(index);
							findElement.children().eq(index).fadeIn();
						} else {
							findElement.children().eq(index).hide();
						}
					});
				}
			
				function moveNextSlide(){
					var firstChild = findElement.children().filter(":first-child").clone(true);
					firstChild.appendTo(findElement);
					findElement.children().filter(":first-child").remove();
					//findElement.css("left","0");
					//findElement.children().animate({"left":"-"+move+"px"});
					
					findElement.children().filter(function(index) {
						if(index < 4){
							console.log(index);
							findElement.children().eq(index).fadeIn();
						} else {
							findElement.children().eq(index).hide();
						}
					});
				}
			},
			popRolling : function (autoRollingId, playBoolean){
				var time = 500;
				var idx = idx2 = 0;
				var slide_width = $("."+autoRollingId).width();
				var slide_count = $(".popupbox").size();
				// $("#slider li:first").css("display", "block");
				
				$(".popup .slidebtn .off").click(function(){
					alert("HEY!");
				});
			}
		}
	</script>
</body>
</html>

