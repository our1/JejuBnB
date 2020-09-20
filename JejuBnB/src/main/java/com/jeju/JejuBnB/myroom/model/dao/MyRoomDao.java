package com.jeju.JejuBnB.myroom.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.myroom.model.vo.MyRoom;

@Repository("myroomDao")
public class MyRoomDao {	
	

	@Autowired
	private SqlSessionTemplate session;
	
	public int insertMyRoom(MyRoom mroom) {
		return session.insert("myroomMapper.insertMyRoom", mroom);
	}

}
