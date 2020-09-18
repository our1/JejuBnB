package com.jeju.JejuBnB.event.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.event.model.dao.EventDao;
import com.jeju.JejuBnB.event.model.vo.Collection;
import com.jeju.JejuBnB.event.model.vo.Event;

@Service("eventService")
public class EventServiceImpl implements EventService{
	@Autowired
	private EventDao eventDao;
	
	
	@Override
	public ArrayList<Collection> selectList(){
		return eventDao.selectList();
	}
	
	@Override
	public int insertEvent(Event event) {
		return eventDao.insertEvent(event);
	}
	
	@Override
	public int updateEvent(Event event) {
		return eventDao.updateEvent(event);
	}
	
	@Override 
	public int deleteEvent(String event_no) {
		return eventDao.deleteEvent(event_no);
	}
}
