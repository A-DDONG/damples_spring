<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<c:set value="20230705-050" var="version" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>담양 여행의 시작 DAMPLES</title>
<link rel="stylesheet" href="${rootPath}/static/css/main.css?${version}">
<link rel="stylesheet" href="${rootPath}/static/css/nav.css?${version}">
<link rel="stylesheet"
	href="${rootPath}/static/css/mapnav.css?${version}">
<link rel="stylesheet" href="${rootPath}/static/css/map.css?${version}">
<link rel="stylesheet"
	href="${rootPath}/static/css/event.css?${version}">
<link rel="stylesheet"
	href="${rootPath}/static/css/main_tourlist.css?${version}">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script>
	// JS 파일에서 rootPath 정보를 
	// 사용할수 있도록 전역(global) 변수로 선언
	var rootPath = "${rootPath}"
</script>
<script src="${rootPath}/static/js/main_nav.js"></script>
<script src="${rootPath}/static/js/main_map.js"></script>
<script src="${rootPath}/static/js/scroll.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
	  var swiper = new Swiper('.swiper-container', {
	    slidesPerView: 3,
	    spaceBetween: 10,
	    navigation: {
	      nextEl: '.swiper-button-next',
	      prevEl: '.swiper-button-prev',
	    },
	    pagination: {
		      el: '.swiper-pagination',
		      clickable: true,
		    },
	  });
	});
</script>
<script>
    let url = "https://api.openweathermap.org/data/2.5/weather?q=damyang&appid=6cf9a99f768ce493e58c351ccf43588a&lang=kr&units=metric";

    fetch(url)
      .then((response) => {
        return response.json();
      })
      .then((json) => {
        console.log(json);

        let result =
          "현재온도 : " +
          Math.floor(json.main.temp) +
          "°C<br>"; //소수점 버림 온도를 찍어줌
        let icon = json.weather[0].icon; //아이콘 받아옴
        document.getElementById("humidity").innerHTML = result; //result를 humidity라는 id를 가진 span에 innerHTML로 표시
        let iconurl = document.getElementById("ic"); //img id를 iconurl이라는 이름으로 받아옴
        iconurl.src = "${rootPath}/static/images/icon/" + icon + ".png"; //iconurl로 src를 설정해줌
      });
</script>
</head>

<body>
	<header>
		<%@ include file="/WEB-INF/views/tour/nav.jsp"%>
	</header>
	<div class="container">
		<%@ include file="/WEB-INF/views/tour/mapnav.jsp"%>
		<%@ include file="/WEB-INF/views/tour/map.jsp"%>
		<%@ include file="/WEB-INF/views/tour/event.jsp"%>
		<%@ include file="/WEB-INF/views/tour/main_tourlist.jsp"%>
		<div class="scroll">
			<img class="img" src="${rootPath}/static/images/화살표.png" width="50px" />
			<button class="scroll button">TOP!</button>
		</div>
	</div>
</body>

</html>

