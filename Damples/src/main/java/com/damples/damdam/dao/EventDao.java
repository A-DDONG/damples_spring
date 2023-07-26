package com.damples.damdam.dao;

import java.util.List;

import com.damples.damdam.models.EventDto;

public interface EventDao {
    List<EventDto> getAllEvents();

}
