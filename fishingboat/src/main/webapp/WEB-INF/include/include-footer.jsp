<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="footer">
	<div class="panel panel-default">
		<div class="panel-heading" style="text-align: center;">
			<a href="<c:url value='/side/openSideView.do' />">이용안내</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/side/openPersonalView.do' />">개인정보처리방침</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/side/openClauseView.do' />">저작권법 정책</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/side/openViewerView.do' />">뷰어다운로드</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/side/openAddrView.do' />">찾아오시는길</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/side/openSitemapView.do' />">사이트맵</a>
		</div>
		<div class="panel-body">
			<div style="float: left; text-align: center; padding: 20px;">
				<a href="<c:url value='/main/openMainView.do' />">
					<img src="/file/images/logo_copy.gif" />
				</a>
			</div>
			<div style="float: left;">
				<p>(우)339-012 세종특별자치시 다솜2로 94 정부세종청사 5동 해양수산부 어업정책과</p>
				<p>해양수산부 어업정책과 Tel : 044-200-5523 / 선박안전기술공단 Tel : 032-260-2241</p>
				<p>Copyright( c ) Ministry of Oceans and Fisheries All rights reserved</p>
			</div>
		</div>
	</div>
</div>
