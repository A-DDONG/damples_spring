package com.damples.damdam.service.impl;

import java.util.List;

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

    @Override
    public List<String> getMainCategoryCodes() {
        return tourDao.selectDistinctMainCategoryCodes();
    }

    @Override
    public List<String> getSubCategoryCodesByMainCategory(String main_category) {
        return tourDao.selectDistinctSubCategoryCodesByMainCategory(main_category);

    }
    
	@Override
	public List<TourDto> getToursBySubCategoryCode(String sub_category_code) {
		return tourDao.getToursBySubCategoryCode(sub_category_code);
	}
}
