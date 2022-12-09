<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/member" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><fmt:message key="DELETE_USER_INFO"/></title>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/header.css'/>">
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<link rel="shortcut icon" href="<c:url value='/images/pagelogo.png'/>">
<link rel="stylesheet" href="<c:url value='/css/writingform.css'/>">
</head>
<body>
<div class="wrapper">
	<article class="main-padding">
        <div class="except-main">
        	<section class="WritingPage_MemberContainer">
        		<h2 class="WritingPage_Title">회원 탈퇴 전 아래의 내용을 꼭 확인해 주세요.</h2>
				<ul class="WritingPage_Message">
					<li><img src="<c:url value='/images/fig.png'/>">  회원 탈퇴 시 회원 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는 복구가 불가능합니다. 다만 법령에 의하여 보관해야 하는 경우 또는 회사 내부 정책에 의하여 보관해야 하는 정보는 탈퇴 후에도 일정 기간 보관됩니다. 자세한 사항은 개인정보처리방침에서 확인하실 수 있습니다.
					<li><img src="<c:url value='/images/fig.png'/>">  회원 탈퇴 후 재가입하더라도 탈퇴 전의 회원 정보 및 서비스 이용 기록은 복구되지 않습니다.
					<li><img src="<c:url value='/images/fig.png'/>">  회원 탈퇴 후 무화과플레이트 서비스에 기록한 리뷰, 댓글, 마이리스트 등의 게시물은 삭제됩니다. 회원 탈퇴를 신중하게 생각해주시기 바랍니다.
					<li><img src="<c:url value='/images/fig.png'/>">  위 내용을 모두 확인하였으며, 이에 동의하신다면 계정 비밀번호를 입력해주세요.
				</ul>
				<form class="WritingPage_DeleteForm" action="<c:url value='/member/delete'/>" method="post" style="width: 520px;">
				<input type="password" name="password" id="password">
				<input class="WritingPage_DeleteSubmitbutton" type="submit" value="<fmt:message key="EXIT_MEMBER"/>"/>
				<input class="WritingPage_DeleteCancelbutton" type="button" onclick="history.back()" value="<fmt:message key="PRIVIOUS"/>"/>
				</form>
			
			</section>
		</div>
	</article>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>