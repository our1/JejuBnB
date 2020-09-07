package com.jeju.JejuBnB.room.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.room.model.vo.Room;

public interface RoomService {
	ArrayList<Room> selectList();
	ArrayList<Room> selectBList();
}
