package com.damples.damdam.service;

import java.util.List;

import com.damples.damdam.models.EventDto;

public interface EventService {
	List<EventDto> getEventsForMonth(int year, int month);

	List<EventDto> getEventsBetweenDates(String startDate, String endDate);
}
