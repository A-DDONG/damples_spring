package com.damples.damdam.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.damples.damdam.models.EventDto;
import com.damples.damdam.service.EventService;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CalendarController {
	

    private final EventService eventService;

    public CalendarController(EventService eventService) {
        this.eventService = eventService;
    }

    @RequestMapping(value="/calendar", method=RequestMethod.GET)
    public String showCalendar(@RequestParam(value = "year", required = false) Integer year,
                               @RequestParam(value = "month", required = false) Integer month,
                               Model model) {

        // 현재 날짜 정보를 가져옵니다.
        Calendar currentCalendar = Calendar.getInstance();
        int currentYear = currentCalendar.get(Calendar.YEAR);
        int currentMonth = currentCalendar.get(Calendar.MONTH);
        

        // 요청으로 전달받은 연도와 월이 없는 경우, 현재 날짜를 사용합니다.
        if (year == null || month == null) {
            year = currentYear;
            month = currentMonth;
        }

        // 월별 이벤트 정보를 저장할 리스트를 생성합니다.
        List<List<EventDto>> allMonthEvents = new ArrayList<>();

        // 1월부터 12월까지의 이벤트 정보를 가져와서 리스트에 추가합니다.
        for (int m = 0; m < 12; m++) {
            // 해당 월의 시작 날짜와 마지막 날짜를 구합니다.
            Calendar calendar = Calendar.getInstance();
            calendar.set(year, m, 1);
            String startDate = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
            calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
            String endDate = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());

            // 해당 월의 이벤트 정보를 데이터베이스에서 가져옵니다.
            List<EventDto> events = eventService.getEventsBetweenDates(startDate, endDate);

            // 월별 이벤트 리스트에 추가합니다.
            allMonthEvents.add(events);
        }

        // 월별 이벤트 리스트를 JSON 형태로 변환하여 JSP로 전달합니다.
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            String allMonthEventsJson = objectMapper.writeValueAsString(allMonthEvents);
            model.addAttribute("allMonthEventsJson", allMonthEventsJson);
        } catch (Exception e) {
            log.error("Error converting events to JSON: {}", e.getMessage());
        }

        // 뷰에 필요한 데이터를 전달합니다.
        model.addAttribute("year", year);
        model.addAttribute("month", month + 1);

        return "calendar"; // 뷰의 이름 (calendar.jsp와 연결됩니다.)
    }
}

