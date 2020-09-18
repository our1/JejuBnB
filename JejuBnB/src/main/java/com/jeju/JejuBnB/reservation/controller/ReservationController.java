package com.jeju.JejuBnB.reservation.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
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
import com.jeju.JejuBnB.room.model.vo.Room;

@Controller
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private RoomService roomService;
	
	
	//값 담아서 숙소 예약페이지 이동
	@RequestMapping(value="reserv.do", method=RequestMethod.POST)
	public ModelAndView insertReserv(@RequestParam(value="room_no") int room_no, Reservation reserv, Room room, ModelAndView mv,
			@RequestParam(value="checkin_date") String checkin_date, @RequestParam(value="checkout_date") String checkout_date, HttpServletRequest request) {	
		logger.info("reserv: " + reserv);
		
		if(room != null) {
			reservationService.insertReserv(reserv);
			roomService.selectRoom(room_no);
			mv.setViewName("reservation/reservationDetailView");
			mv.addObject("reserv", reserv);
			mv.addObject("room", room);
			
			try {
						
			    logger.info("checkinDate : " + checkin_date);
				logger.info("checkoutDate : " + checkout_date);
				
				String in = request.getParameter("checkin_date");	
				String out = request.getParameter("checkout_date");		
				
				 SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd"); 
				 Date FirstDate = (Date) format.parse(in);
			     Date SecondDate = (Date) format.parse(out);
				 long calDate =	 SecondDate.getTime() - FirstDate.getTime(); 
				 long calDateDays = calDate / (24*60*60*1000); 
				 calDateDays = Math.abs(calDateDays);
				 logger.info("calDateDays : " + calDateDays);
				 
				 mv.addObject("date", calDateDays); //보내줌

			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
		return mv;
				
	}
	
	
}
