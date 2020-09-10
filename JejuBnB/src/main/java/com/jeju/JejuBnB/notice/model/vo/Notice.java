package com.jeju.JejuBnB.notice.model.vo;

public class Notice implements java.io.Serializable{

	
	private static final long serialVersionUID = 6020L;
	
	private String notice_type;
	private String notice_content;
	
	public Notice() {
		
	}

	public Notice(String notice_type, String notice_content) {
		super();
		this.notice_type = notice_type;
		this.notice_content = notice_content;
	}

	public String getNotice_type() {
		return notice_type;
	}

	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	@Override
	public String toString() {
		return "Notice [notice_type=" + notice_type + ", notice_content=" + notice_content + "]";
	}
	
	
}
