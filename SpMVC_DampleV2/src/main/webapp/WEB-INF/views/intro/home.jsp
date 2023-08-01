<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>소개</h1>
	<h2>주요관광지</h2>
	<table class="intro">
		<tr>
			<th>카테고리</th>
			<th>제목</th>
			<th>내용</th>
		</tr>
		<c:choose>
			<c:when test="${not empty WRITES}">
				<c:forEach items="${WRITES}" var="WRITE">
					<tr>
						<td>${WRITE.b_ccode}</td>
						<td><a href="${rootPath}/intro/${WRITE.b_seq}/detail">${WRITE.b_title}</a></td>
						<td>${WRITE.b_content}</td>
						<td>
						<c:if test="${not empty WRITE.b_image}">
							<img src="${rootPath}/files/${WRITE.b_image}" width="100px" />
						</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>



	<div class="write button">
		<a href="${rootPath}/">홈으로</a> <a href="${rootPath}/intro/write">게시글작성</a>
	</div>
</body>
</html>