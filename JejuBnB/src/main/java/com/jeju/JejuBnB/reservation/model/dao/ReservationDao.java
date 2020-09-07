package com.jeju.JejuBnB.reservation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reservationDao")
public class ReservationDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public ReservationDao() {}

}
