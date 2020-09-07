package com.jeju.JejuBnB.reservation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.reservation.model.dao.ReservationDao;
import com.jeju.JejuBnB.reservation.model.vo.Reservation;
import com.jeju.JejuBnB.room.model.vo.Room;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDao reservationDao;

	@Override
	public Room selectOne(int room_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReserv(Reservation reserv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Reservation selectReserv(int room_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Room selectReservWait(int room_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
