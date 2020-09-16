package com.jeju.JejuBnB.notice.model.vo;

public class Notice_Type implements java.io.Serializable{
	
	private static final long seriarVersionUID = 6016L;
	
	private int notice_type_no;
	private String notice_type_name;
	
	public Notice_Type() {
		
	}
	
	

	public Notice_Type(int notice_type_no, String notice_type_name) {
		super();
		this.notice_type_no = notice_type_no;
		this.notice_type_name = notice_type_name;
	}



	public int getNotice_type_no() {
		return notice_type_no;
	}

	public void setNotice_type_no(int notice_type_no) {
		this.notice_type_no = notice_type_no;
	}

	public String getNotice_type_name() {
		return notice_type_name;
	}

	public void setNotice_type_name(String notice_type_name) {
		this.notice_type_name = notice_type_name;
	}



	@Override
	public String toString() {
		return "Notice_Type [notice_type_no=" + notice_type_no + ", notice_type_name=" + notice_type_name + "]";
	}
	
	
}
