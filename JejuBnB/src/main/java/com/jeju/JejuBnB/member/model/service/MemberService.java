package com.jeju.JejuBnB.member.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.member.model.vo.Member;
public interface MemberService {
	
	
	Member selectLogin(Member member) ;
	int insertMember(Member member);
	int updateMember(Member member);
	int deleteMember(String userid);
	ArrayList<Member> selectList();
	Member selectMember(String userid);
	Member selectFacebookLogin(Member member);
	int selectIdCheck(String user_id);
}
