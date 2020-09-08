package com.jeju.JejuBnB.room.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.room.model.vo.Room;

public interface RoomService {
	ArrayList<Room> selectList(int currentPage, int limit);
	ArrayList<Room> selectBList(int currentPage, int limit);
	int insertRoom(Room room);
	int updateRoom(Room room);
	int deleteRoom(int room_no);
}
