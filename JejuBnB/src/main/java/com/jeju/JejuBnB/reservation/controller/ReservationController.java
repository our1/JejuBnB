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
import org.springframework.ui.Model;
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
	public ModelAndView insertReserv(@RequestParam(value="room_no") int room_no, Reservation reserv, ModelAndView mv,
			@RequestParam(value="a_num", defaultValue="1") int a_num, @RequestParam(value="c_num", defaultValue="0") int c_num, 
			@RequestParam(value="i_num", defaultValue="0") int i_num, HttpServletRequest request) throws Exception {	
		logger.info("reserv: " + reserv);
		
		if(reserv != null) {
			reservationService.insertReserv(reserv);
			Room room = roomService.selectRoom(room_no);
			mv.addObject("reserv", reserv);
			mv.addObject("room", room);
			mv.setViewName("reservation/reservationDetailView");
			
			try {						
				
				 String in = request.getParameter("checkin_date");	
				 String out = request.getParameter("checkout_date");		
				
				 SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd"); 
				 Date FirstDate = (Date) format.parse(in);
			     Date SecondDate = (Date) format.parse(out);
				 long calDate =	 SecondDate.getTime() - FirstDate.getTime(); 
				 long calDateDays = calDate / (24*60*60*1000); 
				 calDateDays = Math.abs(calDateDays);
				 logger.info("calDateDays : " + calDateDays);
				 
				 mv.addObject("date", calDateDays); 

			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		return mv;
				
	}
	
	//결제 팝업
	@RequestMapping(value="payment.do", method=RequestMethod.GET)
	public String reservPayment(@RequestParam(value="room_no", required=false) int room_no, 
			@RequestParam(value="date", required=false) int date,
			@RequestParam(value="room_weekday", required=false) int room_weekday,
			@RequestParam(value="room_weekend", required=false) int room_weekend, Model model) throws Exception {	
		logger.info(" 1:" + room_no);
		logger.info(" date:" + date);
		Room room = roomService.selectRoom(room_no);
		logger.info(" room:" + room);
		model.addAttribute("room_no", room_no);
		model.addAttribute("date", date);
		return "reservation/popupPayment";		
	}
	
	//카카오페이 결제
	@RequestMapping(value="pay.do", method=RequestMethod.GET)
	public String kakaoPayment(@RequestParam(value="room_no", required=false) int room_no, 
			@RequestParam(value="date", required=false) int date, Model model)  {		
		logger.info(" 2:" + room_no);
		Room room = roomService.selectRoom(room_no);
		logger.info(" room:" + room);
		logger.info(" date:" + date);
		model.addAttribute("room_no", room_no);	
		model.addAttribute("date", date);
		model.addAttribute("room", room);
		return "reservation/Payment";			
	}

	//무통장 결제
	@RequestMapping(value="pay2.do", method=RequestMethod.GET)
	public String muPayment(@RequestParam(value="room_no", required=false) int room_no, 
			@RequestParam(value="date", required=false) int date,Model model)  {	
		logger.info(" 3:" + room_no);
		Room room = roomService.selectRoom(room_no);
		logger.info(" room:" + room);
		logger.info(" date:" + date);
		model.addAttribute("room_no", room_no);
		model.addAttribute("date", date);
		model.addAttribute("room", room);
		return "reservation/Payment2";					
	}
	
	//결제대기 페이지 이동
	@RequestMapping(value="reservST.do", method=RequestMethod.POST)
	public String reservStation(@RequestParam(value="room_no", required=false) int room_no, Model model) {
		model.addAttribute("room_no", room_no);
		return "reservation/reservationWaitView";
	}
	
}
