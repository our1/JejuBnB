package com.jeju.JejuBnB.room.model.vo;

public class Room implements java.io.Serializable {
	
	private static final long serialVersionUID = 6001L;
	
	
	private int room_no;
	private String user_id;
	private String room_name;
	private String room_content;
	private String room_address;
	private int max_people;
	private String checkin_time;
	private String checkout_time;
	private int num_bed;
	private int num_bedroom;
	private int num_bathroom;
	private String amenity;
	private String facility;
	private String build_type;
	private String room_type;
	private String rule;
	private String pass_or_not;
	private int st_num_people;
	private int plus_charge;
	private String room_original_file;
	private String room_renmae_file;
	
	
	public Room() {
		
	}


	public Room(int room_no, String user_id, String room_name, String room_content, String room_address, int max_people,
			String checkin_time, String checkout_time, int num_bed, int num_bedroom, int num_bathroom, String amenity,
			String facility, String build_type, String room_type, String rule, String pass_or_not, int st_num_people,
			int plus_charge, String room_original_file, String room_renmae_file) {
		super();
		this.room_no = room_no;
		this.user_id = user_id;
		this.room_name = room_name;
		this.room_content = room_content;
		this.room_address = room_address;
		this.max_people = max_people;
		this.checkin_time = checkin_time;
		this.checkout_time = checkout_time;
		this.num_bed = num_bed;
		this.num_bedroom = num_bedroom;
		this.num_bathroom = num_bathroom;
		this.amenity = amenity;
		this.facility = facility;
		this.build_type = build_type;
		this.room_type = room_type;
		this.rule = rule;
		this.pass_or_not = pass_or_not;
		this.st_num_people = st_num_people;
		this.plus_charge = plus_charge;
		this.room_original_file = room_original_file;
		this.room_renmae_file = room_renmae_file;
	}


	public int getRoom_no() {
		return room_no;
	}


	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getRoom_name() {
		return room_name;
	}


	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}


	public String getRoom_content() {
		return room_content;
	}


	public void setRoom_content(String room_content) {
		this.room_content = room_content;
	}


	public String getRoom_address() {
		return room_address;
	}


	public void setRoom_address(String room_address) {
		this.room_address = room_address;
	}


	public int getMax_people() {
		return max_people;
	}


	public void setMax_people(int max_people) {
		this.max_people = max_people;
	}


	public String getCheckin_time() {
		return checkin_time;
	}


	public void setCheckin_time(String checkin_time) {
		this.checkin_time = checkin_time;
	}


	public String getCheckout_time() {
		return checkout_time;
	}


	public void setCheckout_time(String checkout_time) {
		this.checkout_time = checkout_time;
	}


	public int getNum_bed() {
		return num_bed;
	}


	public void setNum_bed(int num_bed) {
		this.num_bed = num_bed;
	}


	public int getNum_bedroom() {
		return num_bedroom;
	}


	public void setNum_bedroom(int num_bedroom) {
		this.num_bedroom = num_bedroom;
	}


	public int getNum_bathroom() {
		return num_bathroom;
	}


	public void setNum_bathroom(int num_bathroom) {
		this.num_bathroom = num_bathroom;
	}


	public String getAmenity() {
		return amenity;
	}


	public void setAmenity(String amenity) {
		this.amenity = amenity;
	}


	public String getFacility() {
		return facility;
	}


	public void setFacility(String facility) {
		this.facility = facility;
	}


	public String getBuild_type() {
		return build_type;
	}


	public void setBuild_type(String build_type) {
		this.build_type = build_type;
	}


	public String getRoom_type() {
		return room_type;
	}


	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}


	public String getRule() {
		return rule;
	}


	public void setRule(String rule) {
		this.rule = rule;
	}


	public String getPass_or_not() {
		return pass_or_not;
	}


	public void setPass_or_not(String pass_or_not) {
		this.pass_or_not = pass_or_not;
	}


	public int getSt_num_people() {
		return st_num_people;
	}


	public void setSt_num_people(int st_num_people) {
		this.st_num_people = st_num_people;
	}


	public int getPlus_charge() {
		return plus_charge;
	}


	public void setPlus_charge(int plus_charge) {
		this.plus_charge = plus_charge;
	}


	public String getRoom_original_file() {
		return room_original_file;
	}


	public void setRoom_original_file(String room_original_file) {
		this.room_original_file = room_original_file;
	}


	public String getRoom_renmae_file() {
		return room_renmae_file;
	}


	public void setRoom_renmae_file(String room_renmae_file) {
		this.room_renmae_file = room_renmae_file;
	}


	@Override
	public String toString() {
		return "Room [room_no=" + room_no + ", user_id=" + user_id + ", room_name=" + room_name + ", room_content="
				+ room_content + ", room_address=" + room_address + ", max_people=" + max_people + ", checkin_time="
				+ checkin_time + ", checkout_time=" + checkout_time + ", num_bed=" + num_bed + ", num_bedroom="
				+ num_bedroom + ", num_bathroom=" + num_bathroom + ", amenity=" + amenity + ", facility=" + facility
				+ ", build_type=" + build_type + ", room_type=" + room_type + ", rule=" + rule + ", pass_or_not="
				+ pass_or_not + ", st_num_people=" + st_num_people + ", plus_charge=" + plus_charge
				+ ", room_original_file=" + room_original_file + ", room_renmae_file=" + room_renmae_file + "]";
	}
	
	
}
