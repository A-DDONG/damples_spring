<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 ${STATE == 'UPDATE' ? '수정' : '작성' }</h1>

	<f:form modelAttribute="WRITE" method="POST"
		enctype="multipart/form-data">
		<label>게시판선택</label>
		<select name="b_ccode">
			<option value="리뷰" selected>리뷰</option>
			<option value="소식">소식</option>
			<option value="소개">소개</option>
			<option value="추천">추천</option>
		</select>

		<div>
			<label>제목</label>
			<f:input path="b_title" />
		</div>
		<div>
			<label>내용</label>
			<f:input path="b_content" />
		</div>
		<div>
			<label>이미지</label> <input name="b_images" type="file"
				multiple="multiple" accept="image/*" />
		</div>

		<div>
			<label>작성자</label>
			<f:input path="b_nickname" />
		</div>
		<div>
			<label>비밀번호</label>
			<f:input path="b_password" />
		</div>
		<c:if test="${MESSAGE == 'NO' }">
			<h3>* 모든내용을 작성해주세요.</h3>
		</c:if>
		<c:if test="${MESSAGE == 'NONE' }">
			<h3>* 비밀번호를 입력해주세요.</h3>
		</c:if>
		<c:if test="${MESSAGE == 'PASS_WORD' }">
			<h3>* 비밀번호가 틀렸습니다.</h3>
		</c:if>
		<div>
			<button type="button" onclick="location.href='${rootPath}/'">목록으로</button>
			<button>저장하기</button>
			<button type="reset">새로작성</button>
		</div>
	</f:form>
</body>
</html>