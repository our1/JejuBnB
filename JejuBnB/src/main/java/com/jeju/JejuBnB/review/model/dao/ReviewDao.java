package com.jeju.JejuBnB.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.review.model.vo.Review;
import com.jeju.JejuBnB.room.model.vo.Room;

@Repository("reviewDao")
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Review> selectReply(int room_no) {
		List<Review> list = session.selectList("reviewMapper.selectReply", room_no);
		return (ArrayList<Review>) list;
	}
	
	public int insertReview(Review review) {
		return session.insert("reviewMapper.insertReview", review);
	}

	public int updateReview(Review review) {
		return session.update("reviewMapper.updateReview", review);
	}

	public int deleteReview(int reply_no) {
		return session.update("reviewMapper.deleteReview", reply_no);
	}
}
