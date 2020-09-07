package com.jeju.JejuBnB.tour.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.tour.model.dao.TourDao;
import com.jeju.JejuBnB.tour.model.vo.Tour;
import com.jeju.JejuBnB.tour.model.vo.Tour_Review;

@Service("tourService")
public class TourServiceImpl implements TourService {
	
	@Autowired
	private TourDao tourDao;

	@Override
	public ArrayList<Tour> selectTour(int currentPage, int limit) {
		return tourDao.selectTour(currentPage, limit);
	}

	@Override
	public ArrayList<Tour> SelectSearchTour(String tour_address, int currentPage, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Tour> SelectOrderBy(int currentPage, int limit, int orderby) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Tour SelectTourDeatil(int tour_no) {
		return tourDao.selectTourDetail(tour_no);
	}

	@Override
	public Tour SelectTourLike(int count) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertTour(Tour tour) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTour(Tour tour) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTour(int tour_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertTourReview(Tour_Review tour_review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTourReview(Tour_Review tour_review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTourReview(int tour_review_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int SelectTourReadCount(Tour tour) {
		// TODO Auto-generated method stub
		return 0;
	}

}
