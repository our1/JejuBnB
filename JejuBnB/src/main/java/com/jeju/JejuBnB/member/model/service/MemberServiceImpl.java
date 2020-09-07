package com.jeju.JejuBnB.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.member.model.dao.MemberDao;
import com.jeju.JejuBnB.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member selectLogin(Member member) {
		
		return memberDao.selectLogin(member);
	}

	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}

	@Override
	public int deleteMember(String userid) {
		return memberDao.deleteMember(userid);
	}

	@Override
	public ArrayList<Member> selectList() {
		return memberDao.selectList();
	}

	@Override
	public Member selectMember(String userid) {
		
		return memberDao.selectMember(userid);
	}

	@Override
	public Member selectFacebookLogin(Member member) {
		return memberDao.selectFacebookLogin(member);
	}


	@Override
	public int selectInfoCheck(Member member) {
		return memberDao.selectInfoCheck(member);
	}

}
