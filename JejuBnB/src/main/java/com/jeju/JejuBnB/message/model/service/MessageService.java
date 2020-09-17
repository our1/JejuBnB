package com.jeju.JejuBnB.message.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.message.model.vo.Message;

public interface MessageService {

	int insertMessage(Message message);
	ArrayList<Message> selectListMessage(Message message);

}
