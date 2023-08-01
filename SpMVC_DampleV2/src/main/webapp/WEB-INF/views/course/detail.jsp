<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div><strong>카테고리 : </strong>${WRITE.b_ccode}</div>
	
	<div><strong>제목 : </strong>${WRITE.b_title}</div>
	<div><strong>작성자 : </strong>${WRITE.b_nickname}</div>	
	<div><strong>작성일자 : </strong>${WRITE.b_title}</div>
	<div><strong>조회수 : </strong>${WRITE.b_viewcount}</div>
	
	<div><strong>내용 : </strong>${WRITE.b_content}</div>
	<c:if test="${not empty FILES }">
		<div class="image_list">
			<c:forEach items="${FILES}" var="FILE">
				<div class="image">
					<img src="${rootPath}/files/${FILE.i_uploadName}"  width="200px">
					<span data-seq="${FILE.i_seq}" 
						  data-filename="${FILE.i_originalName}">
					</span>
				</div>
			</c:forEach>
		</div>		
	</c:if>		
		
	<div>
		<a href="${rootPath}/course">리스트로</a>
		<a href="${rootPath}/course/${WRITE.b_seq}/update">수정하기</a>
		<a href="${rootPath}/course/${WRITE.b_seq}/delete">삭제하기</a>
	</div>




</body>
</html>

