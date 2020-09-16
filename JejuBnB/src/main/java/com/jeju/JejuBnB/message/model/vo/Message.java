package com.jeju.JejuBnB.message.model.vo;

import java.sql.Date;

public class Message implements java.io.Serializable{
	private static final long serialVersionUID = 1114L;
	
	private int message_no; 
	private String user_one;
	private String user_two;
	private String content;
	private java.sql.Date message_date;
	private String writer;
	
	public Message() {
		super();
	}

	

	public Message(int message_no, String user_one, String user_two, String content, Date message_date, String writer) {
		super();
		this.message_no = message_no;
		this.user_one = user_one;
		this.user_two = user_two;
		this.content = content;
		this.message_date = message_date;
		this.writer = writer;
	}



	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public String getUser_one() {
		return user_one;
	}

	public void setUser_one(String user_one) {
		this.user_one = user_one;
	}

	public String getUser_two() {
		return user_two;
	}

	public void setUser_two(String user_two) {
		this.user_two = user_two;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public java.sql.Date getMessage_date() {
		return message_date;
	}

	public void setMessage_date(java.sql.Date message_date) {
		this.message_date = message_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "Message [message_no=" + message_no + ", user_one=" + user_one + ", user_two=" + user_two + ", content="
				+ content + ", message_date=" + message_date + ", writer=" + writer + "]";
	}
	
	
	
}	
