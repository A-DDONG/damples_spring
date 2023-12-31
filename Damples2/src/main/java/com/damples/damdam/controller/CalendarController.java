package com.damples.damdam.controller;

import java.text.SimpleDateFormat;
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
		String currentDay = new SimpleDateFormat("yyyy-MM-dd").format(currentCalendar.getTime());

		// 요청으로 전달받은 연도와 월이 없는 경우, 현재 날짜를 사용합니다.
		if (year == null || month == null) {
			year = currentYear;
			month = currentMonth;
		}

		// 해당 월의 이벤트 정보를 가져옵니다.
		List<EventDto> events = eventService.getEventsForMonth(year, month);

		// 해당 월의 시작 날짜와 마지막 날짜를 구합니다.
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month, 1);
		String startDate = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		String endDate = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());

		log.debug("Year: {}", year);
		log.debug("Month: {}", month + 1);
		log.debug("Day: {}", currentDay);
		log.debug("Start Date: {}", startDate);
		log.debug("End Date: {}", endDate);
		log.debug("Events: {}", events);

		// 뷰에 필요한 데이터를 전달합니다.
		model.addAttribute("year", year);
		model.addAttribute("month", month + 1);
		model.addAttribute("day", currentDay);

		// events 객체를 JSON 문자열로 변환하여 JSP에 전달합니다.
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String eventsJson = objectMapper.writeValueAsString(events);
			model.addAttribute("events", eventsJson);
		} catch (Exception e) {
			log.error("Error converting events to JSON: {}", e.getMessage());
		}

		return "calendar"; // 뷰의 이름 (calendar.jsp와 연결됩니다.)
	}
}
