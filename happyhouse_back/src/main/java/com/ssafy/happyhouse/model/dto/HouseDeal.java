package com.ssafy.happyhouse.model.dto;

import java.io.Serializable;

public class HouseDeal implements Serializable , Comparable<HouseDeal>{
	private int no;
	private int aptCode;
	private String dealAmount;
	private int dealYear;
	private int dealMonth;
	private int dealDay;
	private String area;
	private String floor;
	private String type;
	private String rentMoney;
	
	private String aptName;
	private int buildYear;
	private String address;

	private String lat;
	private String lng;
	private int view;
	
	public HouseDeal() {
	}

	public HouseDeal(int no, int aptCode, String dealAmount, int dealYear, int dealMonth, int dealDay, String area,
			String floor, String type, String rentMoney, String aptName, int buildYear, String address, String lat,
			String lng, int view) {
		super();
		this.no = no;
		this.aptCode = aptCode;
		this.dealAmount = dealAmount;
		this.dealYear = dealYear;
		this.dealMonth = dealMonth;
		this.dealDay = dealDay;
		this.area = area;
		this.floor = floor;
		this.type = type;
		this.rentMoney = rentMoney;
		this.aptName = aptName;
		this.buildYear = buildYear;
		this.address = address;
		this.lat = lat;
		this.lng = lng;
		this.view = view;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getAptCode() {
		return aptCode;
	}

	public void setAptCode(int aptCode) {
		this.aptCode = aptCode;
	}

	public String getDealAmount() {
		return dealAmount;
	}

	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}

	public int getDealYear() {
		return dealYear;
	}

	public void setDealYear(int dealYear) {
		this.dealYear = dealYear;
	}

	public int getDealMonth() {
		return dealMonth;
	}

	public void setDealMonth(int dealMonth) {
		this.dealMonth = dealMonth;
	}

	public int getDealDay() {
		return dealDay;
	}

	public void setDealDay(int dealDay) {
		this.dealDay = dealDay;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRentMoney() {
		return rentMoney;
	}

	public void setRentMoney(String rentMoney) {
		this.rentMoney = rentMoney;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public int getBuildYear() {
		return buildYear;
	}

	public void setBuildYear(int buildYear) {
		this.buildYear = buildYear;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}
	
	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	@Override
	public String toString() {
		return "HouseDeal [no=" + no + ", aptCode=" + aptCode + ", dealAmount=" + dealAmount + ", dealYear=" + dealYear
				+ ", dealMonth=" + dealMonth + ", dealDay=" + dealDay + ", area=" + area + ", floor=" + floor
				+ ", type=" + type + ", rentMoney=" + rentMoney + ", aptName=" + aptName + ", buildYear=" + buildYear
				+ ", address=" + address + ", lat=" + lat + ", lng=" + lng + ", view=" + view + "]";
	}

	@Override
	public int compareTo(HouseDeal o) {
		return o.view-this.view;
	}

	
	
}
