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
		
		<div id="content" style="min-height: 450px;">
		
	<c:choose>
		<c:when test="${mberInfo != null and applicationDetail != null }">
			<div class="row">
				<div class="col-md-12">
					<h3><i class="glyphicon glyphicon-pencil"></i>&nbsp;<b>교육신청</b></h3>
					<hr />
					<p>
						<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 교육신청된 내용을 확인하시고 싶으시면, 내용확인 버튼을 눌러주세요.
						<br /><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 내용 확인 후 교육을 취소하실 경우 하단에 교육 취소 버튼을 눌러주세요.
					</p>
					<div class="btn btn-info" style="width: 50%;" data-toggle="collapse" data-target="#applicationDetail">내용확인</div>
				</div>
			</div>
			<hr>
			<div class="alert alert-danger fade in">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<p><strong>알림!</strong> 교육신청된 내용이 있습니다.</p>
			</div>
			<div class="row collapse" id="applicationDetail">
				<h3 style="padding-left: 30px;"><span class="glyphicon glyphicon-education"></span>&nbsp;&nbsp;교육신청 내용</h3>
				<hr />
				<form id="applicationUpdateFrm" method="post">
					<input type="hidden" name="seq" value="<c:out value='${applicationDetail.SEQ }' />" />
					<input type="hidden" name="edu_num" value="<c:out value='${applicationDetail.EDU_NUM }' />" />
					
					<table class="table table-striped table-bordered" style="font-size: 15px;">
						<colgroup>
							<col width="14%" />
							<col width="15%" />
							<col width="28%" />
							<col width="15%" />
							<col width="28%" />
						</colgroup>
						<tbody>
							<tr>
								<td rowspan="3" align="center">
									<img alt="반명함사진" src="/file/education/${applicationDetail.EDU_IMG_SAV_NAM }" style="height: 4cm;"/>
								</td>
								<th>성명 : </th>
								<td><c:out value="${applicationDetail.EDU_NAM }" /></td>
								<th>접수번호 : </th>
								<td><c:out value="${applicationDetail.EDU_NUM }" /></td>
							</tr>
							<tr>
								<th>생년월일 : </th>
								<td><c:out value="${applicationDetail.EDU_BIRTH }" /></td>
								<th>과정 : </th>
								<td>
									<c:out value="${applicationDetail.EDU_YEAR }" />년&nbsp;&nbsp;<c:out value="${applicationDetail.EDU_CHASU }" />차&nbsp;&nbsp;<c:out value="${applicationDetail.EDU_CODE_NAM }" />
								</td>
							</tr>
							<tr>
								<th>주소 : </th>
								<td colspan="3">
									<p>(<c:out value="${applicationDetail.EDU_POST_CD }" />) <c:out value="${applicationDetail.EDU_ADDR1 }" /> <c:out value="${applicationDetail.EDU_ADDR2 }" /></p>
									<p style="text-align: right;">(전화번호 : <c:out value="${applicationDetail.EDU_PHONE }" />, 전자우편 : <c:out value="${applicationDetail.EDU_EMAIL }" />)</p>
								</td>
							</tr>
							<tr>
								<td colspan="5"></td>
							</tr>
							<tr>
								<th style="text-align:center;">시설이용여부</th>
								<th>기숙사 사전예약 : </th>
								<td colspan="3">
									<c:choose>
										<c:when test="${applicationDetail.EDU_DOM_YN eq 'y' }">이용함</c:when>
										<c:when test="${applicationDetail.EDU_DOM_YN eq 'n' }">이용안함</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th></th>
								<td colspan="4">
									<table class="table table-striped table-bordered">
										<colgroup>
											<col width="15%" />
											<col width="11%" />
											<col width="15%" />
											<col width="24%" />
											<col width="*" />
										</colgroup>
										<tbody>
											<tr>
												<td colspan="5" align="right">(기준 : 3박4일)</td>
											</tr>
											<tr align="center">
												<td colspan="2"><b>구 분</b></td>
												<td><b>납부금액</b></td>
												<td><b>대 상</b></td>
												<td><b>비 고</b></td>
											</tr>
											<tr>
												<td rowspan="2" align="center" style="vertical-align: middle;">기숙사<br />(식비포함)</td>
												<td>2인 1실</td>
												<td align="right"><b>67,500원</b></td>
												<td rowspan="2" align="center" style="vertical-align: middle;">기숙사 이용자</td>
												<td rowspan="2">
													- 숙박(3박), 식비 포함<br/>
													* 식사는 1일차 중식부터 4일차 조식까지 제공(9식)
												</td>
											</tr>
											<tr>
												<td>4인 1실</td>
												<td align="right"><b>55,500원</b></td>
											</tr>
											<tr>
												<td colspan="2" align="center" style="vertical-align: middle;">구내식당(중식)</td>
												<td align="right"><b>10,500원</b></td>
												<td align="center" style="vertical-align: middle;">교육생전원<br />(기숙사 이용자 제외)</td>
												<td>* 3식 기준(1식 = 3,500원)</td>
											</tr>
										</tbody>
									</table>
									<p style="color: red;"><span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;&nbsp;사전예약자 중 7월 23일(일)에 이용을 원하는 교육생은 <b style="text-decoration: underline;">22:00까지 기숙사 안내실</b> 도착</p>
								</td>
							</tr>
							<tr>
								<th style="text-align:center;">교육일정</th>
								<th>교육일시 : </th>
								<td><c:out value="${applicationDetail.EDU_START_DATE }" /> ~ <c:out value="${applicationDetail.EDU_END_DATE }" /></td>
								<th>교육장소 : </th>
								<td><c:out value="${applicationDetail.EDU_LOC }" /></td>
							</tr>
						</tbody>
					</table>
				</form>
				<div align="center" style="text-align: center;">
					<button class="btn btn-danger" id="applicationUpdate" style="width: 50%">교육신청 취소</button>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row">
				<div class="col-md-12">
					<h3><i class="glyphicon glyphicon-pencil"></i>&nbsp;<b>교육신청</b></h3>
					<hr />
					<p>
						<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 어선중개업 신청을 위해서는 교육을 이수해야 합니다.
						<br /><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 교육 신청은 약관동의 후 사용 가능 합니다. 약관 동의 후 내용을 모두 작성하신 후 교육신청등록 버튼을 눌러주세요.
						<br /><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 임시아이디는 접수번호이며, 비밀번호는 교육 신청 시 입력하신 정보를 사용하시면 됩니다.
						<br /><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> 한번 신청된 정보는 수정 할 수 없습니다. 내용을 확인 하시고 교육을 신청해주세요.
					</p>
					
					<!-- check.check 2017.06.08 실명인증은 보류됨 -->
					<!-- <div class="btn btn-danger" style="width: 50%;" data-toggle="modal" data-target="#myModalAuth" id="myModalAuthBtn">실명인증</div> -->
					
					<!-- check.check 개발중 -->
					<!-- <div class="btn btn-danger" style="width: 50%; display: none;" data-toggle="modal" data-target="#myModalAgree" id="myModalAgreeBtn">약관동의</div> -->
					<div class="btn btn-danger" style="width: 50%;" data-toggle="modal" data-target="#myModalAgree" id="myModalAgreeBtn">약관동의</div>
					
				</div>
			</div>
			<hr>
			<!-- check.check 신청서 항목 나올 장소! -->
			<div class="row" id="application_form" style="display: none;">
				<div class="col-md-offset-1 col-md-10">
					<div class="well">
						<h3 style="padding-left: 30px;"><span class="glyphicon glyphicon-education"></span>&nbsp;&nbsp;교육신청서</h3>
						<p style="padding-left: 30px;"><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>&nbsp;&nbsp;아래의 항목을 모두 작성해주세요.</p>
						<hr />
						<form class="form-horizontal" id="applicationFrm" method="post">
							<input type="hidden" id="ORIGINAL_FILE_NAME" name="ORIGINAL_FILE_NAME" value="" />
							<input type="hidden" id="STORED_FILE_NAME" name="STORED_FILE_NAME" value="" />
							
							<div class="form-group">
								<label class="control-label col-sm-3" for="education"><span style="color: red;">*</span>&nbsp;교육과정 : </label>
								<div class="col-sm-7">
									<select class="form-control" name="edu_infor_seq" id="edu_infor_seq">
										<option value="">선택하세요.</option>
										<c:forEach items="${eduList }" var="row" varStatus="status">
											<option value="${row.EDU_SEQ }">
												<c:out value="${row.EDU_YEAR }" />년&nbsp;&nbsp;<c:out value="${row.EDU_CHASU }" />차&nbsp;&nbsp;<c:out value="${row.EDU_CODE_NAM }" />
											</option>
										</c:forEach>
										<!-- <option value="0">어선중개업자(신규)</option>
										<option value="1">어선중개업자(보수)</option> -->
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="faceImage"><span style="color: red;">*</span>&nbsp;반명함판 사진 : </label>
								<div class="col-sm-7">
									<input type="file" class="form-control" id="faceImage" name="faceImage">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-7" style="color: red;">
									<span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;&nbsp;최근 6개월 이내에 촬영한 반명함판 사진(3.0cm x 4.0cm)
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="name"><span style="color: red;">*</span>&nbsp;성명 : </label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="name" name="name">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="birth"><span style="color: red;">*</span>&nbsp;생년월일 : </label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="birth" name="birth">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="email"><span style="color: red;">*</span>&nbsp;이메일 : </label>
								<div class="col-sm-2" style="padding-right: 0px;">
									<input type="text" class="form-control input-sm" name="email" id="email">
								</div>
								<div class="col-sm-1" style="font-size: 15px; text-align: center; margin-top: 5px;">
									@
								</div>
								<div class="col-sm-2" style="padding-left: 0px;">
									<input type="text" class="form-control input-sm" name="email2" id="email2" readonly="readonly">
								</div>
								<div class="col-sm-2" style="padding-left: 0px;">
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
							<div class="form-group">
								<label class="control-label col-sm-3" for="phone"><span style="color: red;">*</span>&nbsp;전화번호 : </label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="phone" name="phone" onkeypress="javascript:onlyNumber();">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="sample6_postcode"><span style="color: red;">*</span>&nbsp;주소 : </label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="sample6_postcode" name="sample6_postcode" readonly="readonly">
								</div>
								<div class="col-sm-3">
									<input type="button" class="btn" value="우편번호 찾기" onclick="sample6_execDaumPostcode();">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-7">
									<input type="text" class="form-control" id="sample6_address" name="sample6_address" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-7">
									<input type="text" class="form-control" id="sample6_address2" name="sample6_address2">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="dormitoryYN"><span style="color: red;">*</span>&nbsp;기숙사 사전예약 : </label>
								<div class="col-sm-7">
									<label class="radio-inline"><input type="radio" name="dormitoryYN" value="y">이용함</label>&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="radio-inline"><input type="radio" name="dormitoryYN" value="n" checked="checked">이용안함</label>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-9 table-responsive">
									<!-- <span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;&nbsp;사전예약자에 한해 2인실(12,000원/1박) 또는 4인실(8,000원/1박)을 배정하고 이용료는 입실시 운영업체에 납부<br/>
									<span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;&nbsp;기숙사 비치용품 : 비누, 치약, 수건(1일 1장), 샴푸 -->
									
									<table class="table table-striped table-bordered">
										<colgroup>
											<col width="15%" />
											<col width="11%" />
											<col width="15%" />
											<col width="24%" />
											<col width="*" />
										</colgroup>
										<tbody>
											<tr>
												<td colspan="5" align="right">(기준 : 3박4일)</td>
											</tr>
											<tr align="center">
												<td colspan="2"><b>구 분</b></td>
												<td><b>납부금액</b></td>
												<td><b>대 상</b></td>
												<td><b>비 고</b></td>
											</tr>
											<tr>
												<td rowspan="2" align="center" style="vertical-align: middle;">기숙사<br />(식비포함)</td>
												<td>2인 1실</td>
												<td align="right"><b>67,500원</b></td>
												<td rowspan="2" align="center" style="vertical-align: middle;">기숙사 이용자</td>
												<td rowspan="2">
													- 숙박(3박), 식비 포함<br/>
													* 식사는 1일차 중식부터 4일차 조식까지 제공(9식)
												</td>
											</tr>
											<tr>
												<td>4인 1실</td>
												<td align="right"><b>55,500원</b></td>
											</tr>
											<tr>
												<td colspan="2" align="center" style="vertical-align: middle;">구내식당(중식)</td>
												<td align="right"><b>10,500원</b></td>
												<td align="center" style="vertical-align: middle;">교육생전원<br />(기숙사 이용자 제외)</td>
												<td>* 3식 기준(1식 = 3,500원)</td>
											</tr>
										</tbody>
									</table>
									<p style="color: red;"><span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;&nbsp;사전예약자 중 7월 23일(일)에 이용을 원하는 교육생은 <b style="text-decoration: underline;">22:00까지 기숙사 안내실</b> 도착</p>
								</div>
							</div>
							<!-- <div class="form-group">
								<label class="control-label col-sm-3" for="cafeteriaYN"><span style="color: red;">*</span>&nbsp;식당 이용확약 : </label>
								<div class="col-sm-7">
									<label class="radio-inline"><input type="radio" name="cafeteriaYN" value="y1">3식 (10,500원, 1·2·3일차 중식)</label><br/>
									<label class="radio-inline"><input type="radio" name="cafeteriaYN" value="y2">9식 (31,500원,1일차 중식~4일차 조식, 기숙사 이용자에 적합)</label><br/>
									<label class="radio-inline"><input type="radio" name="cafeteriaYN" value="n" checked="checked">이용안함 (외부식당 이용자)</label>
								</div>
							</div> -->
							<!-- <div class="form-group">
								<div class="col-sm-offset-3 col-sm-7" style="color: red;">
									<span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;&nbsp;1식 3,500원으로 교육 1일차 교육안내시간에 운영업체에 납부
								</div>
							</div> -->
							<!-- check.check 하단 영역은 협의 후 진행 -->
							<div class="form-group">
								<label class="control-label col-sm-3" for="pwd"><span style="color: red;">*</span>&nbsp;비밀번호 : </label>
								<div class="col-sm-7">
									<input type="password" class="form-control" id="pwd" name="pwd">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-7" style="color: red;">
									<span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;&nbsp;로그인 시 사용할 비밀번호를 입력해주세요.<br />
									<span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;&nbsp;9~15글자, 영대소문자, 숫자, 특수문자 포함하여 입력해주세요.
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="pwd2"><span style="color: red;">*</span>&nbsp;비밀번호 확인 : </label>
								<div class="col-sm-7">
									<input type="password" class="form-control" id="pwd2" name="pwd2">
								</div>
							</div>
							<hr/>
							<div class="form-group">
								<label class="control-label col-sm-2" for="etc">&nbsp;비고</label>
								<div class="col-sm-10">
									<p><span>*</span>&nbsp;교육장내 기숙사 및 식당 이용 안내</p>
									<p>&nbsp;- 외부 위탁업체(D&amp;T서비스, (051)620-5780)에서 운영하고 있으며 숙식비용은 교육생 부담</p>
									<p>&nbsp;- 기숙사는 사전예약자에 한해 이용가능하며 이용료는 입실시 운영업체에 직접납부 </p>
									<p>&nbsp;- 기숙사 비치용품 : 비누, 치약, 수건(1일 1장), 샴푸 </p>
									<p>&nbsp;- 식당은 확정인원에 한하여 운영함에 따라 추후 환불, 변경, 취소 불가</p>
								</div>
							</div>
							<hr/>
							<div class="form-group" id="applicatoinInsertAlert" style="display: none;">
								<div class="col-sm-12" align="center">
									<p style="color: red;"><span>*</span>&nbsp;&nbsp;입력하신 내용을 다시 한 번 확인하시고, 교육신청완료 버튼을 눌러주세요.</p>
									<p style="color: red;"><span>*</span>&nbsp;&nbsp;교육신청완료 이후에는 수정이 불가능합니다.</p>
								</div>
							</div>
						</form>
						<div align="center" style="text-align: center;">
							<button class="btn btn-info" id="applicationCheck" style="width: 50%">교육신청</button>
							<button class="btn btn-info" id="applicationInsert" style="width: 25%; display: none;">교육신청완료</button>&nbsp;&nbsp;
							<button class="btn btn-danger" id="applicationReInsert" style="width: 25%; display: none;">다시입력</button>
						</div>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
			
		</div>
		
		<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
	
	</div>
	
	<!-- 이용약관동의 -->
	<div class="modal fade" id="myModalAgree" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">어선중개업 약관동의</h4>
				</div>
				<div class="modal-body">
					약관내용
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onClick='agreebtnactive("#applicationFrm",0,"#myModalAgree","#myModalAgreeBtn","동의함")'>동의</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 어선중개업자 실명인증 -->
	<div class="modal fade" id="myModalAuth" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<form name="reqKMCISForm" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">실명인증</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="cpId" value = "">
						<input type="hidden" name="urlCode" value="">
						<input type="hidden" name="certNum" value='<%=reqNum%>'>
						<input type="hidden" name="date" value="<%=day%>">
						<input type="hidden" name="certMet" value="M">
						<input type="hidden" name="nation" value="0">
						<input type="hidden" name="plusInfo" value="">
						<input type="hidden" name="tr_url" value="http://fishboat6.kgis.kr:8080/authend.jsp">
						<input type="hidden" name="tr_add" value="N">
						<div class="form-group">
							<label for="InputSname"><strong>이용자성명</strong></label>
							<input type="text" name="name" class="form-control" id="InputSname"  placeholder="이용자성명">
						</div>
						<div class="form-group">
							<label for="InputSphoneNo"><strong>휴대폰번호</strong> <small >(숫자로만 입력해주세요)</small></label>
							<input type="number" name="phoneNo" class="form-control" id="InputSphoneNo"  placeholder="휴대폰번호" maxlength="11">
						</div>
						<div class="form-group">
							<label for="InputSbirthDay"><strong>생년월일</strong> <small >(숫자로만 입력해주세요 ex:19720120)</small></label>
							<input type="number" name="birthDay" class="form-control" id="InputSbirthDay"  placeholder="생년월일" maxlength="8">
						</div>
						<fieldset class="form-group">
							<label><strong>이통사</strong></label>
							<div class="form-check">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="phoneCorp" id="optionsRadios1" value="SKT" >
									SKT
								</label>
								&nbsp;&nbsp;
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="phoneCorp" id="optionsRadios2" value="KTF">
									KT
								</label>
								&nbsp;&nbsp;
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="phoneCorp" id="optionsRadios3" value="LGT" >
									LG U+
								</label>
								<br /><br />
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="phoneCorp" id="optionsRadios4" value="SKM">
									SKTmvno
								</label>
								&nbsp;&nbsp;
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="phoneCorp" id="optionsRadios5" value="KTM">
									KTmvno
								</label>
								&nbsp;&nbsp;
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="phoneCorp" id="optionsRadios5" value="LGM">
									LGU+mvno
								</label>
							</div>
						</fieldset>
						<fieldset class="form-group">
							<label><strong>이용자성별</strong></label>
							<div class="form-check">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="gender" id="optionsRadios21" value="0" >
									남
								</label>
								&nbsp;&nbsp;
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="gender" id="optionsRadios22" value="1" >
									여
								</label>
							</div>
						</fieldset>
	
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						<input type="submit" class="btn btn-info" value="실명인증" onclick= "javascript:openKMCISWindow();">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			// fn_pageLog();
			
			$("#birth").datepicker({
				dateFormat: "yy-mm-dd",
				changeMonth: true, 
				changeYear: true,
				dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
				dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
				monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			});
			
			$("#faceImage").change(function() {
				if($(this).val() != "") {
					// 확장자 검사
					var ext = $(this).val().split(".").pop().toLowerCase();
					
					if($.inArray(ext, ["gif","jpg","jpeg","png"]) == -1) {
						alert("이미지 파일을 업로드 해주세요.");
						$(this).val("");
						return;
					}
					// 가로, 세로 길이 검사
					var file = this.files[0];
					var _URL = window.URL || window.webkitURL;
					var img = new Image();
					
					img.src = _URL.createObjectURL(file);
					img.onload = function() {
						// check.check
						console.log(img.width + " , " + img.height);
						if(img.width != 300 || img.height != 400){
							alert("3.0cm x 4.0cm 사이즈의 사진을 올려주세요.");
							$("#faceImage").val("");
							return;
						}
					}
				}
			});
			
			// 교육 신청 버튼 클릭시 유효성 검사
			$('#applicationCheck').click(function() {
				$("#applicationFrm").find("input, select, radio").attr("disabled", true);
				$("#applicationInsert").show();
				$("#applicationReInsert").show();
				$("#applicatoinInsertAlert").show();
				$("#applicationCheck").hide();
				
				// 이메일
				var re_email = /^(\w+)(((\.?)(\w+))*)[@](((\w+)[.])+)(\w{2,3})$/;
				// 비밀번호 검사식 (9~15글자, 영대소문자,숫자,특수문자 포함)
				var re_pw = /^.*(?=^.{9,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
				
				var edu_infor_seq = $("#edu_infor_seq").val();
				var faceImage = $("#faceImage").val();
				var name = $("#name").val();
				var birth = $("#birth").val();
				var email = $("#email").val() + "@" + $("#email2").val();
				var phone = $("#phone").val();
				var sample6_postcode = $("#sample6_postcode").val();
				var sample6_address = $("#sample6_address").val();
				var sample6_address2 = $("#sample6_address2").val();
				
				var pwd = $("#pwd").val();
				var pwd2 = $("#pwd2").val();
				
				if (edu_infor_seq == "") {
					alert('교육과정을 선택해 주세요.');
					$("#education").focus();
					return false;
				} else if(faceImage == "") {
					alert('사진을 올려주세요.');
					$("#faceImage").focus();
					return false;
				} else if(name == "") {
					alert('이름을 입력하세요.');
					$("#name").focus();
					return false;
				} else if(name == "") {
					alert('이름을 입력하세요.');
					$("#name").focus();
					return false;
				} else if(birth == "") {
					alert('생년월일을 입력하세요.');
					$("#birth").focus();
					return false;
				} else if (re_email.test(email) != true) { 
					alert('유효한 이메일을 입력해 주세요.');
					$("#email").focus();
					return false;
				} else if(phone == "") {
					alert('전화번호를 입력하세요.');
					$("#phone").focus();
					return false;
				} else if(sample6_postcode == "" || sample6_address == "" || sample6_address2 == "") {
					alert('주소를 입력하세요.');
					$("#sample6_address2").focus();
					return false;
				} else if (re_pw.test(pwd) != true) { // 비밀번호 검사
					alert('유효한 비밀번호를 입력해 주세요.');
					$("#pwd").focus();
					return false;
				} else if (re_pw.test(pwd2) != true) { // 비밀번호 검사
					alert('유효한 비밀번호를 입력해 주세요.');
					$("#pwd2").focus();
					return false;
				} else if(pwd != pwd2) {
					alert('비밀번호가 일치하지 않습니다.');
					$("#pwd").focus();
					return false;
				} else {
					if(confirm("입력하신 내용으로 신청하시겠습니까?") == true) {
						$("#applicationFrm").find("input, select, radio").attr("disabled", true);
						$("#applicationInsert").show();
						$("#applicationReInsert").show();
						$("#applicatoinInsertAlert").show();
						$("#applicationCheck").hide();
					}
				}
			});
			
			// 다시 입력 버튼 클릭 시 
			$('#applicationReInsert').click(function() {
				if(confirm("다시 입력하시겠습니까?") == true) {
					$("#applicationFrm").find("input, select, radio").attr("disabled", false);
					$("#applicationInsert").hide();
					$("#applicationReInsert").hide();
					$("#applicatoinInsertAlert").hide();
					$("#applicationCheck").show();
				}
			});
			
			// 교육 신청 완료 버튼 클릭 시 교육 신청 INSERT
			$('#applicationInsert').click(function() {
				$("#applicationFrm").find("input, select, radio").attr("disabled", false);
				$("#applicationInsert").hide();
				// 이메일
				var re_email = /^(\w+)(((\.?)(\w+))*)[@](((\w+)[.])+)(\w{2,3})$/;
				// 비밀번호 검사식 (9~15글자, 영대소문자,숫자,특수문자 포함)
				var re_pw = /^.*(?=^.{9,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
				
				var edu_infor_seq = $("#edu_infor_seq").val();
				var faceImage = $("#faceImage").val();
				var name = $("#name").val();
				var birth = $("#birth").val();
				var email = $("#email").val() + "@" + $("#email2").val();
				var phone = $("#phone").val();
				var sample6_postcode = $("#sample6_postcode").val();
				var sample6_address = $("#sample6_address").val();
				var sample6_address2 = $("#sample6_address2").val();
				
				var pwd = $("#pwd").val();
				var pwd2 = $("#pwd2").val();
				
				if (edu_infor_seq == "") {
					alert('교육과정을 선택해 주세요.');
					$("#education").focus();
					return false;
				} else if(faceImage == "") {
					alert('사진을 올려주세요.');
					$("#faceImage").focus();
					return false;
				} else if(name == "") {
					alert('이름을 입력하세요.');
					$("#name").focus();
					return false;
				} else if(name == "") {
					alert('이름을 입력하세요.');
					$("#name").focus();
					return false;
				} else if(birth == "") {
					alert('생년월일을 입력하세요.');
					$("#birth").focus();
					return false;
				} else if (re_email.test(email) != true) { 
					alert('유효한 이메일을 입력해 주세요.');
					$("#email").focus();
					return false;
				} else if(phone == "") {
					alert('전화번호를 입력하세요.');
					$("#phone").focus();
					return false;
				} else if(sample6_postcode == "" || sample6_address == "" || sample6_address2 == "") {
					alert('주소를 입력하세요.');
					$("#sample6_address2").focus();
					return false;
				} else if (re_pw.test(pwd) != true) { // 비밀번호 검사
					alert('유효한 비밀번호를 입력해 주세요.');
					$("#pwd").focus();
					return false;
				} else if (re_pw.test(pwd2) != true) { // 비밀번호 검사
					alert('유효한 비밀번호를 입력해 주세요.');
					$("#pwd2").focus();
					return false;
				} else if(pwd != pwd2) {
					alert('비밀번호가 일치하지 않습니다.');
					$("#pwd").focus();
					return false;
				} else {
					if(confirm("입력하신 내용으로 신청을 완료하시겠습니까?\n완료하신 이후에는 수정이 불가능합니다.") == true) {
						var data = new FormData();
						$.each($('#faceImage')[0].files, function(i, file) {
							data.append('file-' + i, file);
						});
						
						console.log(data);
						$.ajax({
							url : "<c:url value='/application/faceImgageUpload.do' />",
							type : "POST",
							data : data,
							processData: false,
							contentType: false,
							success : function(data, status) {
								if (data != null || data != undefined) {
									$("#STORED_FILE_NAME").val(data.file.STORED_FILE_NAME);
									$("#ORIGINAL_FILE_NAME").val(data.file.ORIGINAL_FILE_NAME);
									
									fn_insertApplication();
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
			
			// 교육취소 버튼 클릭 시 
			$('#applicationUpdate').click(function() {
				fn_updateApplicationState();
			});
			
		});
	
		window.name = "kmcis_web_sample";
		
		var KMCIS_window;

		function openKMCISWindow(){

			var UserAgent = navigator.userAgent;
			/* 모바일 접근 체크*/
			// 모바일일 경우 (변동사항 있을경우 추가 필요)
			if(UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
				document.reqKMCISForm.target = '';
			} else { // 모바일이 아닐 경우
				KMCIS_window = window.open('', 'KMCISWindow', 'width=425, height=550, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=435, top=250' );
				
				if(KMCIS_window == null){
					alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n    화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
				}
				document.reqKMCISForm.target = 'KMCISWindow';
			}
			
			document.reqKMCISForm.action = '<c:url value="/auth.jsp" />';
			document.reqKMCISForm.submit();
		}
		
		function agreebtnactive(dom, type, modaldom, clickBtndom, msg){
			var form = $(dom);
			
			if(type == 0) {
				form.find("input, select, button, textarea").prop("disabled", false);
				try {
					$(clickBtndom).prop("disabled", true);
					$(clickBtndom).text(msg);
					$(clickBtndom).removeClass("btn-danger");
					$(clickBtndom).addClass("btn-info");
					
					// check.check
					$("#application_form").show();
				} catch (e) {
					
				}
			}else{
				form.find("input, select, button, textarea").prop("disabled", true);
			}
			
			try {
				$(modaldom).modal('hide');	
			} catch (e) {
				
			}
		}
		
		function fn_insertApplication() {
			$.ajax({
				url : "<c:url value='/application/insertApplication.do' />",
				type : "POST",
				data : $("#applicationFrm").serialize(),
				async : false,
				success : function(responseData, textStatus, jqXHR) {
					console.log(textStatus);
					console.log(responseData);
					console.log(responseData.edu_num);
					if (textStatus == "success") {
						//페이지 이동
						alert("교육신청이 완료되었습니다. 신청서 출력 화면으로 이동합니다.");
						
						var comSubmit = new ComSubmit("applicationFrm");
						comSubmit.setUrl("<c:url value='/application/openApplicationReport.do' />");
						comSubmit.addParam("edu_num", responseData.edu_num);
						comSubmit.submit();
					} else {
						alert("정상적으로 처리되지 않았습니다.");
					}
				},
				error: function(e){
					alert(e.responseText);
				}
			});
		}
		
		function fn_updateApplicationState(){
			if(confirm("교육신청을 취소하시겠습니?") == true) {
				$.ajax({
					url : "<c:url value='/application/updateApplicationState.do' />",
					type : "POST",
					data : $("#applicationUpdateFrm").serialize(),
					async : false,
					success : function(responseData, textStatus, jqXHR) {
						if (textStatus == "success") {
							//페이지 이동
							alert("교육취소가 완료되었습니다. 메인화면으로 이동합니다.");
							
							var url = "<c:url value='/main/openEduMainView.do' />"; 
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
		
		// 다음 주소 찾기
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('sample6_address').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('sample6_address2').focus();
				}
			}).open();
		}
		
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
