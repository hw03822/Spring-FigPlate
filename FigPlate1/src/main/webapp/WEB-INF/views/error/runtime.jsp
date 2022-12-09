<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
response.setStatus(200);
%>
<!DOCTYPE html> 	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/diner" />
<html>
<head>
<title>오류</title>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/header.css'/>">
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<link rel="shortcut icon" href="<c:url value='/images/pagelogo.png'/>">
</head>
<body>
<div class="wrapper">
	<article class="main-padding">
        <div class="except-main">
	<h2 style="color:red;"><fmt:message key="${message}"/></h2>
	<p>
	<!--
		Failed URL: ${url}
		Exception:  ${exception.message}
		<c:forEach items="${exception.stackTrace}" var="ste">    ${ste} 
		</c:forEach>
	-->
	</p>
	<p><a href='<c:url value="/"/>' role="button"><fmt:message key="HOME"/></a></p>
	</div>
	</article>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>
