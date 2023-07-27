<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calendar</title>
     <style>
     /* 스타일은 간단한 예시로 작성하였습니다. */
    #calendarContainer {
        max-width: 800px;
        margin: 0 auto;
        text-align: center;
    }

    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        border: 1px solid black;
        padding: 5px;
        text-align: center;
    }

    th {
        background-color: #f2f2f2;
    }

    /* 고정된 셀 크기를 설정합니다. */
    td {
        height: 60px; /* 원하는 크기로 조정하세요. */
        width: 14.28%; /* (100 / 7)로 7일간의 일정한 크기로 설정합니다. */
        vertical-align: top;
    }

    .date {
        font-weight: bold;
    }

    .event {
        color: blue;
    }
    </style>
</head>
<body>
   <div id="calendarContainer">
    <h2>Calendar</h2>
    <button onclick="prevMonth()">Previous Month</button>
    <span id="currentMonthYear">${year}년 ${month}월</span>
    <button onclick="nextMonth()">Next Month</button>

    <br>
    <br>
    
    <table>
    	<tbody>
    	<tr>
    		<th>일</th>
    		<th>월</th>
    		<th>화</th>
    		<th>수</th>
    		<th>목</th>
    		<th>금</th>
    		<th>토</th>
    	</tr>	
    	</tbody>
    
    <tbody id="calendarBody"></tbody>
    </table>
</div>
    <script>
    var currentYear = ${year};
    var currentMonth = ${month};
    var allMonthEvents = ${allMonthEventsJson}; // JSON 문자열을 JavaScript 객체로 변환

        // 페이지 로딩 시 달력 표시
        displayCalendar(currentYear, currentMonth - 1, allMonthEvents);

        console.log("Current Year: ", currentYear);
        console.log("Current Month: ", currentMonth);
        console.log("All Month Events: ", allMonthEvents);

        function escapeSpecialCharacters(text) {
            return text.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(
                />/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g,
                "&#039;");
        }

        function formatDate(year, month, date) {
            var formattedMonth = (month + 1).toString().padStart(2, '0');
            var formattedDate = date.toString().padStart(2, '0');
            return year + '-' + formattedMonth + '-' + formattedDate;
        }

        function displayCalendar(year, month, allMonthEvents) {
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
                        cell.setAttribute("data-date", formatDate(year, month, date));

                        // 해당 날짜에 이벤트 정보가 있는 경우 표시합니다.
                        var formattedDate = formatDate(year, month, date);
                        var eventsForDate = allMonthEvents[month].filter(function(event) {
                            return event.date === formattedDate;
                        });
                        for (var k = 0; k < eventsForDate.length; k++) {
                            var eventInfo = eventsForDate[k].event_info;
                            var eventDiv = document.createElement("div");
                            eventDiv.textContent = eventInfo;
                            cell.appendChild(eventDiv);
                            console.log("Event Info:", eventInfo);
                        }
                        console.log(formattedDate);
                        console.log(eventsForDate);

                        if (year === currentYear && month === currentMonth && date === (new Date().getDate())) {
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
            displayCalendar(currentYear, currentMonth, allMonthEvents);
        }

        function nextMonth() {
            if (currentMonth === 11) {
                // 12월 다음으로 가면 연도를 증가하고 1월로 이동합니다.
                currentYear++;
                currentMonth = 0;
            } else {
                currentMonth++;
            }
            displayCalendar(currentYear, currentMonth, allMonthEvents);
        }
    </script>
</body>
</html>
