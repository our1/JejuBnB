package com.jeju.JejuBnB.reservation.model.service;

import com.jeju.JejuBnB.reservation.model.vo.Reservation;
import com.jeju.JejuBnB.room.model.vo.Room;

public interface ReservationService {

	int insertReserv(Reservation reserv); 
	Reservation selectReserv(int room_no);  
	Room selectReservWait(int room_no); 
	int updateReserv(Reservation reservation);
}
