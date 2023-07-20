<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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

		<a href="<c:url value='/detail'/>?tourCode=${tour.tour_code}">${tour.tour_code}</a>
		<p>${tour.tour_name}</p>
		<p>${tour.tour_info}</p>

	</c:forEach>

</div>
<div class="tourlist sub">
	<p class="check">✓</p>
	<p class="sub_name">자연생활</p>
</div>
<div class="tourlist sub">
	<p class="check">✓</p>
	<p class="sub_name">산책</p>
</div>
<div class="tourlist sub">
	<p class="check">✓</p>
	<p class="sub_name">체험</p>
</div>