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
	<h1>Posts</h1>
    <c:forEach var="post" items="${posts}">
        <div class="post">
            <h2><c:out value="${post.title}" /></h2>
            <p><c:out value="${post.content}" /></p>
            <p><a href="${rootPath}/posts/${post.seq}">Read More</a></p>
        </div>
    </c:forEach>
       <a href="${rootPath}/posts/create">게시글 작성</a>
</body>
</body>
</html>
