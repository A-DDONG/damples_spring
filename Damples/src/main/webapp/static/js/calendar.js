// var currentYear = `${currentYear}`;
// var currentMonth = `${currentMonth}`;

// var allMonthEvents = `${allMonthEventsJson}`; // JSON 문자열을 JavaScript 객체로 변환

// 페이지 로딩 시 달력 표시
displayCalendar(currentYear, currentMonth - 1, allMonthEvents);

// console.log("Current Year: ", currentYear);
// console.log("Current Month: ", currentMonth);
// console.log("All Month Events: ", allMonthEvents);

function escapeSpecialCharacters(text) {
  return text
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;");
}

function formatDate(year, month, date) {
  var formattedMonth = (month + 1).toString().padStart(2, "0");
  var formattedDate = date.toString().padStart(2, "0");
  return year + "-" + formattedMonth + "-" + formattedDate;
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
    var hasDates = false; // 해당 주에 날짜가 있는지 여부를 확인하는 변수
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
        // cell.textContent = date;
        // 날짜를 "yyyy-MM-dd" 형식으로 변환하여 저장합니다.
        cell.setAttribute("data-date", formatDate(year, month, date));

        // 날짜를 표시하는 div를 생성하고 클래스를 추가합니다.
        var dateDiv = document.createElement("div");
        dateDiv.textContent = date;
        dateDiv.classList.add("date");
        cell.appendChild(dateDiv);

        // 해당 날짜에 이벤트 정보가 있는 경우 표시합니다.
        var formattedDate = formatDate(year, month, date);
        // console.table(allMonthEvents);
        var eventsForDate = allMonthEvents[month].filter(function (event) {
          // console.log(event, event.date, formattedDate);
          return event.date === formattedDate;
        });
        // 이벤트를 담는 하나의 div 생성
        var eventDiv = document.createElement("div");
        eventDiv.classList.add("cell-content");
        for (var k = 0; k < eventsForDate.length; k++) {
          var eventInfo = eventsForDate[k].event_info;
          var eventInfoDiv = document.createElement("div");
          var toolTipDiv = document.createElement("div");
          toolTipDiv.className = "tooltip";
          eventInfoDiv.textContent = eventInfo;
          toolTipDiv.textContent = eventInfo;
          eventDiv.appendChild(eventInfoDiv);
          eventDiv.appendChild(toolTipDiv);
          // console.log("Event Info:", eventInfo);
        }
        // 셀에 하나의 div로 이벤트 추가
        cell.appendChild(eventDiv);

        if (
          year === currentYear &&
          month === new Date().getMonth() &&
          date === new Date().getDate()
        ) {
          // 오늘 날짜는 강조 표시합니다.
          cell.classList.add("today");
        }

        row.appendChild(cell);
        date++;
        hasDates = true; // 해당 주에 날짜가 있음을 표시
      }
    }
    if (hasDates) {
      calendarBody.appendChild(row);
    }
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
