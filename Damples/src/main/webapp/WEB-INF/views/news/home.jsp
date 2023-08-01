<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${rootPath}/static/css/main.css?${version}">
<link rel="stylesheet" href="${rootPath}/static/css/nav.css?${version}">
<link rel="stylesheet" href="${rootPath}/static/css/board.css?${version}">
<script>
   var rootPath = "${rootPath}"
</script>
<script src="${rootPath}/static/js/main_nav.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/views/tour/nav.jsp"%>
	</header>
	<div class="container">
		<div class="wrapper">
			<div class="title">
				<h1>담양소식</h1>
			</div>
			<table class="news">
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>내용</th>
				</tr>
				<c:choose>
					<c:when test="${not empty WRITES}">
						<c:forEach items="${WRITES}" var="WRITE">
							<tr>
								<td>${WRITE.b_seq}</td>
								<td><a href="${rootPath}/news/${WRITE.b_seq}/detail">${WRITE.b_title}</a></td>
								<td>${WRITE.b_date}</td>
								<td>${WRITE.b_viewcount}</td>
								<td>${WRITE.b_content}</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>

			<div class="write button">
				<a href="${rootPath}/">홈으로</a> <a href="${rootPath}/news/write">게시글작성</a>
			</div>

		</div>
	</div>

</body>
</html>