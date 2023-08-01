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
				<h1>코스추천</h1>
			</div>
			<table class="board">
				<tr>
					<th>제목</th>
					<th>내용</th>
					<th>조회수</th>
					<th>이미지</th>
				</tr>
				<c:choose>
					<c:when test="${not empty WRITES}">
						<c:forEach items="${WRITES}" var="WRITE">
							<tr>
								<td><a href="${rootPath}/course/${WRITE.b_seq}/detail">${WRITE.b_title}</a></td>
								<td>${WRITE.b_content}</td>
								<td>${WRITE.b_viewcount}</td>
								<td><c:if test="${not empty WRITE.b_image}">
										<img src="${rootPath}/files/${WRITE.b_image}" width="200px" />
									</c:if></td>
							</tr>

						</c:forEach>
					</c:when>
				</c:choose>
			</table>
			<div class="write button">
				<a href="${rootPath}/">홈으로</a> <a href="${rootPath}/course/write">게시글작성</a>
			</div>


		</div>
	</div>


</body>
</html>