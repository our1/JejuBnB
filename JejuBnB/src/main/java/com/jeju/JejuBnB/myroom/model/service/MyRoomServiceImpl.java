package com.jeju.JejuBnB.myroom.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.myroom.model.dao.MyRoomDao;
import com.jeju.JejuBnB.myroom.model.vo.MyRoom;

@Service("myroomService")
public class MyRoomServiceImpl implements MyRoomService {

	@Autowired
	MyRoomDao myroomDao;
	
	@Override
	public int insertMyRoom(MyRoom mroom) {
		return myroomDao.insertMyRoom(mroom);
	}

}
