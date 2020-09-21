package com.jeju.JejuBnB.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.review.model.dao.ReviewDao;
import com.jeju.JejuBnB.review.model.vo.Review;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	public ReviewDao reviewDao;

	@Override
	public int insertReview(Review review) {
		return reviewDao.insertReview(review);
	}

	@Override
	public int updateReview(Review review) {
		return reviewDao.updateReview(review);
	}

	@Override
	public int deleteReview(int room_no) {
		return reviewDao.deleteReview(room_no);
	}

	@Override
	public ArrayList<Review> selectReply(int room_no) {
		return reviewDao.selectReply(room_no);
	}


	

	
	
}
