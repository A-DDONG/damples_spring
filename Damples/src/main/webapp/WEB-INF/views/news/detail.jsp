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
<link rel="stylesheet" href="${rootPath}/static/css/board_detail.css?${version}">
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
				<h1>담양소개</h1>
			</div>
			<div class="board_main">
				<div>
					<strong>카테고리 : </strong>
					<span>${WRITE.b_ccode}</span></div>
				<div>
					<strong>제목 : </strong>${WRITE.b_title}</div>
				<div>
					<strong>작성일자 : </strong>${WRITE.b_date}</div>
				<div>
					<strong>조회수 : </strong>${WRITE.b_viewcount}</div>

				<div>
					<strong>내용 : </strong>${WRITE.b_content}</div>
				<c:if test="${not empty FILES }">
					<div class="image_list">
						<c:forEach items="${FILES}" var="FILE">
							<div class="image">
								<img src="${rootPath}/files/${FILE.i_uploadName}" width="200px">
								<span data-seq="${FILE.i_seq}"
									data-filename="${FILE.i_originalName}"> </span>
							</div>
						</c:forEach>
					</div>
				</c:if>
			</div>
			<div class="button">
				<a href="${rootPath}/news">리스트로</a> <a
					href="${rootPath}/news/${WRITE.b_seq}/update">수정하기</a> <a
					href="${rootPath}/news/${WRITE.b_seq}/delete">삭제하기</a>
			</div>
		</div>
	</div>
</body>
</html>

