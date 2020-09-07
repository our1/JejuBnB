package com.jeju.JejuBnB.tour.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeju.JejuBnB.tour.model.service.TourService;

@Controller
public class TourController {
	private static final Logger logger = LoggerFactory.getLogger(TourController.class);
	
	@Autowired
	private TourService tourService;
	
	@RequestMapping("tlist.do")
	public String Tourlist() {
		return "tour/tourListVeiw";
	}

}
