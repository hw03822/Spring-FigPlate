<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/member" />
<fmt:setBundle basename="i18n/header" />
<!DOCTYPE html>
<html>
<title>무화과플레이트: 혜화동 맛집 검색</title>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/header.css'/>">
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<link rel="shortcut icon" href="<c:url value='/images/pagelogo.png'/>">
<link rel="stylesheet" href="<c:url value='/css/memberview.css'/>">
<body>
<div class="wrapper"> 
	<article class="main-padding">
		<div class="except-main">
			<section class="main-section top-list">
          		<div class="inner">
					<c:if test="${not empty sessionScope.userId}">
						<h1 class="title">마이페이지</h1>
						
						<div class="info-container">
							<div class="info-item">
								<p class="info-title" data-icon="😎">아이디</p>
								<p class="info-value">${userId}</p>
							</div>
							<c:if test="${role == 1}">
								<div class="info-item">
									<p class="info-title" data-icon="😎">회원 분류</p>
									<p class="info-value">가게 주인</p>
								</div>
								<div class="info-item">
									<p class="info-title" data-icon="😎" >가게 아이디</p>
									<p class="info-value">${sessionScope.dinerId}</p>
								</div>
							</c:if>
							<c:if test="${role == 2}">
								<div class="info-item">
									<p class="info-title" data-icon="😎">회원 분류</p>
									<p class="info-value">일반 회원</p>
								</div>
							</c:if>
							<div class="info-item">
								<p class="info-title" data-icon="😎">이름</p>
								<p class="info-value">${name}</p>
							</div>
							<div class="info-item">
								<p class="info-title" data-icon="😎">성별</p>
								<p class="info-value">${gender}</p>
							</div>
							<div class="info-item">
								<p class="info-title" data-icon="😎">생년월일</p>
								<p class="info-value">${birthDate}</p>
							</div>
							<div class="info-item">
								<p class="info-title" data-icon="😎">이메일</p>
								<p class="info-value">${email}</p>
							</div>
							<div class="info-item">
								<p class="info-title" data-icon="😎">휴대전화</p>
								<p class="info-value">${phone}</p>
							</div>
						</div>
						<div class="button">
						   <button type="button" class="button-item" onclick="location.href ='<c:url value="/member/update"/>'">수정하기</button>
						   <button type="button" class="button-item" onclick="location.href ='<c:url value="/member/delete"/>'">탈퇴하기</button>
						   <button type="button" class="button-item" onclick="location.href ='<c:url value="/member/logout"/>'">로그아웃</button>
					   </div>						   
					</c:if>
				</div>
			</section>
	</div>
</article>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

</div>

</body>
</html>