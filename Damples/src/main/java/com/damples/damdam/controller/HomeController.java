package com.damples.damdam.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.damples.damdam.dao.TourDao;
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
    public String home(Model model) {
        List<TourDto> tourList = tourDao.selectAll();
        model.addAttribute("TOUR_LIST", tourList);
        return "home";
	}
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail(String tourCode, Model model) {
        TourDto tourDto = tourDao.selectById(tourCode);
        model.addAttribute("TOUR", tourDto);

        return "detail";
    }


}

