package com.damples.damdam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.damples.damdam.dao.TourDao;

	
@Controller
public class HomeController {
	
	private final TourDao tourDao;
	
	public HomeController(TourDao tourDao) {
		this.tourDao = tourDao;
	}


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		
		
		return "home";
	}
	
}
