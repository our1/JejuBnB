package com.jeju.JejuBnB.notice.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.notice.model.vo.Notice;
import com.jeju.JejuBnB.notice.model.vo.User_Notice;

public interface NoticeService {

	ArrayList<Notice> selectUser(String userid);
	
	int insertUNotice(User_Notice unotice);
	
	int deleteUNotice(int unoticeno);
	
	int insertNotice(Notice notice);
	
	int deleteNotice(int noticeno);

}
