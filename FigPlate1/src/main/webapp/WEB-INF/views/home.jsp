<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/header" />
<!DOCTYPE html>
<html>
<head>
<title>무화과플레이트: 혜화동 맛집 검색</title>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/bodyHeader.css'/>">
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<link rel="shortcut icon" href="<c:url value='/images/pagelogo.png'/>">
<link rel="stylesheet" href="<c:url value='/css/home.css'/>">
</head>
<body>
<div class="wrapper">
	<article class="main-padding">
	   <header class="main-header" style="background-image: url(<c:url value='/images/main_header2.jpg'/>);">
		<div>
			<p class="title">솔직한 리뷰, 믿을 수 있는 평점!</p>
			<h1 class="title">무화과플레이트</h1>
	
			<form action="<c:url value='/diner/search/1'/>" method="post" role="form">
				<fieldset class="main-search">
					<legend>전체 검색</legend>
					<label class="search-word" for="main-search">
						<span class="icon" style="background-image: url(<c:url value='/images/search.png'/>);"></span>
							<input id="main-search" class="HomeSearchInput" name="keyword" type="text" 
								maxlength="50" placeholder="식당 또는 음식" autocomplete="off" 
								onclick="trackEvent('CLICK_SEARCH_MAIN')">
					</label>
					<input class="btn-search" type="submit" value="검색" onclick="trackEvent('CLICK_KEYWORD_SEARCH');">
				</fieldset>
			</form>
		</div>
	   </header>
	   
	   <section class="main-section">
		  <div class="diner_list">
							
				<div class="diner_list_item" data-slick-index="0" aria-hidden="false" tabindex="-1" role="option">
           			<a href="<c:url value='/diner/list/read/1'/>" tabindex="0">
  						<img class="center-croping" alt="현지인 추천 강원도 원주 맛집 10곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/mango_pick/full/bbyms9qkskmgpw.png?fit=around|600:382&amp;crop=600:382;*,*&amp;output-format=jpg&amp;output-quality=80">
      						<figure class="diner_pick_item" >
      							<figcaption>
									<strong class="title">조회 수 추천</strong>
									<p class="hash">사람들이 궁금해 하는 그곳이 바로 핫플!</p>
								</figcaption>
							</figure>
					</a>
				</div>
				
				<div class="diner_list_item" data-slick-index="1" aria-hidden="false" tabindex="-1" role="option">
	 				<a href="<c:url value='/diner/list/like/1'/>" tabindex="0">
						<img class="center-croping" alt="조식 맛집 호텔 뷔페 7곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/mango_pick/full/qhsvbvcuhdgfwe.png?fit=around|600:382&amp;crop=600:382;*,*&amp;output-format=jpg&amp;output-quality=80">
							<figure class="diner_pick_item" >
								<figcaption>
									<strong class="title">좋아요 수 추천</strong>
									<p class="hash">가장 많은 사람들이 찜한 곳들이 궁금해?</p>
								</figcaption>
							</figure>
					</a>
				</div>
				
				<div class="diner_list_item" data-slick-index="2" aria-hidden="false" tabindex="-1" role="option">
         			<a href="<c:url value='/diner/list/menu/1'/>" tabindex="0">
						<img class="center-croping" alt="생활의 달인 맛집 7곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/mango_pick/full/8w9fnmda4kq0ah.JPG?fit=around|600:382&amp;crop=600:382;*,*&amp;output-format=jpg&amp;output-quality=80">
							<figure class="diner_pick_item" >
								<figcaption>
									<strong class="title">종류 별 추천</strong>
									<p class="hash">어떤 게 땡기는지 모르겠다면, 우선 눌러봐!</p>
								</figcaption>
							</figure>	
					</a>
				</div>
								
			</div>
		</section>
    </article>
    
	<jsp:include page="/WEB-INF/views/include/bodyHeader.jsp"/>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

</div>
</body>
</html>