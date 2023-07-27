package com.damples.damdam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.damples.damdam.models.EventDto;

public interface EventDao {
	
    @Select("SELECT * FROM events WHERE date >= #{startDate} AND date <= #{endDate}")
    List<EventDto> getEventsBetweenDates(@Param("startDate") String startDate, @Param("endDate") String endDate);

}
