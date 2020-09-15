package com.jeju.JejuBnB.tour.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.tour.model.vo.Tour;
import com.jeju.JejuBnB.tour.model.vo.TourPage;

@Repository("tourDao")
public class TourDao {
	
	public TourDao() {}
	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Tour> selectTour(int currentPage, int limit) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage -1 ) * limit +1;
		int endRow = startRow + limit - 1;
		TourPage tpage = new TourPage(startRow, endRow);
		// 2개의 값을 한 객체에 저장함
		List<Tour> list = session.selectList("tourMapper.selectTour", tpage);
		return (ArrayList<Tour>)list;
	}
	
	public Tour selectTourDetail(int tour_no) {
		return session.selectOne("tourMapper.selectTourDetail", tour_no);
	}
	
	public int insertTour(Tour tour) {
		return session.insert("tourMapper.insertTour", tour);
	}

}
