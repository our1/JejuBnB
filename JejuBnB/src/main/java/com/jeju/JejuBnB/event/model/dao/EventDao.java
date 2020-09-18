package com.jeju.JejuBnB.event.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.event.model.vo.Collection;
import com.jeju.JejuBnB.event.model.vo.Event;

@Repository("eventDao")
public class EventDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public EventDao() {}
	
	
	public ArrayList<Collection> selectList(){
		List<Collection> list = session.selectList("eventMapper.selectList");
		return (ArrayList<Collection>)list;
	}
	
	public int insertEvent(Event event) {
		return session.insert("eventMapper.insertEvent", event);
	}
	
	public int updateEvent(Event event) {
		return session.update("eventMapper.updateEvent", event);
	}
	
	public int deleteEvent(String event_no) {
		String [] eventNo = event_no.split(",");
		int result = 0;
		for(int i = 0; i < eventNo.length; i++) {
			int count = session.delete("eventMapper.deleteEvent", eventNo[i]);
			if(count > 0) {
				result++;
			}
		}if (result == eventNo.length) {
				return 1;
			}else {
				return 0;
			}
		}
	
}
