<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<c:forEach var="mainCategoryEntry" items="${mainCategoryMap}">
    <div class="tour-category active">
        <h1>${mainCategoryEntry.key}</h1>
        <div class="line"></div>

        <c:forEach var="subCategoryMapList" items="${mainCategoryEntry.value}">
            <c:forEach var="subCategoryMap" items="${subCategoryMapList}">
                <c:forEach var="subCategoryEntry" items="${subCategoryMap}">

                    <div class="tourlist hp">
                        <h1>${subCategoryEntry.key}</h1>
                        <div class="line"></div>
                    </div>

                    <c:forEach var="tour" items="${subCategoryEntry.value}">
                        <div class="tourlist sub">
                            <p class="check">✓</p>
                            <p class="sub_name">${tour.sub_category}</p>
                            <!-- 나머지 투어 정보 표시 -->
                        </div>
                    </c:forEach>

                </c:forEach>
            </c:forEach>
        </c:forEach>
    </div>
</c:forEach>






