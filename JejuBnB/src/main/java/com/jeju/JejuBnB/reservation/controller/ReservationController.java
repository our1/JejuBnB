package com.jeju.JejuBnB.reservation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeju.JejuBnB.reservation.model.service.ReservationService;
import com.jeju.JejuBnB.room.model.vo.Room;

@Controller
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService reservationService;
	
	//숙속 상세보기 및 예약 페이지 리스트
	@RequestMapping(value="rlist.do", method=RequestMethod.GET)
	public String requestList(@RequestParam("room_no") int room_no, Model model) {
		Room room = reservationService.selectOne(room_no);
		model.addAttribute("room", room);
		return "reservation/reservationListView";
	}
	
}
