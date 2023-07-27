<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 스타일은 간단한 예시로 작성하였습니다. */
table {
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 5px;
	text-align: center;
}
</style>
</head>
<body>
    <h2>Calendar</h2>
    <button onclick="prevMonth()">Previous Month</button>
    <span id="currentMonthYear">${currentYear}년 ${currentMonth + 1}월</span>
    <button onclick="nextMonth()">Next Month</button>
    <br><br>
    <table>
        <tr>
            <th>Sun</th>
            <th>Mon</th>
            <th>Tue</th>
            <th>Wed</th>
            <th>Thu</th>
            <th>Fri</th>
            <th>Sat</th>
        </tr>
        <tbody id="calendarBody">
            <c:forEach var="dateInfo" items="${dates}">
                <tr>
                    <c:forEach var="day" items="${dateInfo}">
                        <td>
                            <c:if test="${day != null}">
                                <!-- 날짜를 표시합니다. -->
                                ${day.day}
                                <br>
                                <!-- 해당 날짜에 이벤트 정보가 있는 경우 표시합니다. -->
                                <c:forEach var="event" items="${day.events}">
                                    <c:if test="${event.date == currentYear + '-' + (currentMonth + 1) + '-' + day.day}">
                                        ${event.event_info}
                                        <br>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script>
        // JavaScript 코드
        var currentDate = new Date();
        var currentYear = currentDate.getFullYear();
        var currentMonth = currentDate.getMonth();

        // 페이지 로딩 시 현재 월의 달력을 표시합니다.
        displayCalendar(currentYear, currentMonth);

        function displayCalendar(year, month) {
            var calendarBody = document.getElementById("calendarBody");
            var currentMonthYear = document.getElementById("currentMonthYear");

            // 이전 달과 다음 달로 이동할 때 사용하기 위해 현재 연도와 월을 저장합니다.
            currentYear = year;
            currentMonth = month;

            // 월의 첫 날을 구합니다.
            var firstDay = new Date(year, month, 1);
            // 월의 마지막 날을 구합니다.
            var lastDay = new Date(year, month + 1, 0);
            // 월의 첫 날의 요일을 구합니다. (0: 일요일, 1: 월요일, ..., 6: 토요일)
            var firstDayOfWeek = firstDay.getDay();

            // 달력을 초기화합니다.
            calendarBody.innerHTML = "";
            currentMonthYear.textContent = year + "년 " + (month + 1) + "월";

            var date = 1;

            // 달력에 날짜를 채웁니다.
            for (var i = 0; i < 6; i++) {
                var row = document.createElement("tr");
                for (var j = 0; j < 7; j++) {
                    if (i === 0 && j < firstDayOfWeek) {
                        // 첫 주에서 월의 시작 요일까지 빈 칸으로 채웁니다.
                        var cell = document.createElement("td");
                        row.appendChild(cell);
                    } else if (date > lastDay.getDate()) {
                        // 월의 마지막 날짜를 넘어가면 빈 칸으로 채웁니다.
                        var cell = document.createElement("td");
                        row.appendChild(cell);
                    } else {
                        // 날짜를 표시합니다.
                        var cell = document.createElement("td");
                        cell.textContent = date;
                        // 날짜를 "yyyy-MM-dd" 형식으로 변환하여 저장합니다.
                        cell.setAttribute("data-date", year + '-' + (month + 1) + '-' + date);
                        if (year === currentDate.getFullYear() && month === currentDate.getMonth() && date === currentDate.getDate()) {
                            // 오늘 날짜는 강조 표시합니다.
                            cell.style.fontWeight = "bold";
                        }
                        row.appendChild(cell);
                        date++;
                    }
                }
                calendarBody.appendChild(row);
            }
        }

        function prevMonth() {
            if (currentMonth === 0) {
                // 1월 이전으로 가면 연도를 감소하고 12월로 이동합니다.
                currentYear--;
                currentMonth = 11;
            } else {
                currentMonth--;
            }
            displayCalendar(currentYear, currentMonth);
        }

        function nextMonth() {
            if (currentMonth === 11) {
                // 12월 다음으로 가면 연도를 증가하고 1월로 이동합니다.
                currentYear++;
                currentMonth = 0;
            } else {
                currentMonth++;
            }
            displayCalendar(currentYear, currentMonth);
        }
    </script>
</body>
</html>
