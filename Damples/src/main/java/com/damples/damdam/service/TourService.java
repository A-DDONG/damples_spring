package com.damples.damdam.service;

import com.damples.damdam.models.TourDto;

public interface TourService {
	
	public TourDto selectById(String tourCode);
	
}
