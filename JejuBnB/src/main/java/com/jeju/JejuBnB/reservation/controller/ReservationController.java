package com.jeju.JejuBnB.reservation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeju.JejuBnB.reservation.model.service.ReservationService;

@Controller
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService reservationService;
	
	//숙속 상세보기 및 예약 페이지 이동 메소드
	@RequestMapping("moveReserv.do")
	public String moveReserv() {
		return "reservation/reservationListView";
	}
	
	
}
