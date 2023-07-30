package com.damples.damdam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.damples.damdam.models.TourDto;

public interface TourDao {
	
	@Select("SELECT * FROM tbl_tour ORDER BY sub_category, tour_code")
	public List<TourDto> selectAll();
	
	public TourDto selectById(String tourCode);

}
