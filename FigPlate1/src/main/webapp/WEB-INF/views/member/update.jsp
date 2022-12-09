<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/member" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><fmt:message key="UPDATE_USER_INFO"/></title>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/header.css'/>">
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<link rel="shortcut icon" href="<c:url value='/images/pagelogo.png'/>">
<link rel="stylesheet" href="<c:url value='/css/writingform.css'/>">
<style type="text/css">
.error {
	color:red
}
</style>
</head>
<body>
<div class="wrapper">
	<article class="main-padding">
        <div class="except-main">
        	<section class="WritingPage_Container">
			<h2 class="WritingPage_Title">회원정보 수정</h2>
			<c:url value="/member/update" var="actionURL" scope="page"/>
			<form:form class="WritingPage_Form" action="${actionURL}" modelAttribute="member">
			<span class="WritingPage_UpdateText"><fmt:message key="MANAGER_INQUIRE"/></span>
			<table class="info">
				<tr>
					<th><fmt:message key="MEMBER_ID"/></th>
					<td><form:input path="userId"  required="required" readonly="true"/></td>
				</tr>
				<tr>
					<th><fmt:message key="MEMBER_NAME"/></th>
					<td><form:input path="name" required="required" readonly="true"/></td>
				</tr>
				<tr>
					<th><fmt:message key="MEMBER_PW"/></th>
					<td><form:input path="password" required="required"/>
						<form:errors path="password" class="error"/></td>
				</tr>
				<tr>
					<th><fmt:message key="MEMBER_BIRTH"/></th>
					<td><form:input path="birthDate" type="date" required="required" readonly="true"/></td>
				</tr>
				<tr>
					<th><fmt:message key="MEMBER_GENDER"/></th>
					<td><form:radiobutton path="gender" value="1" onclick="return(false)" checked="${member.gender == 1 ? 'checked' : '' }" /> <fmt:message key="MAN"/>
						<form:radiobutton path="gender" value="2" onclick="return(false)" checked="${member.gender == 2 ? 'checked' : '' }" /> <fmt:message key="WOMAN"/></td>
				</tr>
				<tr>
					<th><fmt:message key="MEMBER_PHONE"/></th>
					<td><form:input path="phone"/>
						<form:errors path="phone" class="error"/></td>
				</tr>
				<tr>
					<th><fmt:message key="MEMBER_EMAIL"/></th>
					<td><form:input path="email" type="email" required="required"/>
						<form:errors path="email" class="error"/></td>
				</tr>
				<tr>
					<th><fmt:message key="MEMBER_ROLE"/></th>
					<td><form:radiobutton path="role" value="1" onclick="return(false)" checked="${member.role == 1 ? 'checked' : '' }" /> <fmt:message key="OWNER"/>
						<form:radiobutton path="role" value="2" onclick="return(false)" checked="${member.role == 2 ? 'checked' : '' }" /> <fmt:message key="GUEST"/></td>
				</tr>
				<tr>
					<th>&nbsp;</th>
					<td colspan="2" class="WritingPage_button" style="text-align: left;">
						<input class="WritingPage_Submitbutton" type="submit" value="<fmt:message key="SAVE"/>"/>
						<input class="WritingPage_Cancelbutton" type="reset" value="<fmt:message key="CANCEL"/>"/>
						<input class="WritingPage_Cancelbutton" type="button" onclick="history.back()" value="<fmt:message key="PRIVIOUS"/>"/>
					</td>
				</tr>
			</table>
			</form:form>
			</section>
		</div>
	</article>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>