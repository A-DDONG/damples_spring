package com.damples.damdam.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.damples.damdam.models.EventDto;
import com.damples.damdam.service.EventService;

@Controller
public class EventController {
	
    private final EventService eventService;

    public EventController(EventService eventService) {
        this.eventService = eventService;
    }

    @RequestMapping(value="/calendar", method=RequestMethod.GET)
    public String showCalendar(Model model) {
        // 현재 날짜 정보를 가져옵니다.
        Date currentDate = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);

        // 현재 달력의 년도와 월을 구합니다.
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH) + 1;

        // 현재 달의 첫 번째 날과 마지막 날을 구합니다.
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        Date firstDayOfMonth = calendar.getTime();
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        Date lastDayOfMonth = calendar.getTime();

        // 해당 달의 이벤트 정보를 서비스를 통해 가져옵니다.
        List<EventDto> events = eventService.getAllEvents();

        // 모델에 데이터를 담아 JSP 페이지에 전달합니다.
        model.addAttribute("year", year);
        model.addAttribute("month", month);
        model.addAttribute("events", events);
        model.addAttribute("firstDayOfMonth", firstDayOfMonth);
        model.addAttribute("calendar", calendar); 

        // 여기서 뷰 파일의 이름을 반환합니다.
        return "calendar";
    }
}
