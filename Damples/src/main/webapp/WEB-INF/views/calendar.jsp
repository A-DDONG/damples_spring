<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>캘린더</title>
    <style>
        /* 달력 스타일을 적용합니다. */
        .calendar {
            width: 300px;
            margin: 0 auto;
            border-collapse: collapse;
        }

        .calendar th, .calendar td {
            border: 1px solid black;
            padding: 5px;
            text-align: center;
        }

        .today {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Simple Calendar</h1>
    <table class="calendar">
        <tr>
            <th>Sun</th>
            <th>Mon</th>
            <th>Tue</th>
            <th>Wed</th>
            <th>Thu</th>
            <th>Fri</th>
            <th>Sat</th>
        </tr>
        <!-- 달력 내용을 출력하는 부분을 여기에 작성합니다. -->
        <!-- 날짜를 기준으로 이벤트를 달력에 출력합니다. -->
        <c:forEach var="week" begin="1" end="6">
            <tr>
                <c:forEach var="dayOfWeek" begin="1" end="7">
                    <c:set var="currentDay" value="${(week - 1) * 7 + dayOfWeek - calendar.get(Calendar.DAY_OF_WEEK) + 1}"/>
                    <c:set var="currentDate" value="${calendar.time}"/>
                    <c:if test="${currentDay >= 1 && currentDay <= calendar.getActualMaximum(Calendar.DAY_OF_MONTH)}">
                        <c:forEach var="event" items="${events}">
                            <c:if test="${event.date.time == currentDate.time}">
                                <td class="today">
                                    ${currentDay}
                                    <br/>
                                    ${event.eventInfo}
                                </td>
                                <c:set var="currentDate" value="" scope="page"/>
                            </c:if>
                        </c:forEach>
                        <c:if test="${currentDate ne ''}">
                            <td>${currentDay}</td>
                        </c:if>
                    </c:if>
                    <c:if test="${currentDay < 1 || currentDay > calendar.getActualMaximum(Calendar.DAY_OF_MONTH)}">
                        <td></td>
                    </c:if>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
