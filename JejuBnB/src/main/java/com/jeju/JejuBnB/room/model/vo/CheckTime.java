package com.jeju.JejuBnB.room.model.vo;

public class CheckTime implements java.io.Serializable{

	private static final long serialVersionUID = 6010L;
	
	private int inhour;
	private int inminute;
	private int outhour;
	private int outminute;
	
	public CheckTime() {
		
	}

	public CheckTime(int inhour, int inminute, int outhour, int outminute) {
		super();
		this.inhour = inhour;
		this.inminute = inminute;
		this.outhour = outhour;
		this.outminute = outminute;
	}

	public int getInhour() {
		return inhour;
	}

	public void setInhour(int inhour) {
		this.inhour = inhour;
	}

	public int getInminute() {
		return inminute;
	}

	public void setInminute(int inminute) {
		this.inminute = inminute;
	}

	public int getOuthour() {
		return outhour;
	}

	public void setOuthour(int outhour) {
		this.outhour = outhour;
	}

	public int getOutminute() {
		return outminute;
	}

	public void setOutminute(int outminute) {
		this.outminute = outminute;
	}

	@Override
	public String toString() {
		return "CheckTime [inhour=" + inhour + ", inminute=" + inminute + ", outhour=" + outhour + ", outminute="
				+ outminute + "]";
	}
	
	
}
