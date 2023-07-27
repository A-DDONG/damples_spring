<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>

<div class="main map active" id="hotplace-map">
	<div class="map-container">
		<div class="place-marker" style="top: 125px; left: 373px;"
			data-place="가마골" data-category="식당" data-address="서울시 강남구"></div>
		<!-- 다른 장소들도 동일한 방식으로 추가 -->
	</div>
	<img alt="핫플지도" src="${rootPath}/static/images/핫플지도.png">
</div>
<div class="main map" id="meokbang-map">
	<img alt="먹방지도" src="${rootPath}/static/images/먹방지도.png">
</div>
<div class="main map" id="acc-map">
	<img alt="숙박지도" src="${rootPath}/static/images/숙박지도.png">
</div>
<div class="info-box" id="infoBox"> 
	<!-- 정보박스 내용이 동적으로 추가될 것입니다. -->
</div>
<!-- 지도 영역 -->
<div id="map" style="width: 500px; height: 500px;"></div>


