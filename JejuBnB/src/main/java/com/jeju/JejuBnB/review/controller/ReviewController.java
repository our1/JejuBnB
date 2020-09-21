package com.jeju.JejuBnB.review.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeju.JejuBnB.review.model.service.ReviewService;
import com.jeju.JejuBnB.review.model.vo.Review;
import com.jeju.JejuBnB.room.controller.RoomController;
import com.jeju.JejuBnB.room.model.service.RoomService;
import com.jeju.JejuBnB.room.model.vo.Room;

@Controller
public class ReviewController {
private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private RoomService roomService;
	
	//리뷰 등록 팝업 띄우기
	@RequestMapping(value="rewrite.do", method=RequestMethod.GET)
	public String popupGet(@RequestParam("room_no") int room_no, Model model) throws Exception {		
			model.addAttribute("room_no", room_no);
			return "review/ReviewWriteForm";		
	}
	
	//별점, 리뷰 등록
	@RequestMapping(value="reinsert.do", method=RequestMethod.POST)
	public String reinsertMethod(@RequestParam(value="room_no") int room_no, Review review, Model model, 
			HttpServletRequest request, @RequestParam(value="clean_score") int clean_score, @RequestParam(value="value_score") int value_score,
			@RequestParam(value="service_score") int service_score) {	
	     
		logger.info("review: " + review.toString());
		reviewService.insertReview(review);
		//평점 구해서 업데이트 실행 숙소에 대한update
		//int result = roomService.updateAvgScore(room_no);  //같은 속소리뷰에 대한 점수 합산과 평균구해서 room 에 업데이트 처리
		Room room = roomService.selectRoom(room_no);
		model.addAttribute("review", review);	
		
		/*
		 * if(review != null) { String sum; String c =
		 * request.getParameter("clean_score"); String v =
		 * request.getParameter("value_score"); String s =
		 * request.getParameter("service_score");
		 * 
		 * sum = c + v + s; double avg = sum*3;
		 * 
		 * model.addAttribute("avg", avg);
		 * 
		 * }
		 */
		
		return "redirect:/moveDetailView.do?room_no="+room_no;
	}
	
	

}
