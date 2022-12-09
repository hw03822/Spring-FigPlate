<%@page contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/header" />
<header class="header header-transparent">
  	<!-- LOGO -->
	<a href="<c:url value='/'/>" class="header-logo">
		<img src="<c:url value='/images/mainlogo.png'/>" alt="logo_image" title="Fig Plate">
	</a>

<!-- 	<div class="header-searchbox">
		<i class="header-searchicon"></i>
	
		<label class="header-searchinput-wrap">
			<input type="text" class="header-searchinput" placeholder="지역, 식당 또는 음식" value="" autocomplete="off" maxlength="50">
		</label>
	
		<button class="header-searchinput-clearbutton">CLEAR</button>
	</div> -->

	<ul class="header-menulist">
		<!-- 가게회원 메뉴 -->
		<c:if test="${!empty userId && role == 1}">
			<li class="header-menuitem">
				<a href="<c:url value='../diner/write/1'/>" class="header-menulink">
				<span class="header-menutext">가게 입력</span></a>
			</li>
			<li class="header-menuitem">
				<a href="<c:url value='/member/statistic/${sessionScope.dinerId}'/>" class="header-menulink">
				<span class="header-menutext">내 가게 통계</span></a>
			</li>
			<li class="header-menuitem">
				<a href="<c:url value='/member/view'/>" class="header-menulink">
				<span class="header-menutext">내 정보</span></a>
			</li>
		</c:if>
		<!-- 일반회원 메뉴 -->
		<c:if test="${!empty userId && role == 2}">
			<li class="header-menuitem">
				<a href="<c:url value='/member/like'/>" class="header-menulink">
				<span class="header-menutext">좋아요 리스트</span></a>
			</li>
			<li class="header-menuitem">
				<a href="<c:url value='/member/view'/>" class="header-menulink">
				<span class="header-menutext">내 정보</span></a>
			</li>
		</c:if>
		<!-- LOGIN/LOGOUT -->
		<li class="header-menuitem">
			<c:if test="${empty userId}">
				<a href="<c:url value="/member/login"/>" class="header-menulink">
				<span class="header-menutext">로그인</span></a>
			</c:if>
			<c:if test="${!empty userId}">
				<a href="<c:url value='/member/logout'/>" class="header-menulink">
				<span class="header-menutext">로그아웃</span></a>
			</c:if>
			</li>
		</ul>

</header>