<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/member" />
<html>
<head>
<meta charset="UTF-8">
<title><fmt:message key="RESULT"/></title>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/header.css'/>">
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<link rel="shortcut icon" href="<c:url value='/images/pagelogo.png'/>">
</head>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<body>
<div class="wrapper">
	<article class="main-padding">
        <div class="except-main">
<div class="container">
<div class="content">
<h1><fmt:message key="RESULT"/></h1>
<h2>${message}</h2>
</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
	</article>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>
