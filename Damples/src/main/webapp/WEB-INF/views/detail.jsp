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
</head>
<body>
	<header>
		<p>담양 HOT PLACE!</p>
		<h1>DAMPLES</h1>
		<%@ include file="/WEB-INF/views/tour/nav.jsp"%>
	</header>
	<div class="container">
		<div class="main">
			<h2>Tour Detail</h2>
			<c:if test="${not empty TOUR}">
				<h3>${TOUR.tour_code}</h3>
				<p>${TOUR.tour_name}</p>
				<p>${TOUR.tour_info}</p>
				<!-- 추가적인 정보를 보여주는 로직을 작성 -->
			</c:if>
		</div>
	</div>
</body>
</html>