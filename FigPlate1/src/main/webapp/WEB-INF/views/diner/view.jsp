<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/diner" />
<html>
<head>
<meta charset="UTF-8">
<title>${diner.dinerTitle}</title>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/header.css'/>">
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<link rel="shortcut icon" href="<c:url value='/images/pagelogo.png'/>">
<link rel="stylesheet" href="<c:url value='/css/detail.css'/>">
<link rel="stylesheet" href="<c:url value='/css/writingform.css'/>">
<link rel="stylesheet" href="<c:url value='/css/heart.css'/>">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.heartSvg').click(function() {
		
		$.ajax({
			type: "GET",
			url: "/myapp/diner/like/" + '${dinerId}',
			dateType: "json",
			success: function(result, status, xhr) {
				let target = $('.like');
				target.empty();
				//target.innerHTML = '';
				var view = '';
				view += `<div class="heartfull"><img class="button_img" alt="좋아요" src="<c:url value='/images/heartfull.png'/>"></div>
				<input class="button_txt" type="button" value="좋아요">
					<div id="result">` + result["dinerLikeCount"] + `</div>`;
				target.append(view);
				//target.innerHTML=view;
			}
		})
	});
});
</script>
</head>
<body>
<div class="wrapper">
	<article class="main-padding">
        <div class="except-main">
			<article class="contents">
				<div class="column-wrapper">
				    <!-- 데스크탑 컨텐츠 영역 -->
				    <div class="column-contents">
				        <div class="inner">
				        
				          <!-- 레스토랑 상세 -->
				          <section class="restaurant-detail">
				          	<!-- 레스토랑 제목 헤더 -->
				            <header>
				              <div class="restaurant_title">
				                <div class="title">
				                	<h1 class="restaurant_name"> ${diner.dinerTitle} </h1>
				                		<strong class="rate-point "><span>${starAvg}</span></strong>
				                </div>
				                
				                <!-- 목록&리뷰&좋아요 / 목록&수정&삭제 버튼 -->
				                <div class="restaurant_button">
				                  <a href='<c:url value="/diner/list/read/1"/>' class="button_link">
				                  	<img class="button_img" alt="가게목록" src="<c:url value='/images/list.png'/>">
									<button class="button_txt" type="button"><fmt:message key="DINER_LIST"/></button>
								  </a>
				                  
				                  <!-- 일반회원인 경우 리뷰&댓글 -->
				                  <c:if test="${sessionScope.role eq 2}">
				                  <a href='#replyContent' class="button_link">
				                  	<img class="button_img" alt="리뷰쓰기" src="<c:url value='/images/review.png'/>">
				                  	<button class="button_txt" type="button"><fmt:message key="REPLY"/></button>
				                  </a>
				                  
				                  <div class="like">
				                  	<div class="heartSvg">
				                  		<img class="button_img" alt="좋아요" src="<c:url value='/images/like.png'/>">
				                  	</div>
				                    <input class="button_txt" type="button" value="<fmt:message key="LIKE"/>">
									<div id="result"></div>
				                  </div>
				                  
				                  </c:if>
				                  
				                  <!-- 글쓴 가게주인인 경우 수정&사제 -->
				                  <c:if test="${diner.dinerWriterId eq sessionScope.userId}">
									<a href='<c:url value="/diner/update/${diner.dinerId}"/>' class="button_link">
										<img class="button_img" alt="수정" src="<c:url value='/images/update.png'/>">
										<button class="button_txt" type="button"><fmt:message key="UPDATE"/></button>
									</a>
									
									<a href='<c:url value="/diner/delete/${diner.dinerId}"/>' class="button_link">
										<img class="button_img" alt="삭제" src="<c:url value='/images/delete.png'/>">
										<button class="button_txt" type="button"><fmt:message key="DELETE"/></button>
									</a>
								</c:if>
								</div>
				              </div>
				              
				              <div class="statusCnt">
				                <span><img alt="조회수" src="<c:url value='/images/readCount.png'/>">${diner.dinerReadCount}</span>
				                <span><img alt="리뷰수" src="<c:url value='/images/reviewCount.png'/>">${replySize}</span>
				                <span><img alt="좋아요" src="<c:url value='/images/likeCount.png'/>">${diner.dinerLikeCount}</span>
				              </div>
				            </header>
				            
							<!-- 상세 정보 -->
				            <table class="info">
				              <tbody>
				              
				                <tr>
				                  <th><fmt:message key="DINER_ID"/></th>
				                  <td>${diner.dinerId}</td>
				                </tr>
				
				                <tr>
				                  <th><fmt:message key="WRITER"/></th>
				                  <td>${diner.dinerWriterId}</td>
				                </tr>
				                
				                <tr>
				                  <th><fmt:message key="CONTENT"/></th>
				                  <td>${diner.dinerContent}</td>
				                </tr>
				                
				                <c:if test="${!empty diner.fileName}">
								<tr>
									<th><fmt:message key="FILE"/></th>
									<td>
									<c:set var="len" value="${fn:length(diner.fileName)}"/>
									<c:set var="filetype" value="${fn:toUpperCase(fn:substring(diner.fileName, len-4, len))}"/>
									<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
										<img src='<c:url value="/file/${diner.fileId}"/>'><br>
									</c:if>
									</td>
								</tr>
								</c:if>
				                
							  </tbody>
							</table>
							<p class="update_date"><fmt:message key="WRITE_DATE"/> : <fmt:formatDate value="${diner.dinerWriteDate}" pattern="YYYY-MM-dd HH:mm:ss"/></p>
							<div id="reviewListFocusId"></div>
				          </section>
				          <!-- 레스토랑 상세 끝 -->	
			
						  <!-- 리뷰 -->
				  		  <section class="RestaurantReviewList">
				  		  	<!-- 리뷰 헤더 -->
				            <header class="RestaurantReviewList__Header">
				              <h2 class="RestaurantReviewList__Title">
				                <span class="RestaurantReviewList__RestaurantNameSuffixDesktop"><fmt:message key="REVIEW_COUNT"/></span>
				              <span class="RestaurantReviewList__AllCount">(${replySize})</span>
				              </h2>
				            </header>
				            
				            <!-- 리뷰 쓰기 -->
				            <c:if test="${sessionScope.role eq 2}">
							<form class="WritingPage_Form" action="<c:url value='/diner/review'/>" method="post" enctype="multipart/form-data">
								<table class="info">
								<tr>
									<th><fmt:message key="WRITER"/></th>
									<td><input type="text" name="Writer" id="Writer" value="${sessionScope.name}" readonly>
										<input type="hidden" name="replyWriterId" value="${sessionScope.userId}">
									</td>
								</tr>
								<tr>
									<th></th>
									<td><textarea name="replyContent" id="replyContent" placeholder="<fmt:message key="REVIEW_PLACEHOLDER"/>" rows="10" cols="100"></textarea></td>
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
										<input class="WritingPage_Submitbutton" type="submit" value="<fmt:message key="SAVE"/>">
										<input class="WritingPage_Cancelbutton" type="reset" value="<fmt:message key="CANCEL"/>">
									</td>
								</tr>
								</table>
							</form>
							</c:if>
			
							<!-- 리뷰 리스트 -->
							<c:if test="${replySize ne 0}">
				  			<ul class="RestaurantReviewList__ReviewList"> <!-- 전체리뷰 -->
				  			  <c:forEach items="${reply}" var="reply">
				  			  <li class="RestaurantReviewItem RestaurantReviewList__ReviewItem"> <!-- 리뷰 한개 -->
				  				<!-- 댓글 유저 정보 -->
							    <div class="RestaurantReviewItem__User">			      
							      <span class="RestaurantReviewItem__UserNickName">${reply.replyWriterId}</span>
							    </div>
							    <!-- 댓글 내용 -->
							    <div class="RestaurantReviewItem__ReviewContent">
							      <!-- 댓글 텍스트 내용 -->
				      			  <div class="RestaurantReviewItem__ReviewTextWrap">
							        <p class="RestaurantReviewItem__ReviewText">${reply.replyContent}</p>
							        <span class="RestaurantReviewItem__ReviewDate"><fmt:formatDate value="${reply.replyWriteDate}" pattern="YYYY-MM-dd HH:mm:ss"/></span>
				      			  </div>
							    </div>
							    <!-- 댓글 별점 -->
							    <div class="RestaurantReviewItem__Rating RestaurantReviewItem__Rating--Recommend">
							      <span class="RestaurantReviewItem__RatingText">${reply.replyStar}</span>
							    </div>
				  		  	  </li>
				  		  	  <li class="RestaurantReviewUpdateDelete">
				  		  	  	<!-- 수정/삭제 -->
							    <c:if test="${reply.replyWriterId eq sessionScope.userId}">
								<p>
									<a href="<c:url value='/diner/reviewUpdate/${diner.dinerId}/${reply.replyId}'/>"><fmt:message key="UPDATE"/></a> /			
									<a href="<c:url value='/diner/reviewdelete/${diner.dinerId}/${reply.replyId}'/>"><fmt:message key="DELETE"/></a>		
								</p>
								</c:if>
								<c:if test="${reply.replyWriterId ne sessionScope.userId}">
								<p>
									<fmt:message key="UPDATE"/> / 
									<fmt:message key="DELETE"/>		
								</p>
								</c:if>
				  		  	  </li>
				  		  	  </c:forEach>
				  		  	</ul>
				  		  	
				  		  	<div class="RestaurantReviewList__MoreReviewButton" role="button">
				             	 ˅ <fmt:message key="REVIEW_MORE_READ"/> ˅
				            </div>
				  		  	</c:if>
				  		  	
				  		  	<!-- 리뷰가 비어있을 경우 -->
				  		  	<c:if test="${replySize eq 0}">
				  		  	<div class="RestaurantReviewList__Empty">
				  		  	  <img src="<c:url value='/images/fig.png'/>">
				              <span class="RestaurantReviewList__EmptyTitle"><fmt:message key="REVIEW_EMPTY"/></span>
				              <img src="<c:url value='/images/fig.png'/>">
				            </div>
				            </c:if>
				            
				          </section>
				          <!-- 리뷰 끝 -->
				 	</div>
				  </div>
				  <!-- 데스크탑 콘텐츠 영역 끝 -->
				  <!-- 데스크탑 사이드 영역 -->
					<div class="side-wrap">
						<div class="column-side">
							<div class="inner">
								<!-- 내가 좋아요한 식당 -->
								<section class="module like-rastaurant likeByRestaurantList">
			              			<span class="title likeByRestaurantList__Title"><fmt:message key="LIKE_LIST"/></span>
									<ul class="list-restaurants type-single likeByRestaurantList__List">
										<c:forEach var="diner" items="${dinerList}"> <!-- 좋아요한 가게 하나씩 출력 -->
											<li class="LikeByRestaurantItem LikeByRestaurantList__Item">
			    								<div class="LikeByRestaurant__PictureAndContent">
													<a href='<c:url value="/diner/${diner.dinerId}"/>'>
														<div class="LikeByRestaurant__Picture"><!-- 가게 사진 출력 -->
															<c:if test="${!empty diner.fileName}">
																	<c:set var="len" value="${fn:length(diner.fileName)}"/>
																	<c:set var="filetype" value="${fn:toUpperCase(fn:substring(diner.fileName, len-4, len))}"/>
																	<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
																		<img src='<c:url value="/file/${diner.fileId}"/>'><br>
																	</c:if>
															</c:if>
														</div>
														<div class="LikeByRestaurant__Content"><!-- 가게내용 -->
													        <div class="LikeByRestaurant__NameWrap"><!-- 가게 제목-->
													          <span class="LikeByRestaurant__Name">${diner.dinerTitle}</span>
													          <span class="LikeByRestaurant__Rating">${diner.dinerStar}</span>
													        </div>
													        <div class="LikeByRestaurant__Contents"><!-- 가게 내용 -->
													          <span class="LikeByRestaurant__ContentText">${diner.dinerContent}</span>
													        </div>
													    </div>
													</a>
												</div>
											</li>
										</c:forEach>
									</ul>
								</section>
								<!-- 이 식당 관련 태그 -->
								<section class="module related-tags">
					                <span class="title"><fmt:message key="RELATED_TAGS"/></span>
					                <p>
					                    <a href="<c:url value='/diner/menu/${diner.menuId}/'/>" class="tag-item"># ${menuName}</a>
					                </p>
					            </section>
							</div>
						</div>
					</div>
					<!-- 데스크탑 사이드 영역 끝 -->
				</div>    
			</article>			
		</div>
	</article>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>