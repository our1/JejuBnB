package com.jeju.JejuBnB.message.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.member.model.service.MemberService;
import com.jeju.JejuBnB.message.model.dao.MessageDao;
import com.jeju.JejuBnB.message.model.vo.Message;

@Service("messageService")
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao messageDao;

	@Override
	public int insertMessage(Message message) {
		return messageDao.insertMessage(message);
	}

	@Override
	public ArrayList<Message> selectListMessage(Message message) {
		return messageDao.selectListMessage(message);
	}
}
