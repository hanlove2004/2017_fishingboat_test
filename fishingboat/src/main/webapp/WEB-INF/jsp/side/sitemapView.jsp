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

		<div class="content">
			<div id="services" class="container-fluid text-center">
				<h2>사이트맵</h2>
				<br>
				<div class="row slideanim slide text-center">
					<div class="col-sm-4">
						<span class="glyphicon glyphicon-send logo-small"></span>
						<h4>어선매도</h4>
						<p><a href="<c:url value='/deal/openSellList.do' />">어선매도</a></p>
					</div>
					<div class="col-sm-4">
						<span class="glyphicon glyphicon-briefcase logo-small"></span>
						<h4>어선매수</h4>
						<p><a href="<c:url value='/deal/openBuyList.do' />">어선매수</a></p>
					</div>
					<div class="col-sm-4">
						<span class="glyphicon glyphicon-info-sign logo-small"></span>
						<h4>어선관련정보</h4>
						<p>
							<a href="<c:url value='/info/openInfoList.do' />">어선기본정보 조회</a><br />
							<a href="<c:url value='/info/openInfoSearchList.do' />">어선검사정보 조회</a><br />
							<a href="<c:url value='/info/openStoreList.do' />">기타 어선 관련 정보</a><br />
						</p>
					</div>
				</div>
				<br>
				<br>
				<div class="row slideanim slide text-center">
					<div class="col-sm-4">
						<span class="glyphicon glyphicon-search logo-small"></span>
						<h4>민원안내</h4>
						<p>
							<a href="<c:url value='/civil/openCivilView.do' />">법령 및 제도</a><br />
							<a href="<c:url value='/civil/openRuleList.do' />">관련규정 및 서식</a><br />
							<a href="<c:url value='/civil/openStepView.do' />">어선거래절차</a><br />
							<a href="<c:url value='/civil/openFaqView.do' />">FAQ</a><br />
							<a href="<c:url value='/civil/openQnaList.do' />">Q&A</a>
						</p>
					</div>
					<div class="col-sm-4">
						<span class="glyphicon glyphicon-heart logo-small"></span>
						<h4>커뮤니티</h4>
						<p>
							<a href="<c:url value='/community/openBoardList.do' />">공지사항</a><br />
							<a href="<c:url value='/community/openFreeList.do' />">자유게시판</a><br />
							<a href="<c:url value='/community/openDataList.do' />">자료실</a>
						</p>
					</div>
					<div class="col-sm-4">
						<span class="glyphicon glyphicon-th-list logo-small"></span>
						<h4>이용안내</h4>
						<p>
							<a href="<c:url value='/side/openSideView.do' />">이용안내</a><br />
							<a href="<c:url value='/side/openPersonalView.do' />">개인정보처리방침</a><br />
							<a href="<c:url value='/side/openClauseView.do' />">저작권법 정책</a><br />
							<a href="<c:url value='/side/openViewerView.do' />">뷰어다운로드</a><br />
							<a href="<c:url value='/side/openAddrView.do' />">찾아오시는길</a><br />
							<a href="<c:url value='/side/openSitemapView.do' />">사이트맵</a>
						</p>
					</div>
				</div>
				<div class="row slideanim slide text-center">
					<div class="col-sm-4">
						<span class="glyphicon glyphicon-user logo-small"></span>
						<h4>회원관리</h4>
						<p>
						<c:choose>
							<c:when test="${mberInfo != null }">
								<a href="<c:url value='/member/selectLogout.do' />">로그아웃</a><br />
								<a href="<c:url value='/loginmember/openMemberInfoView.do' />">회원정보수정</a><br />
								<a href="<c:url value='/loginmember/openMemberDeleteView.do' />">회원탈퇴</a>
							</c:when>
							<c:otherwise>
								<a href="<c:url value='/member/openLoginView.do' />">로그인</a><br />
								<a href="<c:url value='/member/openJoinView.do' />">회원가입</a><br />
								<a href="<c:url value='/member/openSearchIdView.do' />">아이디찾기</a><br />
								<a href="<c:url value='/member/openSearchPwView.do' />">비밀번호찾기</a><br />
							</c:otherwise>
						</c:choose>
						</p>
					</div>
					<div class="col-sm-4"></div>
					<div class="col-sm-4"></div>
				</div>
			</div>
			
			<%@ include file="/WEB-INF/include/include-eval.jsp"%>
		</div>

		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
		
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>

	<script type="text/javascript">
		$(document).ready(function() {
			fn_pageLog();
		});
		
	</script>
</body>
</html>

