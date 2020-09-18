package com.jeju.JejuBnB.tour.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.tour.model.vo.Tour;
import com.jeju.JejuBnB.tour.model.vo.TourPage;
import com.jeju.JejuBnB.tour.model.vo.Tour_Image;
import com.jeju.JejuBnB.tour.model.vo.Tour_Review;

@Repository("tourDao")
public class TourDao {
	
	public TourDao() {}
	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Tour> selectTour(int currentPage, int limit) {
		int startRow = (currentPage -1 ) * limit +1;
		int endRow = startRow + limit - 1;
		TourPage tpage = new TourPage(startRow, endRow);
		List<Tour> list = session.selectList("tourMapper.selectTour", tpage);
		return (ArrayList<Tour>)list;
	}
	
	public Tour selectTourDetail(int tour_no) {
		return session.selectOne("tourMapper.selectTourDetail", tour_no);
	}
	
	public int insertTour(Tour tour) {
		return session.insert("tourMapper.insertTour", tour);
	}

	public ArrayList<Tour> selectSearchTour(Tour tour) {
		return null;
	}

	public ArrayList<Tour> selectOrderBy(int currentPage, int limit, int orderby) {
		return null;
	}

	public Tour selectTourLike(int count) {
		return session.selectOne("tourMapper.selectTourLike", count);
	}

	public int updateTour(Tour tour) {
		return session.update("tourMapper.updateTour", tour);
	}

	public int deleteTour(int tour_no) {
		return session.delete("tourMapper.deleteTour",tour_no);
	}

	public int insertTourReview(Tour_Review tour_review) {
		return session.insert("tourMapper.insertTourReview", tour_review);
	}

	public int updateTourReview(Tour_Review tour_review) {
		return session.update("tourMapper.updateTourReview", tour_review);
	}

	public int deleteTourReview(int tour_review_no) {
		return session.delete("tourMapper.deleteTourReview", tour_review_no);
	}

	public int updateTourReadCount(int tour_no) {
		return session.update("tourMapper.updateTourReadCount", tour_no);
	}

	public ArrayList<Tour_Image> selectTourImage(int touno) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertTourImage(ArrayList<Tour_Image> tilist) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Tour selectTourNo(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<Tour_Review> selectTourReview(int tour_review_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
