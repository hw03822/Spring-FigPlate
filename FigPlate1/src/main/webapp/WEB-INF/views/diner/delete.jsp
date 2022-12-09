<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/diner" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><fmt:message key="DELETE" /></title>
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
				<div class="dinerBoardDelete_Title"><!-- 타이틀 이미지 들어가는 곳 -->
					<div class="dinerBoardDelete_Img" style="background-image: url(<c:url value='/images/figdelete.png'/>);"></div>
<%--         			<img alt="무화과" src="<c:url value='/images/figdelete.png'/>"> --%>
			        <div class="dinerBoardDelete_Content">
			        	<p>
				          FIG PLATE
				        </p>
				        <p class="small-word"><fmt:message key="DELETE_ARTICLE"/></p>
			        </div>
			 	 </div>
				
				<div class="dinerBoardDelete_Content"><!-- 타이틀 밑 콘텐츠 영역 -->
					<div class="dinerBoardDelete_Form">
				        <c:if test="${empty replyId}"> <!-- 본게시물 삭제 폼-->
				        	<p class="orange-font"><fmt:message key="DELETE_MSG" /></p>
							<form class="WritingPage_DeleteForm" action="<c:url value='/diner/delete'/>" method="post">
								<input type="hidden" name="dinerId" value="${dinerId}">
								<input type="hidden" name="menuId" value="${menuId}">
								<input type="hidden" name="dinerWriterId" value="${dinerWriterId}">
								<input type="password" name="password" required>
								<input type="submit" class="WritingPage_DeleteSubmitbutton" value="<fmt:message key="DELETE_ARTICLE"/>">
								<input type="button" class="WritingPage_DeleteCancelbutton" onclick="history.back()" value="<fmt:message key="PRIVIOUS"/>"/>
							</form>
						</c:if>
						<c:if test="${not empty replyId}"><!-- 댓글 삭제 -->
							<p class="orange-font"><fmt:message key="DELETE_MSG_REPLY" /></p>
							<form class="WritingPage_DeleteForm" action="<c:url value='/diner/reviewdelete'/>" method="post">
								 <input type="hidden" name="dinerId" value="${dinerId}">
								 <input type="hidden" name="replyId" value="${replyId}"> 
								 <input type="hidden" name="replyWriterId" value="${replyWriterId}">
								 <input type="password" name="password" required>
								 <input type="submit" class="WritingPage_DeleteSubmitbutton" value="<fmt:message key="DELETE_ARTICLE"/>">
								 <input type="button" class="WritingPage_DeleteCancelbutton" onclick="history.back()" value="<fmt:message key="PRIVIOUS"/>"/>
							</form>
						</c:if>
						
				     </div>
				</div>				
			</div>
		</article>
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
</html>