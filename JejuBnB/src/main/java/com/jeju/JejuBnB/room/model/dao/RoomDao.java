package com.jeju.JejuBnB.room.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.room.model.vo.PageCount;
import com.jeju.JejuBnB.room.model.vo.Room;
import com.jeju.JejuBnB.room.model.vo.Room_File;

@Repository("roomDao")
public class RoomDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Room> selectList(int currentPage, int limit) {
		PageCount pageCount = new PageCount();		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		pageCount.setStartRow(startRow);
		pageCount.setEndRow(endRow);
		List<Room> list = session.selectList("roomMapper.selectList", pageCount);
		return (ArrayList<Room>) list;
	}

	public ArrayList<Room> selectBList(int currentPage, int limit) {
		PageCount pageCount = new PageCount();		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		pageCount.setStartRow(startRow);
		pageCount.setEndRow(endRow);
		List<Room> list = session.selectList("roomMapper.selectBList", pageCount);
		return (ArrayList<Room>) list;
	}

	public int insertRoom(Room room) {
		return session.insert("roomMapper.insertRoom", room);
	}

	public int updateRoom(Room room) {
		return session.update("roomMapper.updateRoom", room);
	}

	public int deleteRoom(int room_no) {
		int result = 0;
		int selectReviewCount = session.selectOne("roomMapper.selectReviewCount", room_no);
		if (selectReviewCount > 0) {
			int roomfile = session.delete("roomMapper.deleteRoomFile", room_no);
			int review = session.delete("roomMapper.deleteRoomRivew", room_no);
			int room = session.delete("roomMapper.deleteRoom", room_no);

			if (roomfile > 0 && room > 0 && review > 0) {
				result = room;
			} 
			
		} else {
			int roomfile = session.delete("roomMapper.deleteRoomFile", room_no);
			int room = session.delete("roomMapper.deleteRoom", room_no);

			if (roomfile > 0 && room > 0) {
				result = room;
			} 
		}
		return result;
	}

	public ArrayList<Room> selectUserRoom(String userid) {
		List<Room> list = session.selectList("roomMapper.selectUserRoom", userid);
		return (ArrayList<Room>)list;
	}

	public Room selectRoom(int roomno) {
		return session.selectOne("roomMapper.selectRoom", roomno);
	}

	public int selectRoomNo(String userid) {
		return session.selectOne("roomMapper.selectRoomNo", userid);
	}

	public int insertRoomFile(ArrayList<Room_File> rflist) {
		int result = 0;
		for(int i = 0; i < rflist.size(); i++) {
			result += session.insert("roomMapper.insertRoomFile", rflist.get(i));
		}
		
		if(!(rflist.size()-1 == result)) {
			result = 0;
		}
		return result;
	}

	

}
