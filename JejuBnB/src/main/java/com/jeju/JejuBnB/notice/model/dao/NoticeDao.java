package com.jeju.JejuBnB.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.notice.model.vo.Notice;
import com.jeju.JejuBnB.notice.model.vo.User_Notice;

@Repository("noticdDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Notice> selectUser(String userid) {
		List<Notice> list = session.selectList("User_NoticeMapper.selectUNotice", userid);
		return (ArrayList<Notice>) list;
	}

	public int insertUNotice(User_Notice unotice) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteUNotice(int unoticeno) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteNotice(int noticeno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
