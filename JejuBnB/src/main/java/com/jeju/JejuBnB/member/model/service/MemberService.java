package com.jeju.JejuBnB.member.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.member.model.vo.Member;
public interface MemberService {
	
	
	Member selectLogin(Member member) ;
	int insertMember(Member member);
	int updateMember(Member member);
	int deleteMember(String userid);
	Member selectMember(String userid);
	Member selectFacebookLogin(Member member);
	int selectInfoCheck(Member member);
	int updatPwdMember(Member member);
	ArrayList<Member> selectMemberList(); 
	int updateBeAdminMember(String user_id);
	
}
