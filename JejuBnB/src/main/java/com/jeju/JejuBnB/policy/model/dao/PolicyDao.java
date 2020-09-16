package com.jeju.JejuBnB.policy.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.policy.model.vo.Policy;

@Repository("policyDao")
public class PolicyDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public PolicyDao() {}
	
	public ArrayList<Policy> selectList(){
		List<Policy>list = session.selectList("policyMapper.selectList");
		return (ArrayList<Policy>)list;
	};
	public int insertPolicy(Policy policy){
	return session.insert("policyMapper.insertPolicy", policy);
	}
}
