<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<div class="main map active" id="hotplace-map">
	<img alt="핫플지도" src="${rootPath}/static/images/핫플지도.png">
</div>
<div class="main map" id="meokbang-map">
	<img alt="먹방지도" src="${rootPath}/static/images/먹방지도.png">
</div>
<div class="main map" id="acc-map">
	<img alt="숙박지도" src="${rootPath}/static/images/숙박지도.png">
</div>
