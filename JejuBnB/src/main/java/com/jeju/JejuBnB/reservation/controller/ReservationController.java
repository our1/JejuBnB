package com.jeju.JejuBnB.reservation.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.reservation.model.service.ReservationService;
import com.jeju.JejuBnB.reservation.model.vo.Reservation;
import com.jeju.JejuBnB.room.model.service.RoomService;

@Controller
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private RoomService roomService;
	
	
	//값 담아서 숙소 예약페이지 이동
	@RequestMapping(value="reserv.do", method=RequestMethod.POST)
	public ModelAndView insertReserv(@RequestParam(value="room_no") int room_no, Reservation reserv, ModelAndView mv) throws IllegalArgumentException {
		
		logger.info("reserv: " + reserv.toString());
		reservationService.insertReserv(reserv);
		mv.setViewName("reservation/reservationDetailView");
		mv.addObject("reserv", reserv);
		return mv;
	}
	
	
}
