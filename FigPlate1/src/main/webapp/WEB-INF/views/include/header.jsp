<%@page contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/header" />
<header class="header header-transparent">
  	<!-- LOGO -->
	<a href="<c:url value='/'/>" class="header-logo">
		<img src="<c:url value='/images/mainlogo_colored.png'/>" alt="logo_image" title="Fig Plate">
	</a>

	<div class="header-searchbox">
		<span class="header-searchicon" style="background-image: url(<c:url value='/images/search.png'/>);"></span>

		<form action="<c:url value='/diner/search/1'/>" method="post" role="form">
			<label class="header-searchinput-wrap">
				<input class="header-searchinput" name="keyword" type="text" maxlength="50" placeholder="<fmt:message key="DINER_OR_FOOD" />" autocomplete="off">
				<input class="header-searchbtn" type="submit" value="<fmt:message key="SEARCH" />">
			</label>
		</form>
	</div>

	<ul class="header-menulist">
		<!-- 가게회원 메뉴 -->
		<c:if test="${!empty userId && role == 1}">
			<li class="header-menuitem">
				<a href="<c:url value='/diner/write/1'/>" class="header-menulink">
				<span class="header-menutext"><fmt:message key="INSERT_DINER" /></span></a>
			</li>
			<li class="header-menuitem">
				<a href="<c:url value='/member/statistic/${sessionScope.dinerId}'/>" class="header-menulink">
				<span class="header-menutext"><fmt:message key="DINER_STATISTIC_INFO" /></span></a>
			</li>
			<li class="header-menuitem">
				<a href="<c:url value='/member/view'/>" class="header-menulink">
				<span class="header-menutext"><fmt:message key="USER_INFO_DETAIL" /></span></a>
			</li>
		</c:if>
		<!-- 일반회원 메뉴 -->
		<c:if test="${!empty userId && role == 2}">
			<li class="header-menuitem">
				<a href="<c:url value='/member/like'/>" class="header-menulink">
				<span class="header-menutext"><fmt:message key="LIKE_LIST" /></span></a>
			</li>
			<li class="header-menuitem">
				<a href="<c:url value='/member/view'/>" class="header-menulink">
				<span class="header-menutext"><fmt:message key="USER_INFO_DETAIL" /></span></a>
			</li>
		</c:if>
		<!-- LOGIN/LOGOUT -->
		<li class="header-menuitem">
			<c:if test="${empty userId}">
				<a href="<c:url value="/member/login"/>" class="header-menulink">
				<span class="header-menutext"><fmt:message key="SIGN_IN" /></span></a>
			</c:if>
			<c:if test="${!empty userId}">
				<a href="<c:url value='/member/logout'/>" class="header-menulink">
				<span class="header-menutext"><fmt:message key="SIGN_OUT" /></span></a>
			</c:if>
			</li>
		</ul>

</header>