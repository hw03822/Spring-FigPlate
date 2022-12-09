<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/diner" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<title>무화과플레이트: 혜화동 맛집 검색</title>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/header.css'/>">
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<link rel="shortcut icon" href="<c:url value='/images/pagelogo.png'/>">
<link rel="stylesheet" href="<c:url value='/css/list.css'/>">
<body>
<div class="wrapper">
	<article class="main-padding">
		<div class="except-main">
			<section class="main-section top-list">
          		<div class="inner">
          			<c:set var="read" value="read" />
          			<c:set var="like" value="like" />
          			<c:set var="menu" value="menu" />
          			<c:set var="all" value="all" />
          			<c:if test="${statisticId eq read}">
	          			<h1 class="title">조회 수 추천 리스트</h1>
          			</c:if>
          			<c:if test="${statisticId eq like}">
	          			<h1 class="title">좋아요 수 추천 리스트</h1>
          			</c:if>
          			<c:if test="${statisticId eq menu}">
	          			<h1 class="title">종류 별 추천 리스트</h1>
          			</c:if>
          			<c:if test="${statisticId eq all}">
	          			<h1 class="title">전체 추천 리스트</h1>
          			</c:if>
          			
          			<div class="slider-container">
			          <p class="tags">
						<button class="tag-item selected" onclick="location.href='<c:url value='/diner/list/all'/>'">전체</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/1'/>'">한식</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/2'/>'">분식</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/3'/>'">양식</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/4'/>'">일식</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/5'/>'">중식</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/6'/>'">뷔페</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/7'/>'">디저트</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/8'/>'">카페</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/9'/>'">술집</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/10'/>'">치킨</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/11'/>'">브런치</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/12'/>'">세계음식</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/13'/>'">패스트푸드</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/menu/14'/>'">기타</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/list/read/1'/>'">조회 수 순으로 보기</button>
						<button class="tag-item" onclick="location.href='<c:url value='/diner/list/like/1'/>'">좋아요 순으로 보기</button>
			          </p>
			        </div>
			        
			        <div class="restaurant-container">
		            <ul class="list-restaurants">
		            	<!-- 2개씩 출력 -->
						<c:set var="i" value="0" />
						<c:set var="j" value="2" />
						<c:forEach var="diner" items="${dinerList}">
							<c:if test="${i%j == 0 }">
								<li class="list-restaurant">
							</c:if>
							<div class="list-restaurant-item">
								<figure class="restaurant-item">
									<a href="<c:url value='/diner/${diner.dinerId}'/>">
										<div class="thumb">
											<img src='<c:url value="/file/${diner.fileId}"/>' class="center-croping lazy" style="display: block;">
										</div>
									</a>
									<figcaption>
										<div class="info">
											<p class="dinerId">No. ${diner.dinerId}</p>
											<a href="<c:url value='/diner/${diner.dinerId}'/>">
												<h2 class="title">${diner.dinerTitle}</h2><strong class="diner-star">${diner.dinerStar}</strong>
											</a>
											<p class="etc-info-1">
												<span class="view-count-icon" style="background-image: url(<c:url value='/images/readCount.png'/>);"></span>
												<span class="view-count">${diner.dinerReadCount}</span>
												<span class="like-count-icon" style="background-image: url(<c:url value='/images/likeCount.png'/>);"></span>
												<span class="like-count">${diner.dinerLikeCount}</span>
											</p>
											<p class="etc-info-2">
												<span class="write-date">작성일 : <fmt:formatDate value="${diner.dinerWriteDate}" pattern="YYYY-MM-dd"/></span>
											</p>
										</div>
									</figcaption>
								</figure>
							</div>
							<c:if test="${i%j == j-1 }">
								</li>
							</c:if>
							<c:set var="i" value="${i+1 }" />
						</c:forEach>
						

		                  </ul>      
						<div class="paging-container">
								<jk:paging statisticId="${statisticId}"
									totalPageCount="${totalPageCount}" nowPage="${page}"/>
						</div>
		            
		            </div>
            </div>
         </section>
	   </div>
	</article>
	
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

</div>
</body>
</html>