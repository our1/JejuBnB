package com.jeju.JejuBnB.room.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.room.model.vo.Room;
import com.jeju.JejuBnB.room.model.vo.RoomFilter;
import com.jeju.JejuBnB.room.model.vo.Room_File;

public interface RoomService {
	ArrayList<Room> selectList(int currentPage, int limit);
	ArrayList<Room> selectBList(int currentPage, int limit);
	ArrayList<Room> selectUserRoom(String userid);
	Room selectRoom(int roomno);
	int insertRoom(Room room);
	int updateRoom(Room room);
	int deleteRoom(int room_no);
	int selectRoomNo(String userid);
	int insertRoomFile(ArrayList<Room_File> rflist);
	ArrayList<Room> selectSearchFilter(Room room);
	ArrayList<Room_File> selectRoomFile(int roomno);
	int getListCount();
	ArrayList<Room> selectChkList(ArrayList<Room> room, int currentPage, int limit, int people);
	ArrayList<Room> selectChkRNList(String checkin, String checkout);
	ArrayList<Room> selectSysdate();
}
