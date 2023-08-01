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
				<h1>비밀번호 확인</h1>
			</div>
			<c:if test="${MESSAGE == 'NONE' }">
				<h3>* 비밀번호를 입력해주세요.</h3>
			</c:if>
			<c:if test="${MESSAGE == 'PASS_WORD' }">
				<h3>* 비밀번호가 틀렸습니다.</h3>
			</c:if>
			<form class="main" method="POST">
				<div>
					<label>비밀번호</label> <input name="b_password" placeholder="비밀먼호를 입력하세요" id="pw"/>
					<button>확인</button>
				</div>
			</form>
		</div>


	</div>


</body>
</html>