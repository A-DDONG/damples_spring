<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="tour-category active" id="hotplace" data-category="hotplace">
	<div class="tourlist hp">
		<h1>Hot Place</h1>
		<div class="line"></div>
	</div>
	<c:set var="prevSubCategory" value="" />
	<c:forEach var="tour" items="${HOTPLACE_LIST}">
		<c:if test="${!prevSubCategory.equals(tour.sub_category)}">
			<div class="tourlist sub">
				<p class="check">✓</p>
				<p class="sub_name" >${tour.sub_category}</p>
			</div>
			<div class="tourlist tourinfo swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="tour2" items="${HOTPLACE_LIST}">
						<c:if test="${tour2.sub_category == tour.sub_category}">
							<div class="tour-box swiper-slide">
								<ul>
									<li
										onclick="location.href='${rootPath}/detail?tourCode=${tour2.tour_code}'"><img
										src="${rootPath}/static/images/테스트.png" alt="Image 1">
										<p class="title">${tour2.tour_name}</p>
										<p class="sub">${tour2.tour_info}</p> <!-- Show other necessary information --></li>
								</ul>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</c:if>
		<c:set var="prevSubCategory" value="${tour.sub_category}" />
	</c:forEach>
</div>
<div class="tour-category" id="meokbang" data-category="meokbang">
	<div class="tourlist hp">
		<h1>먹방</h1>
		<div class="line"></div>
	</div>
	<c:set var="prevSubCategory" value="" />
	<c:forEach var="tour" items="${MEOKBANG_LIST}">
		<c:if test="${!prevSubCategory.equals(tour.sub_category)}">
			<div class="tourlist sub">
				<p class="check">✓</p>
				<p class="sub_name">${tour.sub_category}</p>
			</div>
			<div class="tourlist tourinfo swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="tour2" items="${MEOKBANG_LIST}">
						<c:if test="${tour2.sub_category == tour.sub_category}">
							<div class="tour-box swiper-slide">
								<ul>
									<li
										onclick="location.href='${rootPath}/detail?tourCode=${tour2.tour_code}'">
										<img src="${rootPath}/static/images/테스트.png" alt="Image 1">
										<p class="title">${tour2.tour_name}</p>
										<p class="sub">${tour2.tour_info}</p> <!-- Show other necessary information -->

									</li>
								</ul>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</c:if>
		<c:set var="prevSubCategory" value="${tour.sub_category}" />
	</c:forEach>
</div>
<div class="tour-category" id="acc" data-category="acc">
	<div class="tourlist hp">
		<h1>acc</h1>
		<div class="line"></div>
	</div>
	<c:set var="prevSubCategory" value="" />
	<c:forEach var="tour" items="${ACC_LIST}">
		<c:if test="${!prevSubCategory.equals(tour.sub_category)}">
			<div class="tourlist sub">
				<p class="check">✓</p>
				<p class="sub_name">${tour.sub_category}</p>
			</div>
			<div class="tourlist tourinfo swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="tour2" items="${ACC_LIST}">
						<c:if test="${tour2.sub_category == tour.sub_category}">
							<div class="tour-box swiper-slide">
								<ul>
									<li
										onclick="location.href='${rootPath}/detail?tourCode=${tour2.tour_code}'">
										<img src="${rootPath}/static/images/테스트.png" alt="Image 1">
										<p class="title">${tour2.tour_name}</p>
										<p class="sub">${tour2.tour_info}</p> <!-- Show other necessary information -->
									</li>
								</ul>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</c:if>
		<c:set var="prevSubCategory" value="${tour.sub_category}" />
	</c:forEach>
</div>
