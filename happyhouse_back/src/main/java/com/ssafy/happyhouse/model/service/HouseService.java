package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.AreaCode;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;

public interface HouseService {

	public List<AreaCode> searchAllAreaCode(String areaUnit, String areaCode);
	
	public List<HouseInfo> searchHouseInfoByArea(String gugunCode, String dongCode);
	public List<HouseInfo> searchHouseInfoByName(String word);
	
	// deal
	public List<HouseDeal> searchHouseDealByAptCode(String aptCode);
	
	public List<HouseDeal> list();

	public Map<String,List<HouseDeal>> searchHouseDealByArea(String sidoCode, String gugunCode, String dongCode, int K);

	public Map<String,List<HouseDeal>> searchHouseDealByName(String aptName, int K);

//	public List<HouseDeal> searchHouseDealByArea(String sidoCode, String gugunCode, String dongCode);
//	public List<HouseDeal> searchHouseDealByName(String aptName);
	public List<HouseDeal> view();
}
