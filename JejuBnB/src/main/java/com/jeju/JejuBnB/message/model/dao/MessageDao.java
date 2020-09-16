package com.jeju.JejuBnB.message.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.member.model.vo.Member;
import com.jeju.JejuBnB.message.model.vo.Message;

@Repository("messageDao")
public class MessageDao {
	@Autowired
	private SqlSessionTemplate session;

	public MessageDao() {
		super();
	}

	public int insertMessage(Message message) {
		return session.insert("messageMapper.insertMessage", message);
	}

	public ArrayList<Message> selectListMessage(Message message) {
		List<Message> list = session.selectList("messageMapper.selectListMessage", message);
		return (ArrayList<Message>)list;
	}
	
	

}
