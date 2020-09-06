package com.jeju.JejuBnB.member.model.dao;



import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.member.model.vo.Member;
@Repository("memberDao")
public class MemberDao {
	//스프링-마이바티스 연동 객체 사용 : root_context.xml 에 선언되어 있음
	@Autowired
	private SqlSessionTemplate session;
public MemberDao() {}
	
public Member selectLogin( Member member) {
	return session.selectOne("memberMapper.loginCheck", member);
}

public int insertMember( Member member) {
	return session.insert("memberMapper.insertMember", member);
}

public Member selectMember( String user_id) {
	return session.selectOne("memberMapper.selectMember", user_id);
}

public int deleteMember(String user_id) {
	return session.delete("memberMapper.deleteMember", user_id);
}
	
public int updateMember( Member member) {
	return session.update("memberMapper.updateMember", member);
}

public ArrayList<Member> selectList() {
	List<Member> list = session.selectList("memberMapper.selectList");
	return (ArrayList<Member>)list;
}

public int updateLoginok( Member member) {
	return session.update("memberMapper.updateLoginok", member);
}

public ArrayList<Member> selectSearchuser_id(String keyword) {
	List<Member> list = session.selectList("memberMapper.selectSearchuser_id", keyword);
	return (ArrayList<Member>)list;
}

public ArrayList<Member> selectSearchGender(String keyword) {
	List<Member> list = session.selectList("memberMapper.selectSearchGender", keyword);
	return (ArrayList<Member>)list;
}

public ArrayList<Member> selectSearchAge(int keyword) {
	List<Member> list = session.selectList("memberMapper.selectSearchAge", keyword);
	return (ArrayList<Member>)list;
}



public ArrayList<Member> selectSearchLoginok(String keyword) {
	List<Member> list = session.selectList("memberMapper.selectSearchLoginok", keyword);
	return (ArrayList<Member>)list;
}

public int selectCheckId(String user_id) {
	return session.update("memberMapper.selectCheckId", user_id);
}

public Member selectFacebookLogin(Member member) {
	return session.selectOne("memberMapper.facebookLoginCheck", member);
}


public int selectIdCheck(String user_id) {
	return session.selectOne("memberMapper.selectIdCheck", user_id);
}
}


