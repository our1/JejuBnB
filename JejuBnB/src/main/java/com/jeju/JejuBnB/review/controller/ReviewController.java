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

@Controller
public class ReviewController {
private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	//댓글 리스트
	@RequestMapping(value="rlist.do", method=RequestMethod.GET)
	public void selectReview(@RequestParam(value="replyno") int reply_no, Model model) {
		ArrayList<Review> list = reviewService.selectReply(reply_no);
		model.addAttribute("list", list);
		
	}
	
	//댓글등록
	@RequestMapping(value="reinsert.do", method=RequestMethod.GET)
	public String reinsertMethod(@RequestParam(value="replyco") int reply_no, Review review, Model model) {
		model.addAttribute("review", review);
		return "redirect:/moveDetailView.do?roomno=";
	}

}
