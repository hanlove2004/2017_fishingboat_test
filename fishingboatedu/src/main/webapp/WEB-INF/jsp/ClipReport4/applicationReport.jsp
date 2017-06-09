<%@page import="com.clipsoft.clipreport.oof.OOFFile"%>
<%@page import="com.clipsoft.clipreport.oof.OOFDocument"%>
<%@page import="java.io.File"%>
<%@page import="com.clipsoft.clipreport.server.service.ReportUtil"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
OOFDocument oof = OOFDocument.newOOF();
OOFFile file = oof.addFile("crf.root", "%root%/crf/ApplicationReport.crf");

oof.addField("EDU_NAM", request.getParameter("EDU_NAM"));
oof.addField("EDU_NUM", request.getParameter("EDU_NUM"));
oof.addField("EDU_BIRTH", request.getParameter("EDU_BIRTH"));
oof.addField("EDU_CODE_NAM", request.getParameter("EDU_CODE_NAM"));
oof.addField("EDU_ADDR", request.getParameter("EDU_ADDR"));
oof.addField("EDU_PHONE", request.getParameter("EDU_PHONE"));
oof.addField("EDU_EMAIL", request.getParameter("EDU_EMAIL"));
oof.addField("EDU_DATE", request.getParameter("EDU_DATE"));
oof.addField("EDU_LOC", request.getParameter("EDU_LOC"));

oof.addField("IMGFILE", "C:/2017_FISINGBOAT/source/fishingboat_files/education/"+request.getParameter("EDU_IMG_SAV_NAM"));

//DB 연결이 있을때만
//file.addConnectionData("*", "oracle1");

%>
<%@include file="Property.jsp"%>
<%
//세션을 활용하여 리포트키들을 관리하지 않는 옵션
//request.getSession().setAttribute("ClipReport-SessionList-Allow", false);
String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath);
//리포트의 특정 사용자 ID를 부여합니다.
//clipreport4.properties 의 useuserid 옵션이 true 일 때만 적용됩니다. 
//clipreport4.properties 의 useuserid 옵션이 true 이고 기본 예제[String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath);] 사용 했을 때 세션ID가 userID로 사용 됩니다.
//String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath, "userID");

//리포트key의 사용자문자열을 추가합니다.(문자숫자만 가능합니다.)
//String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath, "", "usetKey");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Report</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="<c:url value='/ClipReport4/css/clipreport.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/ClipReport4/css/UserConfig.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/ClipReport4/css/font.css' />">
<script type='text/javascript' src='<c:url value='/ClipReport4/js/jquery-1.11.1.js' />'></script>
<script type='text/javascript' src='<c:url value='/ClipReport4/js/clipreport.js' />'></script>
<script type='text/javascript' src='<c:url value='/ClipReport4/js/UserConfig.js' />'></script>
<script type='text/javascript'>
//var urlPath = document.location.protocol + "//" + document.location.host;
	
function html2xml(divPath){	
	var reportkey = "<%=resultKey%>";
	var report = createImportJSPReport("<c:url value='/report/Clip.do' />", reportkey, document.getElementById(divPath));
	//실행
	//report.setSlidePage(true);
	report.view();
}
</script>
</head>
<body onload="html2xml('targetDiv1')">
<div id='targetDiv1' style='position:absolute;top:5px;left:5px;right:5px;bottom:5px;'></div>
</body>
</html>
