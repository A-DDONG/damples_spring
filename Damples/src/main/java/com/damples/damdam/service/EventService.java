package com.damples.damdam.service;

import java.util.List;

import com.damples.damdam.models.EventDto;

public interface EventService {
	public List<EventDto> getEventsForMonth(int year, int month);

	public List<EventDto> getEventsBetweenDates(String startDate, String endDate);
}
