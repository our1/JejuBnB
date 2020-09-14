package com.jeju.JejuBnB.room.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.room.model.dao.RoomDao;
import com.jeju.JejuBnB.room.model.vo.Room;
import com.jeju.JejuBnB.room.model.vo.RoomFilter;
import com.jeju.JejuBnB.room.model.vo.Room_File;

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

	@Override
	public int insertRoom(Room room) {
		return roomDao.insertRoom(room);
	}

	@Override
	public int updateRoom(Room room) {
		return roomDao.updateRoom(room);
	}

	@Override
	public int deleteRoom(int room_no) {
		return roomDao.deleteRoom(room_no);
	}

	@Override
	public ArrayList<Room> selectUserRoom(String userid) {
		return roomDao.selectUserRoom(userid);
	}

	@Override
	public Room selectRoom(int roomno) {
		return roomDao.selectRoom(roomno);
	}

	@Override
	public Room selectRoomNo(String userid) {
		return roomDao.selectRoomNo(userid);
	}

	@Override
	public int insertRoomFile(ArrayList<Room_File> rflist) {
		return roomDao.insertRoomFile(rflist);
	}

	@Override
	public ArrayList<Room> selectSearchFilter(Room room) {
		return roomDao.selectSearchFilter(room);
	}

	@Override
	public ArrayList<Room_File> selectRoomFile(int roomno) {
		return roomDao.selectRoomFile(roomno);
	}

	@Override
	public int getListCount() {
		return roomDao.getListCount();
	}

}
