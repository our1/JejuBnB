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
		return reservationDao.selectOne(room_no);
	}

	@Override
	public int insertReserv(Reservation reserv) {
		return reservationDao.insertReserv(reserv);
	}

	@Override
	public Reservation selectReserv(int room_no) {
		return reservationDao.selectReserv(room_no);
	}

	@Override
	public Room selectReservWait(int room_no) {
		return reservationDao.selectReservWait(room_no);
	}

}
