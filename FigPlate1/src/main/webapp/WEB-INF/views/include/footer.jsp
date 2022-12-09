<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer">
  <div class="inner">
    <div class="mainlogo">
      <a href="<c:url value="/"/>" class="btn-mp">
        <img class="mainlogo_img" src="<c:url value='/images/mainlogo.png'/>">
      </a>
      <p class="subtitle">Eat, Share, Be Happy.</p>
    </div>

    <p class="sns-shortcut">
      <a class="btn facebook" href="https://www.facebook.com/" target="_blank" 
     		style="background-image: url(<c:url value='/images/facebook_icon.png'/>);">
				무화과플레이트 페이스북 계정으로 바로가기
      </a>

      <a class="btn instagram" href="https://instagram.com/" target="_blank"
            style="background-image: url(<c:url value='/images/instagram_icon.png'/>);">
				무화과플레이트 인스타그램 계정으로 바로가기</a>
    </p>

    <nav class="links-external">
      <ul class="list-links">
          <li>
            <a href="<c:url value="/"/>">회사소개</a>
          </li>
          <li>
            <a href="<c:url value="/"/>">브랜드 가이드라인</a>
          </li>
          <li>
            <a href="<c:url value="/"/>">광고 문의</a>
          </li>

      </ul>

      <ul class="list-links">
            <li>
              <a href="<c:url value="/"/>">공지사항</a>
            </li>
            <li>
              <a href="<c:url value="/"/>">이용약관</a>
            </li>
            <li>
              <a href="<c:url value="/"/>">비회원 이용자 이용정책</a>
            </li>
            <li>
              <a href="<c:url value="/"/>">개인정보처리방침</a>
            </li>
            <li>
              <a href="<c:url value="/"/>">위치기반서비스 이용약관</a>
            </li>
            <li>
              <a href="<c:url value="/"/>">커뮤니티 가이드라인</a>
            </li>
            <li>
              <a href="<c:url value="/"/>">청소년보호정책</a>
            </li>

            <li>
              <a href="<c:url value="/"/>">문의하기</a>
            </li>
      </ul>
    </nav>


    <div class="language-copyrights">
      <p class="select-language">
        <a href="<c:url value="/"/>" class="selected">한국어</a>

        <a href="<c:url value="/"/>">English</a>

        <a href="<c:url value="/"/>">简体中文</a>
      </p>

      <small>
        <p>
          
          ㈜ 무화과아이조아컴퍼니<br>서울특별시 종로구 창경궁로 254, 7층<br>대표이사: 어민수<br>사업자 등록번호: 123-45-67890 <br>통신판매업 신고번호: 2022-서울혜화-01234<br>고객센터: 02-823-1234<br><br>
          <span class="copyrights">© 2022 FigPlate Co., Ltd. All rights reserved.</span>
        </p>
      </small>
    </div>
  </div>
</footer>
