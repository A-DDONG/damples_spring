package com.damples.damdam.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.damples.damdam.dao.TourDao;
import com.damples.damdam.models.TourDto;
import com.damples.damdam.service.TourService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

	private final TourService tourService;
	private final TourDao tourDao;



	public HomeController(TourService tourService, TourDao tourDao) {
		this.tourService = tourService;
		this.tourDao = tourDao;
	}


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
	    // main_category 목록을 가져옵니다.
	    List<String> mainCategories = tourService.getMainCategoryCodes();

	    // main_category 별로 sub_category 목록과 해당하는 tour 목록을 가져옵니다.
	    Map<String, List<Map<String, List<TourDto>>>> mainCategoryMap = new HashMap<>();
	    for (String mainCategory : mainCategories) {
	        List<String> subCategories = tourService.getSubCategoryCodesByMainCategory(mainCategory);
	        List<Map<String, List<TourDto>>> subCategoryTourListMapList = new ArrayList<>();
	        for (String subCategory : subCategories) {
	            Map<String, List<TourDto>> subCategoryTourListMap = new HashMap<>();
	            List<TourDto> tourList = tourDao.getToursBySubCategoryCode(subCategory);
	            subCategoryTourListMap.put(subCategory, tourList);
	            subCategoryTourListMapList.add(subCategoryTourListMap);
	        }
	        mainCategoryMap.put(mainCategory, subCategoryTourListMapList);
	    }

	    model.addAttribute("mainCategoryMap", mainCategoryMap);
	    return "home";
	}


    @RequestMapping(value="/detail",method=RequestMethod.GET)
    public String detail(String tourCode, Model model) {
        TourDto tourDto = tourDao.selectById(tourCode);
        model.addAttribute("TOUR", tourDto);
        return "detail";
    }

}

