package com.ssafy.happyhouse.model.dto;

public class Status {
	private int id;
	private String name;
	private double lat;
	private double lng;
	
//	public Status(int id, String name, double lat, double lng) {
//		super();
//		this.id = id;
//		this.name = name;
//		this.lat = lat;
//		this.lng = lng;
//	}
//	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	
	@Override
	public String toString() {
		return "Status [id=" + id + ", name=" + name + ", lat=" + lat + ", lng=" + lng + "]";
	}
	
	
}
