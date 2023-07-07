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
<link rel="stylesheet" href="${rootPath}/static/css/mapnav.css?${version}">
<link rel="stylesheet" href="${rootPath}/static/css/map.css?${version}">
<link rel="stylesheet" href="${rootPath}/static/css/event.css?${version}">
</head>
	
<body>
	<header>
		<p>담양 HOT PLACE!</p>
		<h1>DAMPLES</h1>
		<%@ include file="/WEB-INF/views/tour/nav.jsp" %>
	</header>
	<div class="container">
		<%@ include file="/WEB-INF/views/tour/mapnav.jsp" %>
		<%@ include file="/WEB-INF/views/tour/map.jsp" %>
		<%@ include file="/WEB-INF/views/tour/event.jsp" %>
	</div>	
</body>

</html>