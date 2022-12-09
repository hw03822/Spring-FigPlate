<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/diner"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#file").on('change',function(){
		console.log("change");
		  var fileName = $("#file").val();
		  $(".WritingPage_UploadName").val(fileName);
	});
});
</script>
<title><fmt:message key="WRITE_NEW_DINER"/></title>
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
	        <section class="WritingPage_Container">
			<form:form action="${actionURL}" modelAttribute="diner" enctype="multipart/form-data">
			<h2 class="WritingPage_Title"><fmt:message key="WRITE_NEW_ARTICLE"/></h2>
			<form class="WritingPage_Form" action="<c:url value='/diner/write'/>" method="post" enctype="multipart/form-data">
			<table class="info">
			<tr>
				<th><fmt:message key="MENU"/></th>
				<td>
					<c:if test="${!empty menuList}">
					<select name="menuId" id="menuId" required>
						<c:forEach var="menu" items="${menuList}">
							<option value="${menu.menuId}" ${menu.menuId eq requestScope.menuId? "selected" : ""}>
							${menu.menuName}</option>
						</c:forEach>
					</select>
					</c:if>
				</td>
			</tr>
			<tr>
				<th><fmt:message key="WRITER"/></th>
				<td>
					<input type="text" name="dinerWriter" id="dinerWriter" value="${sessionScope.name}" readonly>
					<input type="hidden" name="dinerWriterId" value="${sessionScope.userId}">
				</td>
				
			</tr>
			<tr>
				<th><fmt:message key="SUBJECT"/></th>
				<td><form:input path="dinerTitle" type="text" required="required"/>
					<form:errors path="dinerTitle" class="error"/></td>
			</tr>
			<tr>
				<th><fmt:message key="CONTENT"/></th>
				<td><textarea name="dinerContent" rows="10" cols="100"></textarea></td>
			</tr>
			<tr>
				<th><fmt:message key="FILE"/></th>
				<td class="WritingPage_Filebox">
					<input class="WritingPage_UploadName" value="<fmt:message key="FILESIZE_ERROR"/>" placeholder="<fmt:message key="FILESIZE_ERROR"/>">
					<label for="file"><fmt:message key="FILE_FIND"/></label>
					<input type="file" name="file" id="file">
				</td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td class="WritingPage_button" style="text-align: right;">
					<input class="WritingPage_Submitbutton" type="submit" value="<fmt:message key="SAVE"/>">
					<input class="WritingPage_Cancelbutton" type="reset" value="<fmt:message key="CANCEL"/>">
				</td>
			</tr>
			</table>
			</form>
			</form:form>
			</section>
		</div>
	</article>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>