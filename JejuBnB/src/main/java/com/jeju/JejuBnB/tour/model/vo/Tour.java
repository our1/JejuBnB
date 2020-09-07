package com.jeju.JejuBnB.tour.model.vo;

import java.sql.Date;

public class Tour implements java.io.Serializable{
	private static final long serialVersionUID = 5111L;
	
	private int tour_no;
	private String tour_name;
	private String tour_content;
	private java.sql.Date tour_date;
	private String tour_address;
	private String tour_act_start_date;
	private String tour_act_end_date;
	private String tour_thumnail_original_file;
	private String tour_thumnail_rename_file;
	private int tour_readcount;
	private int tour_category_no;
	private String user_id;
	
	public Tour() {}

	public Tour(int tour_no, String tour_name, String tour_content, Date tour_date, String tour_address,
			String tour_act_start_date, String tour_act_end_date, String tour_thumnail_original_file,
			String tour_thumnail_rename_file, int tour_readcount, int tour_category_no, String user_id) {
		super();
		this.tour_no = tour_no;
		this.tour_name = tour_name;
		this.tour_content = tour_content;
		this.tour_date = tour_date;
		this.tour_address = tour_address;
		this.tour_act_start_date = tour_act_start_date;
		this.tour_act_end_date = tour_act_end_date;
		this.tour_thumnail_original_file = tour_thumnail_original_file;
		this.tour_thumnail_rename_file = tour_thumnail_rename_file;
		this.tour_readcount = tour_readcount;
		this.tour_category_no = tour_category_no;
		this.user_id = user_id;
	}

	public int getTour_no() {
		return tour_no;
	}

	public void setTour_no(int tour_no) {
		this.tour_no = tour_no;
	}

	public String getTour_name() {
		return tour_name;
	}

	public void setTour_name(String tour_name) {
		this.tour_name = tour_name;
	}

	public String getTour_content() {
		return tour_content;
	}

	public void setTour_content(String tour_content) {
		this.tour_content = tour_content;
	}

	public java.sql.Date getTour_date() {
		return tour_date;
	}

	public void setTour_date(java.sql.Date tour_date) {
		this.tour_date = tour_date;
	}

	public String getTour_address() {
		return tour_address;
	}

	public void setTour_address(String tour_address) {
		this.tour_address = tour_address;
	}

	public String getTour_act_start_date() {
		return tour_act_start_date;
	}

	public void setTour_act_start_date(String tour_act_start_date) {
		this.tour_act_start_date = tour_act_start_date;
	}

	public String getTour_act_end_date() {
		return tour_act_end_date;
	}

	public void setTour_act_end_date(String tour_act_end_date) {
		this.tour_act_end_date = tour_act_end_date;
	}

	public String getTour_thumnail_original_file() {
		return tour_thumnail_original_file;
	}

	public void setTour_thumnail_original_file(String tour_thumnail_original_file) {
		this.tour_thumnail_original_file = tour_thumnail_original_file;
	}

	public String getTour_thumnail_rename_file() {
		return tour_thumnail_rename_file;
	}

	public void setTour_thumnail_rename_file(String tour_thumnail_rename_file) {
		this.tour_thumnail_rename_file = tour_thumnail_rename_file;
	}

	public int getTour_readcount() {
		return tour_readcount;
	}

	public void setTour_readcount(int tour_readcount) {
		this.tour_readcount = tour_readcount;
	}

	public int getTour_category_no() {
		return tour_category_no;
	}

	public void setTour_category_no(int tour_category_no) {
		this.tour_category_no = tour_category_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Tour [tour_no=" + tour_no + ", tour_name=" + tour_name + ", tour_content=" + tour_content
				+ ", tour_date=" + tour_date + ", tour_address=" + tour_address + ", tour_act_start_date="
				+ tour_act_start_date + ", tour_act_end_date=" + tour_act_end_date + ", tour_thumnail_original_file="
				+ tour_thumnail_original_file + ", tour_thumnail_rename_file=" + tour_thumnail_rename_file
				+ ", tour_readcount=" + tour_readcount + ", tour_category_no=" + tour_category_no + ", user_id="
				+ user_id + "]";
	}
}
