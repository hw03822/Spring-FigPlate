<%@ page contentType="text/html; charset=UTF-8"
   trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/header" />
<fmt:setBundle basename="i18n/member"/>
<!DOCTYPE html>
<html>
<head>
<title>무화과플레이트: 혜화동 맛집 검색</title>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/header.css'/>">
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<link rel="shortcut icon" href="<c:url value='/images/pagelogo.png'/>">
<link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>
<body>
	<div class="wrapper">
		<article class="main-padding">
			<div class="except-main">
				<section class="main-section">
					<div class="inner">
						<h1 class="title">로그인</h1>
						<div class="details">아이디와 비밀번호를 입력해주세요.</div>
						<div class="login-contents">
							<c:if test="${empty sessionScope.userId}">
								<form class="login-form" action="<c:url value='/member/login'/>" method="post">
									<input class="login-item login-id" type="text" name="userId" id="id" placeholder="<fmt:message key="MEMBER_ID"/>" aria-describedby="basic-addon1">
									<input class="login-item login-pw" type="password" name="password" id="pw" placeholder="<fmt:message key="MEMBER_PW"/>" aria-describedby="basic-addon1">
									<input class="submit-btn" type="submit" value="<fmt:message key="SIGN_IN"/>">
	                        	</form>
	                        	<button class="signup-btn" type="button" onclick="location.href='<c:url value='/member/insert'/>'" id="signUp" style="margin-top: 0;"><fmt:message key="SIGN_UP"/></button>
							</c:if>
						</div>
					</div>
				</section>
			</div>
		</article>

      <jsp:include page="/WEB-INF/views/include/header.jsp" />
      <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   </div>
</body>
</html>