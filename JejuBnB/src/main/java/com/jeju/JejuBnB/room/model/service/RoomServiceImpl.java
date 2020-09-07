package com.jeju.JejuBnB.room.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.room.model.dao.RoomDao;
import com.jeju.JejuBnB.room.model.vo.Room;

@Service("roomService")
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	private RoomDao roomDao;
	
	@Override
	public ArrayList<Room> selectList(int currentPage, int limit) {
		return roomDao.selectList(currentPage, limit);
	}

	@Override
	public ArrayList<Room> selectBList(int currentPage, int limit) {
		return roomDao.selectBList(currentPage, limit);
	}

}
