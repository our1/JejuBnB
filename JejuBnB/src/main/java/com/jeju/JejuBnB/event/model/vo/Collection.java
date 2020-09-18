package com.jeju.JejuBnB.event.model.vo;

import java.sql.Date;

import com.jeju.JejuBnB.coupon.model.vo.Coupon;

public class Collection {
	private int coupon_no;
	private String event_name;
	private Date coupon_begin;
	private Date coupon_end;
	
	public Collection(int coupon_no, String event_name, Date coupon_begin, Date coupon_end) {
		super();
		this.coupon_no = coupon_no;
		this.event_name = event_name;
		this.coupon_begin = coupon_begin;
		this.coupon_end = coupon_end;
	}
	public int getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public Date getCoupon_begin() {
		return coupon_begin;
	}
	public void setCoupon_begin(Date coupon_begin) {
		this.coupon_begin = coupon_begin;
	}
	public Date getCoupon_end() {
		return coupon_end;
	}
	public void setCoupon_end(Date coupon_end) {
		this.coupon_end = coupon_end;
	}
	@Override
	public String toString() {
		return "Collection [coupon_no=" + coupon_no + ", event_name=" + event_name + ", coupon_begin=" + coupon_begin
				+ ", coupon_end=" + coupon_end + "]";
	}
	
	
	
	
	
}
