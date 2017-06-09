<%
	response.setHeader("Pragma", "no-cache" );
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-store");
	response.setHeader("Cache-Control", "no-cache" );
%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.regex.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*,java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	//날짜 생성
	Calendar today = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	String day = sdf.format(today.getTime());

	java.util.Random ran = new Random();
	//랜덤 문자 길이
	int numLength = 6;
	String randomStr = "";

	for (int i = 0; i < numLength; i++) {
		//0 ~ 9 랜덤 숫자 생성
		randomStr += ran.nextInt(10);
	}

	//reqNum은 최대 40byte 까지 사용 가능
	String reqNum = day + randomStr;
	
	//tr_cert 데이터 변수 선언 ---------------------------------------------------------------
	String tr_cert       = "";

	String name = request.getParameter("name");				// 성명
	if(name == null) name = "";
	String phoneNo = request.getParameter("phoneNo");		// 휴대폰번호
	if(phoneNo == null) phoneNo = "";
	String phoneCorp = request.getParameter("phoneCorp");	// 이동통신사
	if(phoneCorp == null) phoneCorp = "";
	String birthDay = request.getParameter("birthDay");		// 생년월일
	if(birthDay == null) birthDay = "";
	String gender = request.getParameter("gender");			// 성별
	if(gender == null) gender = "";
	String plusInfo = reqNum;//request.getParameter("plusInfo");	// 추가DATA정보
	if(plusInfo == null) plusInfo = "";
	String cpId          = "BILM1001";//request.getParameter("cpId");        // 회원사ID
	String urlCode       = "002002";//request.getParameter("urlCode");     // URL코드
	String certNum       = reqNum;//request.getParameter("certNum");     // 요청번호
	String date          = day;//request.getParameter("date");        // 요청일시
	String certMet       = "M";//request.getParameter("certMet");     // 본인인증방법
	String nation        = "0";//request.getParameter("nation");      // 내외국인 구분
	String extendVar     = "0000000000000000";                  // 확장변수
	//개발 테스트
	if(phoneNo == "") phoneNo = "000";
	if(phoneCorp == "") phoneCorp = "kkk";
	if(birthDay == "") birthDay = "111";
	if(gender == "") gender = "1111";
	if(name == "") name = "";
	//End-tr_cert 데이터 변수 선언 ---------------------------------------------------------------
	String tr_url     = "http://fishboat6.kgis.kr:8080/authend.jsp";//request.getParameter("tr_url");         // 본인인증서비스 결과수신 POPUP URL
	String tr_add     = "N";//request.getParameter("tr_add");         // IFrame사용여부
	
	/** certNum 주의사항 **************************************************************************************
	* 1. 본인인증 결과값 복호화를 위한 키로 활용되므로 중요함.
	* 2. 본인인증 요청시 중복되지 않게 생성해야함. (예-시퀀스번호)
	* 3. certNum값은 본인인증 결과값 수신 후 복호화키로 사용함.
	       tr_url값에 certNum값을 포함해서 전송하고, (tr_url = tr_url + "?certNum=" + certNum;)
		   tr_url에서 쿼리스트링 형태로 certNum값을 받으면 됨. (certNum = request.getParameter("certNum"); )
	*
	***********************************************************************************************************/
%>
<%!
	// 파라미터 유효성 검증 --------------------------------------------
	boolean b = true;
	String regex = "";
	String regex1 = "";

	public Boolean paramChk(String patn, String param){
		Pattern pattern = Pattern.compile(patn);
		Matcher matcher = pattern.matcher(param);
		b = matcher.matches();
		return b;
	}
