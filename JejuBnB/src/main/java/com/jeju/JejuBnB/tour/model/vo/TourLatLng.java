package com.jeju.JejuBnB.tour.model.vo;

public class TourLatLng implements java.io.Serializable{
	
	private static final long serialVersionUID = 5999L;
	
	private int tour_no;
	private double tour_lat;
	private double tour_lng;
	
	public TourLatLng() {}

	public TourLatLng(int tour_no, double tour_lat, double tour_lng) {
		super();
		this.tour_no = tour_no;
		this.tour_lat = tour_lat;
		this.tour_lng = tour_lng;
	}

	public int getTour_no() {
		return tour_no;
	}

	public void setTour_no(int tour_no) {
		this.tour_no = tour_no;
	}

	public double getTour_lat() {
		return tour_lat;
	}

	public void setTour_lat(double tour_lat) {
		this.tour_lat = tour_lat;
	}

	public double getTour_lng() {
		return tour_lng;
	}

	public void setTour_lng(double tour_lng) {
		this.tour_lng = tour_lng;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "TourLatLng [tour_no=" + tour_no + ", tour_lat=" + tour_lat + ", tour_lng=" + tour_lng + "]";
	}
	

}
