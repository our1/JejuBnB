package com.jeju.JejuBnB.reservation.model.service;

import com.jeju.JejuBnB.reservation.model.vo.Reservation;
import com.jeju.JejuBnB.room.model.vo.Room;

public interface ReservationService {

	int insertReserv(Reservation reserv); //날짜&인원 정보 넘기기
	Reservation selectReserv(int room_no);  //넘긴 정보와 숙소 정보 리스트
	Room selectReservWait(int room_no); //결제대기 리스트
}
