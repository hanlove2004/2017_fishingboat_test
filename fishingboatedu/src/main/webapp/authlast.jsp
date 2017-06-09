<%
	//************************************************************************
	//																		//
	//		본 샘플소스는 개발 및 테스트를 위한 목적으로 만들어졌으며,				//
	//																		//
	//		실제 서비스에 그대로 사용하는 것을 금합니다.							//
	//																		//
	//************************************************************************
%>
<%
	response.setHeader("Pragma","no-cache");			// HTTP1.0 캐쉬 방지
	response.setDateHeader("Expires",0);				// proxy 서버의 캐쉬 방지
	response.setHeader("Pragma", "no-store");			// HTTP1.1 캐쉬 방지
	if(request.getProtocol().equals("HTTP/1.1"))
			response.setHeader("Cache-Control", "no-cache"); // HTTP1.1 캐쉬 방지
%>
<%@ page  contentType = "text/html;charset=utf-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.util.regex.*" %>
<%@ page import = "java.text.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	// 변수 -------------------------------------------------------------------------------------------------------------
	String rec_cert		= "";           // 결과수신DATA

	String k_certNum = "";			    // 파라미터로 수신한 요청번호
	String certNum		= "";			// 요청번호
	String date			= "";			// 요청일시
	String CI	    	= "";			// 연계정보(CI)
	String DI	    	= "";			// 중복가입확인정보(DI)
	String phoneNo		= "";			// 휴대폰번호
	String phoneCorp	= "";			// 이동통신사
	String birthDay		= "";			// 생년월일
	String gender		= "";			// 성별
	String nation		= "";			// 내국인
	String name			= "";			// 성명
	String M_name		= "";			// 미성년자 성명
	String M_birthDay	= "";			// 미성년자 생년월일
	String M_Gender		= "";			// 미성년자 성별
	String M_nation		= "";			// 미성년자 내외국인
	String result		= "";			// 결과값

	String certMet		= "";			// 인증방법
	String ip			= "";			// ip주소
	String plusInfo		= "";

	String encPara		= "";
	String encMsg1		= ""; 
	String encMsg2		= "";
	String msgChk       = "";
	//-----------------------------------------------------------------------------------------------------------------

	try{

		// Parameter 수신 --------------------------------------------------------------------
		rec_cert	= request.getParameter("rec_cert").trim();
		k_certNum	= request.getParameter("certNum").trim();

%>
			[복호화 하기전 수신값] <br>
			<br>
			rec_cert : <%=rec_cert%> <br>
			<br>
<%
		//01. 암호화 모듈 (jar) Loading
		com.icert.comm.secu.IcertSecuManager seed = new com.icert.comm.secu.IcertSecuManager();

		//02. 1차 복호화
		//수신된 certNum를 이용하여 복호화
		rec_cert  = seed.getDec(rec_cert, k_certNum);

		//03. 1차 파싱
		int inf1 = rec_cert.indexOf("/",0);
		int inf2 = rec_cert.indexOf("/",inf1+1);

		encPara  = rec_cert.substring(0,inf1);         //암호화된 통합 파라미터
		encMsg1  = rec_cert.substring(inf1+1,inf2);    //암호화된 통합 파라미터의 Hash값

		//04. 위변조 검증
		encMsg2  = seed.getMsg(encPara);

		if(encMsg2.equals(encMsg1)){
			msgChk="Y";
		}

		if(msgChk.equals("N")){
%>
			<script language=javascript>
				alert("비정상적인 접근입니다.!!<%=msgChk%>");
			</script>
<%
			return;
		}

		//05. 2차 복호화
		rec_cert  = seed.getDec(encPara, k_certNum);

		//06. 2차 파싱
		int info1  = rec_cert.indexOf("/",0);
		int info2  = rec_cert.indexOf("/",info1+1);
		int info3  = rec_cert.indexOf("/",info2+1);
		int info4  = rec_cert.indexOf("/",info3+1);
		int info5  = rec_cert.indexOf("/",info4+1);
		int info6  = rec_cert.indexOf("/",info5+1);
		int info7  = rec_cert.indexOf("/",info6+1);
		int info8  = rec_cert.indexOf("/",info7+1);
		int info9  = rec_cert.indexOf("/",info8+1);
		int info10 = rec_cert.indexOf("/",info9+1);
		int info11 = rec_cert.indexOf("/",info10+1);
		int info12 = rec_cert.indexOf("/",info11+1);
		int info13 = rec_cert.indexOf("/",info12+1);
		int info14 = rec_cert.indexOf("/",info13+1);
		int info15 = rec_cert.indexOf("/",info14+1);
		int info16 = rec_cert.indexOf("/",info15+1);
		int info17 = rec_cert.indexOf("/",info16+1);
		int info18 = rec_cert.indexOf("/",info17+1);

		certNum		= rec_cert.substring(0,info1);
		date		= rec_cert.substring(info1+1,info2);
		CI			= rec_cert.substring(info2+1,info3);
		phoneNo		= rec_cert.substring(info3+1,info4);
		phoneCorp	= rec_cert.substring(info4+1,info5);
		birthDay	= rec_cert.substring(info5+1,info6);
		gender		= rec_cert.substring(info6+1,info7);
		nation		= rec_cert.substring(info7+1,info8);
		name		= rec_cert.substring(info8+1,info9);
		result		= rec_cert.substring(info9+1,info10);
		certMet		= rec_cert.substring(info10+1,info11);
		ip			= rec_cert.substring(info11+1,info12);
		M_name		= rec_cert.substring(info12+1,info13);
		M_birthDay	= rec_cert.substring(info13+1,info14);
		M_Gender	= rec_cert.substring(info14+1,info15);
		M_nation	= rec_cert.substring(info15+1,info16);
		plusInfo	= rec_cert.substring(info16+1,info17);
		DI      	= rec_cert.substring(info17+1,info18);

		//07. CI, DI 복호화
		CI  = seed.getDec(CI, k_certNum);
		DI  = seed.getDec(DI, k_certNum);
%>	
<%!
		// 파라미터 유효성 검증 --------------------------------------------
		boolean b = true;
		String regex = "";

		public Boolean paramChk(String patn, String param){
			Pattern pattern = Pattern.compile(patn);
			Matcher matcher = pattern.matcher(param);
			b = matcher.matches();
			return b;
		}
%>
<%
		if( certNum.length() == 0 || certNum.length() > 40){
			out.println("요청번호 비정상");
			return;
		}

		regex = "[0-9]*";
		if( date.length() != 14 || !paramChk(regex, date) ){
			out.println("요청일시 비정상");
			return;
		}

		regex = "[A-Z]*";
		if( certMet.length() != 1 || !paramChk(regex, certMet) ){
			out.println("본인인증방법 비정상" + certMet);
			return;
		}

		regex = "[0-9]*";
		if( (phoneNo.length() != 10 && phoneNo.length() != 11) || !paramChk(regex, phoneNo) ){
			out.println("휴대폰번호 비정상");
			return;
		}
		
		regex = "[A-Z]*";
		if( phoneCorp.length() != 3 || !paramChk(regex, phoneCorp) ){
			out.println("이동통신사 비정상");
			return;
		}

		regex = "[0-9]*";
		if( birthDay.length() != 8 || !paramChk(regex, birthDay) ){
			out.println("생년월일 비정상");
			return;
		}

		regex = "[0-9]*";
		if( gender.length() != 1 || !paramChk(regex, gender) ){
			out.println("성별 비정상");
			return;
		}

		regex = "[0-9]*";
		if( nation.length() != 1 || !paramChk(regex, nation) ){
			out.println("내/외국인 비정상");
			return;
		}
		
		regex = "[\\sA-Za-z가-힣.,-]*";
		if( name.length() > 60 || !paramChk(regex, name) ){
			out.println("성명 비정상");
			return;
		}
		
		regex = "[A-Z]*";
		if( result.length() != 1 || !paramChk(regex, result) ){
			out.println("결과값 비정상");
			return;
		}
		
		regex = "[\\sA-Za-z가-힣.,-]*";
		if( M_name.length() != 0 ){
			if( M_name.length() > 60 || !paramChk(regex, M_name) ){
				out.println("미성년자 성명 비정상");
				return;
			}
		}
		
		regex = "[0-9]*";
		if( M_birthDay.length() != 0 ){
			if( M_birthDay.length() != 8 || !paramChk(regex, M_birthDay) ){
				out.println("미성년자 생년월일 비정상");
				return;
			}
		}

		regex = "[0-9]*";
		if( M_Gender.length() != 0 ){
			if( M_Gender.length() != 1 || !paramChk(regex, M_Gender) ){
				out.println("미성년자 성별 비정상");
				return;
			}
		}

		regex = "[0-9]*";
		if( M_nation.length() != 0 ){
			if( M_nation.length() != 1 || !paramChk(regex, M_nation) ){
				out.println("미성년자 내/외국인 비정상");
				return;
			}
		}
		// End 파라미터 유효성 검증 --------------------------------------------

/** 수신내역 유효성 검증 ******************************************************************/
	//	1-1-1) date 값 검증

	//	현재 서버 시각 구하기
		SimpleDateFormat formatter	= new SimpleDateFormat("yyyyMMddHHmmss",Locale.KOREAN);
		String strCurrentTime	= formatter.format(new Date());
		
		Date toDate				= formatter.parse(strCurrentTime);
		Date fromDate			= formatter.parse(date);
		long timediff			= toDate.getTime()-fromDate.getTime();
		
		if ( timediff < -30*60*1000 || 30*60*100 < timediff  ){		%>

			비정상적인 접근입니다. (요청시간경과)
<%			return;
		}
	//	1-1-2) ip 값 검증


		// 사용자IP 구하기
		String client_ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		if ( client_ip != null ){
			if( client_ip.indexOf(",") != -1 )
				client_ip = client_ip.substring(0,client_ip.indexOf(","));
		}
		if ( client_ip==null || client_ip.length()==0 ){
			client_ip = request.getRemoteAddr();
		}

		if( !client_ip.equals(ip) ){		%>

			비정상적인 접근입니다. (IP불일치)
<%			return;
		}

/******************************************************************************************/
%>
<html>
	<head>
		<meta name="robots" content="noindex">
		<script src="https://code.jquery.com/jquery-2.2.4.min.js"
			integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
			crossorigin="anonymous"></script>
	</head>
	<body onLoad="action();">
		<div style="display:none;">
				<br><br>
			[복호화 후 수신값]
			<form id="sendauthdata">
				<input type="hidden" name="id" value="insert_smjs_authinfo">
				<input type="hidden" name="sql_id" value="insert_smjs_authinfo">
				<input type="hidden" name="method" value="create">
				<input type="hidden" name="temp_id" value="<%=plusInfo%>">
				<input type="hidden" name="certNum" value="<%=certNum%>">
				<input type="hidden" name="phoneNo" value="<%=phoneNo%>">
				<input type="hidden" name="name" value="<%=name%>">
				<input type="hidden" name="birthDay" value="<%=birthDay%>">
				<input type="hidden" name="gender" value="<%=gender%>">
				<input type="hidden" name="result" value="<%=result%>">
				<input type="hidden" name="CI" value="<%=CI%>">
				<input type="hidden" name="DI" value="<%=DI%>">
				<input type="hidden" name="phoneCorp" value="<%=phoneCorp%>">
				<input type="hidden" name="nation" value="<%=nation%>">
				<input type="hidden" name="certMet" value="<%=certMet%>">
				<input type="hidden" name="date" value="<%=date%>">
			</form>
			<br>
			<br>
			<table cellpadding=1 cellspacing=1>
				<tr>
					<td align=left>위,변조여부1</td>
					<td align=left><%=encMsg1%></td>
				</tr>
				<tr>
					<td align=left>위,변조여부2</td>
					<td align=left><%=encMsg2%></td>
				</tr>
				<tr>
					<td align=left>요청번호</td>
					<td align=left><%=certNum%></td>
				</tr>
				<tr>
					<td align=left>요청일시</td>
					<td align=left><%=date%></td>
				</tr>
				<tr>
					<td align=left>연계정보(CI)</td>
					<td align=left><%=CI%></td>
				</tr>
				<tr>
					<td align=left>중복가입확인정보(DI)</td>
					<td align=left><%=DI%></td>
				</tr>
				<tr>
					<td align=left>휴대폰번호</td>
					<td align=left><%=phoneNo%></td>
				</tr>
				<tr>
					<td align=left>이동통신사</td>
					<td align=left><%=phoneCorp%></td>
				</tr>
				<tr>
					<td align=left>생년월일</td>
					<td align=left><%=birthDay%></td>
				</tr>
				<tr>
					<td align=left>내국인</td>
					<td align=left><%=nation%></td>
				</tr>
				<tr>
					<td align=left>성별</td>
					<td align=left><%=gender%></td>
				</tr>
				<tr>
					<td align=left>성명</td>
					<td align=left><%=name%></td>
				</tr>
				<tr>
					<td align=left>결과값</td>
					<td align=left><%=result%></td>
				</tr>
				<tr>
					<td align=left>인증방법</td>
					<td align=left><%=certMet%></td>
				</tr>
				<tr>
					<td align=left>ip주소</td>
					<td align=left><%=ip%></td>
				</tr>
				<tr>
					<td align=left>미성년자 성명</td>
					<td align=left><%=M_name%></td>
				</tr>
				<tr>
					<td align=left>미성년자 생년월일</td>
					<td align=left><%=M_birthDay%></td>
				</tr>
				<tr>
					<td align=left>미성년자 성별</td>
					<td align=left><%=M_Gender%></td>
				</tr>
				<tr>
					<td align=left>미성년자 내외국인</td>
					<td align=left><%=M_nation%></td>
				</tr>
				<tr>
					<td align=left>추가DATA정보</td>
					<td align=left><%=plusInfo%></td>
				</tr>
			</table>

			<br>
			rec_cert : <%=rec_cert%> <br>
			</div>

	</body>
<script type="text/javascript">
<!--

function action(){
	var datas= $( "#sendauthdata").serialize();
	try{
		
		window.opener.authlastactive(datas,"<%=name%>","<%=birthDay%>","<%=phoneNo%>","<%=plusInfo%>");
		self.close();
	}
	catch(e){
		alert("E:"+e);
		try
		{
			window.opener.parent.authlastactive(datas,"<%=name%>","<%=birthDay%>","<%=phoneNo%>","<%=plusInfo%>");
		}
		catch (a)
		{
			alert("E:"+a);
		}
	}
}
//-->
</script>

</html>
<%
		// ----------------------------------------------------------------------------------

	}catch(Exception ex){
		System.out.println("[KMCIS] Receive Error -"+ex.getMessage());
	}
%>