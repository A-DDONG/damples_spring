<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Damples</title>
</head>
<body>
	<header class="main">
		<h1>Damples</h1>
		<p>게시판 서비스</p>
	</header>
	
	<nav class="main">
		<ul>
			<li class="home"><a href="${rootPath}/">Home</a></li>
			<li class="intro"><a href="${rootPath}/intro">소개</a></li>
			<li class="news"><a href="${rootPath}/news">소식</a></li>
			<li class="course"><a href="${rootPath}/course">코스추천</a></li>
			<li class="review"><a href="${rootPath}/review">리뷰</a></li>
		</ul>
	</nav>
	
	<section class="main"></section>
	<footer>
		<address>CopyRight &copy; All Right Reserved</address>
	</footer>
	

</body>
</html>