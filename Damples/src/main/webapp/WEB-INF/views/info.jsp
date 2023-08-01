<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담양-info</title>
<link rel="stylesheet" href="${rootPath}/static/css/main.css?${version}">
<link rel="stylesheet" href="${rootPath}/static/css/nav.css?${version}">
<link rel="stylesheet" href="${rootPath}/static/css/info.css?${version}">
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

         <div class="info-image">
            <a href="https://www.damyang.go.kr/menu/goToContentsPage?contentsSid=173&domainId=DOM_0000001&menuCd=DOM_000000190006001002" target="_blank"> <img
               src="${rootPath}/static/images/담양군심볼.png">
            </a>
         </div>

         <div class="info-click">
            <p>심볼 클릭</p>
         </div>

      </div>
   </div>
</body>
</html>