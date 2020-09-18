package com.jeju.JejuBnB.reservation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.reservation.model.vo.Reservation;
import com.jeju.JejuBnB.room.model.vo.Room;

@Repository("reservationDao")
public class ReservationDao {
	public ReservationDao() {}
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	public int insertReserv(Reservation reserv) {
		return session.insert("reservationMapper.insertReserv", reserv);
	}
	
	public Reservation selectReserv(int room_no) {
		return session.selectOne("reservationMapper.selectReserv");
	}
	
	public Room selectReservWait(int room_no) {
		return session.selectOne("reservationMapper.selectReservWait");
	}
	

}
