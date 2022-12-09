<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/diner"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><fmt:message key="REIVEW"/></title>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/header.css'/>">
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<link rel="shortcut icon" href="<c:url value='/images/pagelogo.png'/>">
<link rel="stylesheet" href="<c:url value='/css/detail.css'/>">
<link rel="stylesheet" href="<c:url value='/css/writingform.css'/>">
</head>
<body>
<div class="wrapper">
	<article class="main-padding">
        <div class="except-main">
			<section class="WritingPage_Container">
			<section class="WritingPage_Container">
			<h2 class="WritingPage_Title"><fmt:message key="REVIEW"/></h2>
			<form class="WritingPage_Form" action="<c:url value='/diner/reviewUpdate'/>" method="post" enctype="multipart/form-data">
			<table class="info">
			<tr>
				<th><fmt:message key="WRITER"/></th>
				<td>
					<input type="text" name="Writer" id="Writer" value="${sessionScope.name}" readonly>
					<input type="hidden" name="replyWriterId" id="replyWriterId" value="${reply.replyWriterId}">	
				</td>
			</tr>
			<tr>
				<th></th>
				<td><textarea name="replyContent" rows="10" cols="100">${reply.replyContent}</textarea></td>
			</tr>
			<tr>
				<th><fmt:message key="REPLY_STAR"/></th>
				<td>
					<fieldset>
						<input type="radio" name="replyStar" id="replyStar1" value="5"><label for="replyStar1">⭐</label>
						<input type="radio" name="replyStar" id="replyStar2" value="4"><label for="replyStar2">⭐</label>
						<input type="radio" name="replyStar" id="replyStar3" value="3"><label for="replyStar3">⭐</label>
						<input type="radio" name="replyStar" id="replyStar4" value="2"><label for="replyStar4">⭐</label>
						<input type="radio" name="replyStar" id="replyStar5" value="1"><label for="replyStar5">⭐</label>
					</fieldset>
				</td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td class="WritingPage_button" style="text-align:right;">
					<input type="hidden" name="dinerId" value="${dinerId}">
					<input type="hidden" name="replyId" value="${replyId}">
					<input class="WritingPage_Submitbutton" type="submit" value="<fmt:message key="SAVE"/>">
					<input class="WritingPage_Cancelbutton" type="reset" value="<fmt:message key="CANCEL"/>">
				</td>
			</tr>
			</table>
			</form>
			</section>
		</div>
	</article>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>