package com.damples.damdam.service.impl;

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
	public List<EventDto> getAllEvents() {
		 return eventDao.getAllEvents();
	}
}
