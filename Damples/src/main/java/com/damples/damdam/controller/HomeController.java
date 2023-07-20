package com.damples.damdam.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.damples.damdam.dao.TourDao;
import com.damples.damdam.models.ImgDto;
import com.damples.damdam.models.TourDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

//	private final TourService tourService;
	private final TourDao tourDao;

	public HomeController(TourDao tourDao) {
		this.tourDao = tourDao;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(String tourCode, Model model) {
		

	    List<TourDto> tourList = tourDao.selectAll();
	    model.addAttribute("TOUR_LIST", tourList);
	    
	    // A0001 코드에 해당하는 데이터만 변수에 담기
	    List<TourDto> selectedTours = new ArrayList<>();
	    for (TourDto tourDto : tourList) {
	        if (tourDto.getTour_code().equals(tourCode)) {
	            selectedTours.add(tourDto);
	        }
	    }
	    model.addAttribute("SELECTED_TOURS", selectedTours);
	    return "home";
	}
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail(String tourCode, Model model) {
        TourDto tourDto = tourDao.selectById(tourCode);
        model.addAttribute("TOUR", tourDto);

        return "detail";
    }


}

