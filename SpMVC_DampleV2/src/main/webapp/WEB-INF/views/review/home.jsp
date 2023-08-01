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
	<h1>리뷰</h1>
	<table class="review">
		<tr>
			<th>No.</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>닉네임</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${not empty WRITES}">
				<c:forEach items="${WRITES}" var="WRITE">
					<tr>
						<td>${WRITE.b_seq}</td>
						<td>${WRITE.b_ccode}</td>
						<td><a href="${rootPath}/review/${WRITE.b_seq}/detail">${WRITE.b_title}</a></td>
						<td>${WRITE.b_nickname}</td>
						<td>${WRITE.b_date}</td>
						<td>${WRITE.b_viewcount}</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<div class="list pagination">
		<ul>
					
			<c:if test="${PAGINATION.firstPageNum == PAGINATION.pageNum }">
				<li>처음</li>
				<li>&lt;</li>
			</c:if>		
					
			<c:if test="${PAGINATION.firstPageNum != PAGINATION.pageNum }">
				<li><a href="${rootPath}/review?page=1&search=${SEARCH}">처음</a></li>
				<li><a href="${rootPath}/review?page=${PAGINATION.pageNum -1}&search=${SEARCH}">&lt;</a></li>
			</c:if>
			
			<c:forEach begin="${PAGINATION.firstPageNum}"
				end="${PAGINATION.lastPageNum}" var="PAGE">
				<li class=${PAGINATION.pageNum == PAGE ? 'active' : ''}><a
					href="${rootPath}/review?page=${PAGE}&search=${SEARCH}">${PAGE}</a></li>
			</c:forEach>
			
			<c:if test="${PAGINATION.lastPageNum != PAGINATION.pageNum}">
				<li><a href="${rootPath}/review?page=${PAGINATION.pageNum +1}&search=${SEARCH}">&gt;</a></li>
				<li><a href="${rootPath}/review?page=${PAGINATION.finalPageNum}&search=${SEARCH}">마지막</a></li>
			</c:if>
			<c:if test="${PAGINATION.lastPageNum == PAGINATION.pageNum}">
				<li>&gt;</li>
				<li>마지막</li>
			</c:if>
		</ul>
		
	</div>



	<div class="write button">
		<a href="${rootPath}/">홈으로</a>
		<a href="${rootPath}/review/write">게시글작성</a>
	</div>
</body>
</html>