package com.jeju.JejuBnB.room.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.room.model.vo.Room;

@Repository("roomDao")
public class RoomDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Room> selectList() {
		List<Room> list = session.selectList("roomMapper.selectList");
		return (ArrayList<Room>) list;
	}

	public ArrayList<Room> selectBList() {
		List<Room> list = session.selectList("roomMapper.selectBList");
		return (ArrayList<Room>) list;
	}

}
