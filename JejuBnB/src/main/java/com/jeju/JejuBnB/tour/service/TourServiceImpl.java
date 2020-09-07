package com.jeju.JejuBnB.tour.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.tour.model.dao.TourDao;

@Service("TourService")
public class TourServiceImpl implements TourService{
	
	@Autowired
	private TourDao tourDao;

}
