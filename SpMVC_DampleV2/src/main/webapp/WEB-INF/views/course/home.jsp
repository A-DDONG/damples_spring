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
	<h1>코스추천</h1>
	<table class="board">
		<tr>
			<th>제목</th>
			<th>내용</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${not empty WRITES}">
				<c:forEach items="${WRITES}" var="WRITE">
					<tr>
						<td><a href="${rootPath}/course/${WRITE.b_seq}/detail">${WRITE.b_title}</a></td>
						<td>${WRITE.b_content}</td>
						<td>${WRITE.b_viewcount}</td>
						<td>
							<c:if test="${not empty WRITE.b_image}">
								<img src="${rootPath}/files/${WRITE.b_image}" width="200px" />
							</c:if>
						</td>
					</tr>

				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<div class="write button">
		<a href="${rootPath}/">홈으로</a> <a href="${rootPath}/course/write">게시글작성</a>
	</div>
</body>
</html>