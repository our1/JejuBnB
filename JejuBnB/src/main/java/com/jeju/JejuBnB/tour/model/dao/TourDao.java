package com.jeju.JejuBnB.tour.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("TourDao")
public class TourDao {
	
	public TourDao() {}
	
	@Autowired
	private SqlSessionTemplate session;
	

}
