<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="tour-category active" id="hotplace" data-category="hotplace">
	<div class="tourlist hp">
		<h1>Hot Place</h1>
		<div class="line"></div>
	</div>
	<div class="tourlist sub">
		<p class="check">✓</p>
		<p class="sub_name">유적지</p>
	</div>
	<div class="tourlist tourinfo">
		<c:forEach items="${TOUR_LIST}" var="tour">
			<c:choose>
				<c:when test="${tour.tour_code == 'H0006'}">
					<ul class="tour-box">
						<li><img src="your_image1.jpg" alt="Image 1">
							<p class="title">${tour.tour_name}</p>
							<p class="sub">${tour.tour_info}</p> <!-- 다른 필요한 정보들을 출력 --></li>
					</ul>
				</c:when>
				<c:when test="${tour.tour_code == 'H0005'}">
					<ul class="tour-box">
						<li><img src="your_image2.jpg" alt="Image 2">
							<p class="title">${tour.tour_name}</p>
							<p class="sub">${tour.tour_info}</p> <!-- 다른 필요한 정보들을 출력 --></li>
					</ul>
				</c:when>
				<c:otherwise>
					<!-- 해당하는 조건이 없을 경우 아무 작업도 하지 않음 -->
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>

	<div class="tourlist sub">
		<p class="check">✓</p>
		<p class="sub_name">자연생활</p>
	</div>
	<div class="tourlist tourinfo">
		<c:forEach items="${TOUR_LIST}" var="tour">
			<c:choose>
				<c:when test="${tour.tour_code == 'H0003'}">
					<ul class="tour-box">
						<li><img src="your_image1.jpg" alt="Image 1">
							<p class="title">${tour.tour_name}</p>
							<p class="sub">${tour.tour_info}</p> <!-- 다른 필요한 정보들을 출력 --></li>
					</ul>
				</c:when>
				<c:when test="${tour.tour_code == 'H0004'}">
					<ul class="tour-box">
						<li><img src="your_image2.jpg" alt="Image 2">
							<p class="title">${tour.tour_name}</p>
							<p class="sub">${tour.tour_info}</p> <!-- 다른 필요한 정보들을 출력 --></li>
					</ul>
				</c:when>
				<c:when test="${tour.tour_code == 'H0007'}">
					<ul class="tour-box">
						<li><img src="your_image1.jpg" alt="Image 1">
							<p class="title">${tour.tour_name}</p>
							<p class="sub">${tour.tour_info}</p> <!-- 다른 필요한 정보들을 출력 --></li>
					</ul>
				</c:when>
				<c:when test="${tour.tour_code == 'H0008'}">
					<ul class="tour-box">
						<li><img src="your_image2.jpg" alt="Image 2">
							<p class="title">${tour.tour_name}</p>
							<p class="sub">${tour.tour_info}</p> <!-- 다른 필요한 정보들을 출력 --></li>
					</ul>
				</c:when>
				<c:otherwise>
					<!-- 해당하는 조건이 없을 경우 아무 작업도 하지 않음 -->
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<div class="tourlist sub">
		<p class="check">✓</p>
		<p class="sub_name">산책</p>
	</div>
	<div class="tourlist sub">
		<p class="check">✓</p>
		<p class="sub_name">체험</p>
	</div>
</div>
<div class="tour-category" id="meokbang" data-category="meokbang">
	<div class="tourlist hp">
		<h1>MeokBang</h1>
		<div class="line"></div>
	</div>
	<div class="tourlist sub">
		<p class="check">✓</p>
		<p class="sub_name">맛집</p>
	</div>
	<div class="tourlist sub">
		<p class="check">✓</p>
		<p class="sub_name">카페</p>
	</div>
</div>
<div class="tour-category" id="acc" data-category="acc">
	<div class="tourlist hp">
		<h1>숙박</h1>
		<div class="line"></div>
	</div>
	<div class="tourlist sub">
		<p class="check">✓</p>
		<p class="sub_name">캠핑</p>
	</div>
	<div class="tourlist sub">
		<p class="check">✓</p>
		<p class="sub_name">호텔</p>
	</div>
	<div class="tourlist sub">
		<p class="check">✓</p>
		<p class="sub_name">펜션</p>
	</div>
	<div class="tourlist sub">
		<p class="check">✓</p>
		<p class="sub_name">게스트하우스</p>
	</div>
</div>
