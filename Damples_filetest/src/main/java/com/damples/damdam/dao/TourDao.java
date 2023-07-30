package com.damples.damdam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.damples.damdam.models.TourDto;

public interface TourDao {

	@Select(" SELECT * FROM tbl_tour ")
	public List<TourDto> selectAll();
	
	public TourDto selectById(String tourCode);
	
	@Select(" SELECT DISTINCT sub_category FROM tbl_tour ")
	public List<String> selectDistinctSubCategories();
	
	@Select("SELECT DISTINCT main_category FROM tbl_tour")
	public List<String> selectDistinctMainCategories();
	
	
	@Select(" SELECT * FROM tbl_tour WHERE main_category = #{main_category} ")
	public List<TourDto> getToursByMainCategory(String main_category);
}
