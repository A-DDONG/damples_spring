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
    <h1>Create Post</h1>
    <form action="${rootPath}/posts" method="post" enctype="multipart/form-data">
        <label>Nickname:
            <input type="text" name="nickname" placeholder="Enter your nickname">
        </label>
        <label>Password:
            <input type="password" name="password" placeholder="Enter your password">
        </label>
        <label>Category:
            <input type="text" name="category" placeholder="Enter the category">
        </label>
        <label>Title:
            <input type="text" name="title" placeholder="Enter the post title">
        </label>
        <label>Content:
            <textarea name="content" placeholder="Enter the post content"></textarea>
        </label>
        <label>File:
            <input type="file" name="file">
        </label>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