%>
<%
	regex = "[A-Z]*";
	regex1 = "[0-9]*";
	if( cpId.length() == 8 ){
		String engcpId = cpId.substring(0,4);
		String numcpId = cpId.substring(4,8);
		if( !paramChk(regex, engcpId) || !paramChk(regex1, numcpId) ){
			//out.println("<script> alert('회원사ID 비정상');");
			//out.println("history.back(); </script>");
		}
	} else {
		//out.println("<script> alert('회원사ID 비정상');");
		//out.println("history.back(); </script>");
	}

	regex = "[0-9]*";
	if( urlCode.length() != 6 || !paramChk(regex, urlCode) ){
		//out.println("<script> alert('URL코드 비정상');");
		//out.println("history.back(); </script>");
	}

	if( certNum.length() == 0 || certNum.length() > 40){
		//out.println("<script> alert('요청번호를 입력하세요.');");
		//out.println("history.back(); </script>");
	}

	regex = "[0-9]*";
	if( date.length() != 14 || !paramChk(regex, date) ){
		//out.println("<script> alert('요청일시 비정상');");
		//out.println("history.back(); </script>");
	}

	regex = "[A-Z]*";
	if( certMet.length() != 1 || !paramChk(regex, certMet) ){
		//out.println("<script> alert('본인인증방법 비정상');");
		//out.println("history.back(); </script>");
	}
	
	regex = "[0-9]*";
	if( phoneNo.length() != 0 ){
		if( (phoneNo.length() != 10 && phoneNo.length() != 11) || !paramChk(regex, phoneNo) ){
			out.println("<script> alert('휴대폰번호 가 올바르지 않습니다. 다시 작성 바랍니다.');");
			out.println("self.close(); </script>");
		}
	}
	
	regex = "[A-Z]*";
	if( phoneCorp.length() != 0 ){
		if( phoneCorp.length() != 3 || !paramChk(regex, phoneCorp) ){
			out.println("<script> alert('이동통신사 가 올바르지 않습니다.');");
			out.println("self.close(); </script>");
		}
	}

	regex = "[0-9]*";
	if( birthDay.length() != 0 ){
		if( birthDay.length() != 8 || !paramChk(regex, birthDay) ){
			out.println("<script> alert('생년월일 이 올바르지 않습습니다.');");
			out.println("self.close(); </script>");
		}
	}

	regex = "[0-9]*";
	if( gender.length() != 0 ){
		if( gender.length() != 1 || !paramChk(regex, gender) ){
			out.println("<script> alert('성별 이 올바르지 않습니다.');");
			out.println("self.close(); </script>");
		}
	}

	regex = "[0-9]*";
	if( nation.length() != 0 ){
		if( nation.length() != 1 || !paramChk(regex, nation) ){
			out.println("<script> alert('내/외국인 비정상');");
			out.println("self.close(); </script>");
		}
	}

	if( tr_url.length() == 0 ){
		out.println("<script> alert('결과수신 URL 비정상');");
		out.println("self.close(); </script>");
	}
	
	regex = "[A-Z]*";
	if( tr_add.length() != 0 ){
		if( tr_add.length() != 1 || !paramChk(regex, tr_add) ){
			out.println("<script> alert('IFrame사용여부 비정상');");
			out.println("self.close(); </script>");
		}
	}

	// END 파라미터 유효성 검증 --------------------------------------------

	//01. 한국모바일인증(주) 암호화 모듈 선언
	com.icert.comm.secu.IcertSecuManager seed  = new com.icert.comm.secu.IcertSecuManager();

	//02. 1차 암호화 (tr_cert 데이터변수 조합 후 암호화)
	String enc_tr_cert = "";
	tr_cert            = cpId +"/"+ urlCode +"/"+ certNum +"/"+ date +"/"+ certMet +"/"+ birthDay +"/"+ gender +"/"+ name +"/"+ phoneNo +"/"+ phoneCorp +"/"+ nation +"/"+ plusInfo +"/"+ extendVar;
	enc_tr_cert        = seed.getEnc(tr_cert, "");

	//03. 1차 암호화 데이터에 대한 위변조 검증값 생성 (HMAC)
	String hmacMsg = "";
	hmacMsg = seed.getMsg(enc_tr_cert);

	//04. 2차 암호화 (1차 암호화 데이터, HMAC 데이터, extendVar 조합 후 암호화)
	tr_cert  = seed.getEnc(enc_tr_cert + "/" + hmacMsg + "/" + extendVar, "");
	/*String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String DB_USER    = "batauser"; // DB USER명
	String DB_PASSWORD = "batauser"; // 패스워드
	Connection con = null;
	Statement  stmt   = null;
	ResultSet rs = null;
	String sql=null;
	
	try
	{
	    Class.forName("oracle.jdbc.driver.OracleDriver");
	    con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);    
	}catch(SQLException e){
		  out.println(e);
	}*/
%>

<html>
<head>
<script language=javascript>
<!--
   window.name = "kmcis_web_sample";
   
   var KMCIS_window;

   function openKMCISWindow(){    

    var UserAgent = navigator.userAgent;
    /* 모바일 접근 체크*/
    // 모바일일 경우 (변동사항 있을경우 추가 필요)
    if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
   		 document.reqKMCISForm.target = '';
	  } 
	  
	  // 모바일이 아닐 경우
	  else {
   		//KMCIS_window = window.open('', 'KMCISWindow', 'width=425, height=550, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=435, top=250' );
   		
   		if(KMCIS_window == null){
  			alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n    화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
		}
   		
   		//document.reqKMCISForm.target = 'KMCISWindow';
		document.reqKMCISForm.target = '';
	  }
	  
	  document.reqKMCISForm.action = 'https://www.kmcert.com/kmcis/web/kmcisReq.jsp';
	  document.reqKMCISForm.submit();
  }
  function openKMCISWindow2(){

  }
//-->
</script>
</head>
<body onLoad="openKMCISWindow()">
	<form name="reqKMCISForm" method="post" action="#">
		<input type="hidden" name="tr_cert" value="<%=tr_cert%>">
		<input type="hidden" name="tr_url" value="<%=tr_url%>">
		<input type="hidden" name="tr_add" value="<%=tr_add%>">
		<input type="submit" value="본인인증서비스 요청" onclick="javascript:openKMCISWindow();">
	</form>
	<table class="table table-bordered" style="display: none;">
		<tr>
			<td>회원사ID</td>
			<td><%=cpId%></td>
		</tr>
		<tr>
			<td>URL코드</td>
			<td><%=urlCode%></td>
		</tr>
		<tr>
			<td>요청번호</td>
			<td><%=certNum%></td>
		</tr>
		<tr>
			<td>요청일시</td>
			<td><%=date%></td>
		</tr>
		<tr>
			<td>본인인증방법</td>
			<td><%=certMet%></td>
		</tr>
		<tr>
			<td>이용자성명</td>
			<td><%=name%></td>
		</tr>
		<tr>
			<td>휴대폰번호</td>
			<td><%=phoneNo%></td>
		</tr>
		<tr>
			<td>이동통신사</td>
			<td><%=phoneCorp%></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><%=birthDay%></td>
		</tr>
		<tr>
			<td>이용자성별</td>
			<td><%=gender%></td>
		</tr>
		<tr>
			<td>내외국인</td>
			<td><%=nation%></td>
		</tr>
		<tr>
			<td>추가DATA정보</td>
			<td><%=plusInfo%></td>
		</tr>
		<tr>
			<td>&nbsp</td>
			<td>&nbsp</td>
		</tr>
		<tr width=100>
			<td>요청정보(암호화)</td>
			<td><%=tr_cert.substring(0,50)%>...</td>
		</tr>
		<tr>
			<td>결과수신URL</td>
			<td><%=tr_url%></td>
		</tr>
		<tr>
			<td>IFrame사용여부</td>
			<td><%=tr_add%></td>
		</tr>
	</table>
</body>