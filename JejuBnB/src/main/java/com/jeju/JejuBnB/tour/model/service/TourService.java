package com.jeju.JejuBnB.tour.model.service;

import java.util.ArrayList;
import com.jeju.JejuBnB.tour.model.vo.Tour;
import com.jeju.JejuBnB.tour.model.vo.Tour_Image;
import com.jeju.JejuBnB.tour.model.vo.Tour_Review;

public interface TourService {
	
	ArrayList<Tour> selectTour(int currentPage, int limit);
	ArrayList<Tour> SelectSearchTour(Tour tour);
    ArrayList<Tour> SelectOrderBy (int currentPage, int limit, int orderby);
    ArrayList<Tour_Image> selectTourImage(int touno);
    ArrayList<Tour_Review> selectTourReview(int tour_review_no);
	Tour SelectTourDetail(int tour_no);
	Tour SelectTourLike (int count);
	Tour selectTourNo(String user_id);
	int insertTour (Tour tour);
	int updateTour (Tour tour);
	int deleteTour (int tour_no);
	int insertTourReview (Tour_Review tour_review);
	int updateTourReview (Tour_Review tour_review);
	int deleteTourReview (int tour_review_no);
    int updateTourReadCount (int tour_no);
	int insertTourImage(ArrayList<Tour_Image> tilist);
}
