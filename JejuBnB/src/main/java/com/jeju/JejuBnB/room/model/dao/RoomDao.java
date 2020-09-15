package com.jeju.JejuBnB.room.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
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

	public Room selectRoomNo(String userid) {
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

	public ArrayList<Room> selectSearchFilter(Room room) {
		HashMap hm = new HashMap();
		if(room.getAmenity() != null) {
			ArrayList<String> amenitylist = new ArrayList<String>();
			String [] amenity = room.getAmenity().split(",");
			for (int i = 0; i < amenity.length; i++) {
				amenitylist.add(amenity[i]);
			}
			hm.put("alist", amenitylist);
		}
		
		if(room.getFacility() != null) {
			ArrayList<String> facilitylist = new ArrayList<String>();
			String [] fecility = room.getFacility().split(",");
			for(int i = 0; i < fecility.length; i++) {
				facilitylist.add(fecility[i]);
			}
			hm.put("flist", facilitylist);

		}
		
		if(room.getBuild_type() != null) {
			ArrayList<String> buildlist = new ArrayList<String>();
			String [] build = room.getBuild_type().split(",");
			for(int i = 0; i < build.length; i++) {
				buildlist.add(build[i]);
			}
			hm.put("blist", buildlist);
		}
		
		if(room.getRule() != null) {
			ArrayList<String> rulelist = new ArrayList<String>();
			String [] rule = room.getRule().split(",");
			for(int i = 0; i < rule.length; i++) {
				rulelist.add(rule[i]);
			}
			hm.put("rlist", rulelist);
		}
		
		hm.put("bed", room.getBed());
		hm.put("bedroom", room.getBedroom());
		hm.put("bathroom", room.getBathroom());
		hm.put("startRow", 1);
		hm.put("endRow", 8);
		List<Room> list = session.selectList("roomMapper.selectSearchFilter", hm);
		
		return (ArrayList<Room>) list;
	}

	public ArrayList<Room_File> selectRoomFile(int roomno) {
		List<Room_File> rflist = session.selectList("roomMapper.selectRoomFile", roomno);
		return (ArrayList<Room_File>) rflist;
	}

	public int getListCount() {
		return session.selectOne("roomMapper.getListCount");
				
	}

	public ArrayList<Room> selectChkList(ArrayList<Room> room, int currentPage, int limit, int people) {
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		HashMap hm = new HashMap();
		hm.put("list", room);
		hm.put("startRow", 1);
		hm.put("endRow", 8);
		hm.put("people", people);
		List<Room> list = session.selectList("roomMapper.selectChkList", hm);
		return (ArrayList<Room>) list;
	}

	public ArrayList<Room> selectChkRNList(String checkin, String checkout) {
		HashMap hm = new HashMap();
		hm.put("checkin", checkin);
		hm.put("checkout", checkout);
		List<Room> list = session.selectList("roomMapper.selectChkRNList", hm);
		return (ArrayList<Room>)list;
	}

	public ArrayList<Room> selectSysdate() {
		List<Room> list = session.selectList("roomMapper.selectSysdate");
		return (ArrayList<Room>)list;
	}

	

}
