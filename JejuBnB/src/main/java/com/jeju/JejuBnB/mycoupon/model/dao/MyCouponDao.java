package com.jeju.JejuBnB.mycoupon.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.mycoupon.model.vo.MyCoupon;

@Repository("mycouponDao")
public class MyCouponDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public MyCouponDao() {}
	
	public MyCoupon selectList(MyCoupon mycoupon){
		return session.selectOne("mycouponMapper.selectList", mycoupon);
	}
	
	public int insertMyCoupon(MyCoupon mycoupon) {
		return session.insert("mycouponMapper.insertMyCoupon", mycoupon);
	}
}
