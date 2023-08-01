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
	<h1>비밀번호 확인</h1>
	<c:if test="${MESSAGE == 'NONE' }">
		<h3>* 비밀번호를 입력해주세요.</h3>
	</c:if>
	<c:if test="${MESSAGE == 'PASS_WORD' }">
		<h3>* 비밀번호가 틀렸습니다.</h3>
	</c:if>
	<form class="main" method="POST">
		<div>
			<label>비밀번호</label> <input name="b_password" />
			<button>확인</button>
		</div>
	</form>
</body>
</html>