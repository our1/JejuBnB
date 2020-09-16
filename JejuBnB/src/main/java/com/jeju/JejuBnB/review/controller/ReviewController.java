package com.jeju.JejuBnB.review.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
	public String reinsertMethod(@RequestParam(value="room_no") int room_no, Review review, Model model) {
		logger.info("review: " + review.toString());
		reviewService.insertReview(review);
		
		//평점 구해서 업데이트 실행 숙소에 대한update
		//int result = roomService.updateAvgScore(room_no);  //같은 속소리뷰에 대한 점수 합산과 평균구해서 room 에 업데이트 처리
		//Room room = roomService.selectRoom(room_no);
		model.addAttribute("review", review);	
		return "redirect:/moveDetailView.do";
	}

}
