package com.jeju.JejuBnB.room.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.room.model.dao.RoomDao;
import com.jeju.JejuBnB.room.model.vo.Room;
import com.jeju.JejuBnB.room.model.vo.RoomFilter;
import com.jeju.JejuBnB.room.model.vo.RoomLatLng;
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
	public int selectRoomNo(String userid) {
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
	public ArrayList<Room> selectChkList(ArrayList<Room> room, int currentPage, int limit, int people) {
		return roomDao.selectChkList(room, currentPage, limit, people);
	}

	@Override
	public ArrayList<Room> selectChkRNList(String checkin, String checkout) {
		return roomDao.selectChkRNList(checkin, checkout);
	}

	@Override
	public ArrayList<Room> selectSysdate() {
		return roomDao.selectSysdate();
	}

	@Override
	public ArrayList<Room_File> selectRoomFileList(ArrayList<Room> list) {
		return roomDao.selectRoomFileList(list);
	}
	
	@Override
	public int updateRoomChangePass(String user_id) {
		return roomDao.updateRoomChangePass(user_id);
	}

	@Override
	public int deleteRoomFile(Room_File rfile) {
		return roomDao.deleteRoomFile(rfile);
	}

	@Override
	public int insertRoomLatLnt(RoomLatLng rll) {
		return roomDao.insertRoomLatLnt(rll);
	}

	@Override
	public ArrayList<RoomLatLng> selectRoomLatLng() {
		return roomDao.selectRoomLatLng();
	}

	@Override
	public ArrayList<Room> selectLatLng(ArrayList<Room> roomNo, int currentPage, int limit, int people, RoomLatLng seR,
			RoomLatLng neR) {
		return roomDao.selectLatLng(roomNo, currentPage, limit, people, seR, neR);
	}

	@Override
	public ArrayList<Room> selectLatLngJustList(int currentPage, int limit, RoomLatLng seR, RoomLatLng neR) {
		return roomDao.selectLatLngJustList(currentPage, limit, seR, neR);
	}

	@Override
	public int getListCount(RoomLatLng seR, RoomLatLng neR, ArrayList<Room> roomNo) {
		return roomDao.getListCount(seR, neR, roomNo);
	}

}
