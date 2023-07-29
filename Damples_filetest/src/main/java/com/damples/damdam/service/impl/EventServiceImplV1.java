package com.damples.damdam.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Service;

import com.damples.damdam.dao.EventDao;
import com.damples.damdam.models.EventDto;
import com.damples.damdam.service.EventService;

@Service
public class EventServiceImplV1 implements EventService {

	private final EventDao eventDao;

	public EventServiceImplV1(EventDao eventDao) {
		this.eventDao = eventDao;
	}

	@Override
	public List<EventDto> getEventsForMonth(int year, int month) {
		// 해당 월의 시작 날짜와 마지막 날짜를 구합니다.
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month, 1);
		String startDate = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		String endDate = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());

		// 해당 월의 이벤트 정보를 데이터베이스에서 가져옵니다.
		return eventDao.getEventsBetweenDates(startDate, endDate);

	}

	@Override
	public List<EventDto> getEventsBetweenDates(String startDate, String endDate) {
		return eventDao.getEventsBetweenDates(startDate, endDate);
	}
}
