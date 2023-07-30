package com.damples.damdam.service;

import java.util.List;

import com.damples.damdam.models.TourDto;

public interface TourService {
	
	public TourDto selectById(String tourCode);
	
    public List<String> getMainCategoryCodes();

    public List<String> getSubCategoryCodesByMainCategory(String main_category);
    
    public List<TourDto> getToursBySubCategoryCode(String sub_category_code);
}
