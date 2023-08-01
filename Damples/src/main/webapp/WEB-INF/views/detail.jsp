<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<c:set value="20230705-050" var="version" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${rootPath}/static/css/main.css?${version}">
<link rel="stylesheet" href="${rootPath}/static/css/nav.css?${version}">
<link rel="stylesheet"
   href="${rootPath}/static/css/detail.css?${version}">
<link rel="stylesheet"
   href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script>
   var rootPath = "${rootPath}"
</script>
<script src="${rootPath}/static/js/main_nav.js"></script>

</head>
<body>
   <header>
      <%@ include file="/WEB-INF/views/tour/nav.jsp"%>
   </header>
   <div class="container">
      <div class="wrapper">
         <div class="title">
            <h1>${TOUR.main_category}</h1>
         </div>

         <div class="line"></div>

         <div class="detail-title">
            <p>${TOUR.tour_name}</p>
            <p>${TOUR.tour_category}</p>
         </div>

         <div class="detail-bigbox">
            <div class="detail-img swiper-container">
               <div class="swiper-wrapper">
                  <div class="swiper-slide">
                     <img src="${rootPath}/static/images/테스트.png" />
                  </div>
                  <div class="swiper-slide">
                     <img src="${rootPath}/static/images/테스트.png" />
                  </div>
                  <div class="swiper-slide">
                     <img src="${rootPath}/static/images/테스트.png" />
                  </div>
               </div>
               <!-- Add Navigation -->
               <div class="swiper-button-next"></div>
               <div class="swiper-button-prev"></div>
            </div>
            <div class="detail-box">
               <ul>
                  <li><span>&bull;&nbsp;주소</span>
                     <p>${TOUR.tour_addr}</p></li>
                  <li><span>&bull;&nbsp;전화번호</span>
                     <p>${TOUR.tour_tel}</p></li>
                  <li><span>&bull;&nbsp;영업시간</span>
                     <p>${TOUR.tour_time}</p></li>
                  <li><span>&bull;&nbsp;휴식시간</span>
                     <p>${TOUR.tour_rtime}</p></li>
                  <li><span>&bull;&nbsp;입장료</span>
                     <p>${TOUR.tour_fee}</p></li>
                  <li><span>&bull;&nbsp;기타</span>
                     <p>${TOUR.tour_notic}</p></li>

               </ul>
            </div>
         </div>
      </div>
   </div>
   <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
   var swiper = new Swiper('.swiper-container', {
      slidesPerView : 1,
      spaceBetween : 10,
      navigation : {
         nextEl : '.swiper-button-next',
         prevEl : '.swiper-button-prev',
      },
   });
</script>
</body>
</html>