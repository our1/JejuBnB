package com.jeju.JejuBnB.event.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.event.model.vo.Collection;
import com.jeju.JejuBnB.event.model.vo.Event;




public interface EventService {
	ArrayList<Collection> selectList();
	int insertEvent(Event event);
	int updateEvent(Event event);
	int deleteEvent(String event_no);
	
}
