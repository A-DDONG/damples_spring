<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	    <h1>Post Detail</h1>
    <div class="post">
        <h2><c:out value="${post.title}" /></h2>
        <p><c:out value="${post.content}" /></p>
        <p>${post.createdAt}</p>
        <img src="${post.filePath}" alt="image" />
    </div>
</body>
</html>
