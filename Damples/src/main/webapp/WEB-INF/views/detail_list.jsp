<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주요관광지</title>
<link rel="stylesheet" href="${rootPath}/static/css/main.css?${version}">
<link rel="stylesheet" href="${rootPath}/static/css/nav.css?${version}">
<link rel="stylesheet" href="${rootPath}/static/css/info.css?${version}">
<link rel="stylesheet"
	href="${rootPath}/static/css/detail.css?${version}">
<script>
	// JS 파일에서 rootPath 정보를 
	// 사용할수 있도록 전역(global) 변수로 선언
	var rootPath = "${rootPath}"
</script>
<script src="${rootPath}/static/js/main_nav.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
$(document).ready(function(){
    // 모든 spot-list 를 숨김
    $('.spot-list').hide();

    // 기본적으로 첫 번째 tab (핫플)과 관련된 리스트를 보임
    $('.spot-list').first().show();

    $('.course-tab li').click(function(){
        var index = $(this).index();

        $('.course-tab li').removeClass('active');
        $(this).addClass('active');

        $('.spot-list').hide();
        $('.spot-list').eq(index).show();
    });
});
</script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/views/tour/nav.jsp"%>
	</header>
	<div class="container">
		<div class="wrapper">
			<div class="title">
				<h1>주요 관광지</h1>
			</div>

			<div class="title-tab">
				<ul class="course-tab">
					<li class="active">핫플</li>
					<li>먹방</li>
					<li>숙박</li>
				</ul>
			</div>

			<div class="spot-list">
				<c:forEach var="tour" items="${HOTPLACE_LIST}">
					<div class="spot-info">
						<img src="${rootPath}/static/images/테스트.png">
						<div class="description">
							<span>${tour.tour_name}</span><span>${tour.tour_info}</span>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="spot-list">
				<c:forEach var="tour" items="${MEOKBANG_LIST}">
					<div class="spot-info">
						<img src="${rootPath}/static/images/테스트.png">
						<div class="description">
							<span>${tour.tour_name}</span><span>${tour.tour_info}</span>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="spot-list">
				<c:forEach var="tour" items="${ACC_LIST}">
					<div class="spot-info">
						<img src="${rootPath}/static/images/테스트.png">
						<div class="description">
							<span>${tour.tour_name}</span><span>${tour.tour_info}</span>
						</div>
					</div>
				</c:forEach>
			</div>


		</div>
	</div>
</body>
</html>