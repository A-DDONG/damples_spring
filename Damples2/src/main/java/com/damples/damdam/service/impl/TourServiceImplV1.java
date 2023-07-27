package com.damples.damdam.service.impl;

import org.springframework.stereotype.Service;

import com.damples.damdam.dao.TourDao;
import com.damples.damdam.models.TourDto;
import com.damples.damdam.service.TourService;

@Service
public class TourServiceImplV1 implements TourService {

	protected final TourDao tourDao;
	
	public TourServiceImplV1(TourDao tourDao) {
		this.tourDao = tourDao;
	}

	@Override
	public TourDto selectById(String tourCode) {
		return tourDao.selectById(tourCode);
	}

}
