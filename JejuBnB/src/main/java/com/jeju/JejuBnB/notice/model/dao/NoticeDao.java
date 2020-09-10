package com.jeju.JejuBnB.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.notice.model.vo.Notice;
import com.jeju.JejuBnB.notice.model.vo.Notice_Type;
import com.jeju.JejuBnB.notice.model.vo.User_Notice;

@Repository("noticdDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate session;

	

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

	public ArrayList<Notice_Type> selectNType() {
		List<Notice_Type> list = session.selectList("noticeMapper.selectNType");
		return (ArrayList<Notice_Type>) list;
	}

	public ArrayList<User_Notice> selectUserNotice(String userid) {
		List<User_Notice> list = session.selectList("noticeMapper.selectUserNotice", userid);
		return (ArrayList<User_Notice>) list;
	}

	public int deleteUserNotice(int noticeno) {
		return session.delete("noticeMapper.deleteUserNotice", noticeno);
	}

}
