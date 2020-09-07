package com.jeju.JejuBnB.room.model.vo;

public class Room_File implements java.io.Serializable{

	private static final long serialVersionUID = 6002L;
	
	private int r_file_no;
	private String room_thumbnail;
	private String rename_file;
	private int room_no;
	
	public Room_File() {
		
	}
	
	public Room_File(int r_file_no, String room_thumbnail, String rename_file, int room_no) {
		super();
		this.r_file_no = r_file_no;
		this.room_thumbnail = room_thumbnail;
		this.rename_file = rename_file;
		this.room_no = room_no;
	}

	public int getR_file_no() {
		return r_file_no;
	}

	public void setR_file_no(int r_file_no) {
		this.r_file_no = r_file_no;
	}

	public String getRoom_thumbnail() {
		return room_thumbnail;
	}

	public void setRoom_thumbnail(String room_thumbnail) {
		this.room_thumbnail = room_thumbnail;
	}

	public String getRename_file() {
		return rename_file;
	}

	public void setRename_file(String rename_file) {
		this.rename_file = rename_file;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	@Override
	public String toString() {
		return "Room_File [r_file_no=" + r_file_no + ", room_thumbnail=" + room_thumbnail + ", rename_file="
				+ rename_file + ", room_no=" + room_no + "]";
	}
	
	
}
