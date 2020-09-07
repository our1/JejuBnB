package com.jeju.JejuBnB.room.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.room.model.vo.Room;
import com.jeju.JejuBnB.room.model.vo.PageCount;

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
		List<Room> list = session.selectList("roomMapper.selectBList");
		return (ArrayList<Room>) list;
	}

}
