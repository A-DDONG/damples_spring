<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<c:set value="20230705-017" var="version" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>담양 여행의 시작 DAMPLES</title>
<link rel="stylesheet" href="${rootPath}/static/css/main.css?${version}">
<link rel="stylesheet" href="${rootPath}/static/css/nav.css?${version}">
</head>
	
<body>
	<header>
		<p>담양 HOT PLACE!</p>
		<h1>DAMPLES</h1>
	</header>
	<%@ include file="/WEB-INF/views/tour/nav.jsp" %>

</body>

</html>