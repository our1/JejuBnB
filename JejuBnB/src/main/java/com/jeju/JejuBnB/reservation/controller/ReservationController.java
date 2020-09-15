package com.jeju.JejuBnB.reservation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.reservation.model.service.ReservationService;
import com.jeju.JejuBnB.room.model.service.RoomService;
import com.jeju.JejuBnB.room.model.vo.Room;

@Controller
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService reservationService;
	private RoomService roomService;
	
	//값 담아서 숙소 예약페이지 이동
	@RequestMapping(value="redetail.do", method=RequestMethod.GET)
	public ModelAndView moveReserv(ModelAndView mv, @RequestParam("room_no") int roomno) {
		Room room = roomService.selectRoom(roomno);
		if(room != null) {
			mv.setViewName("reservation/reservationDetailView");
			mv.addObject("room", room);
			logger.info(room.toString());

		}else {
			mv.setViewName("common/error");
			mv.addObject("message", "게시글 조회 실패");
		}
		return mv;
	}
	
	
}
