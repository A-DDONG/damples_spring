<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>

<div class="main map active" id="hotplace-map">
	<div class="map-container">
		<c:forEach items="${HOTPLACE_LIST}" var="tour">
			<div class="place-marker"
				style="top: ${tour.tour_y_coord}px; left: ${tour.tour_x_coord}px;"
				data-place="${tour.tour_name}" data-category="${tour.main_category}"
				data-address="${tour.tour_addr}" data-tour-code="${tour.tour_code}"
				data-image="${tour.tour_imgcode}"></div>
		</c:forEach>
	</div>
	<img alt="핫플지도" src="${rootPath}/static/images/핫플지도.png">
</div>
<div class="main map" id="meokbang-map">
	<div class="map-container">
		<c:forEach items="${MEOKBANG_LIST}" var="tour">
			<div class="place-marker"
				style="top: ${tour.tour_y_coord}px; left: ${tour.tour_x_coord}px;"
				data-place="${tour.tour_name}" data-category="${tour.main_category}"
				data-address="${tour.tour_addr}" data-tour-code="${tour.tour_code}"
				data-image="${tour.tour_imgcode}"></div>
		</c:forEach>
	</div>
	<img alt="먹방지도" src="${rootPath}/static/images/먹방지도.png">
</div>
<div class="main map" id="acc-map">
	<div class="map-container">
		<c:forEach items="${ACC_LIST}" var="tour">
			<div class="place-marker"
				style="top: ${tour.tour_y_coord}px; left: ${tour.tour_x_coord}px;"
				data-place="${tour.tour_name}" data-category="${tour.main_category}"
				data-address="${tour.tour_addr}" data-tour-code="${tour.tour_code}"
				data-image="${tour.tour_imgcode}"></div>
		</c:forEach>
	</div>
		<img alt="숙박지도" src="${rootPath}/static/images/숙박지도.png">
</div>
<div class="info-box" id="infoBox">
	<!-- 정보박스 내용이 동적으로 추가될 것입니다. -->
</div>

<!-- 지도 영역 -->
<!-- <div id="map" style="width: 500px; height: 500px;"></div> -->


