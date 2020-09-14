package com.jeju.JejuBnB.review.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.review.model.vo.Review;

public interface ReviewService {
	ArrayList<Review> selectReply(int reply_no);
	int insertReview(Review review);
	int updateReview(Review review);
	int deleteReview(int reply_no);
}
