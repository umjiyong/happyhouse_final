package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.HouseDeal;

public interface HouseService {

	public List<HouseDeal> list();

	public Map<String,List<HouseDeal>> searchHouseDealByArea(String sidoCode, String gugunCode, String dongCode, int K);

	public Map<String,List<HouseDeal>> searchHouseDealByName(String aptName, int K);

//	public List<HouseDeal> searchHouseDealByArea(String sidoCode, String gugunCode, String dongCode);
//	public List<HouseDeal> searchHouseDealByName(String aptName);
	public List<HouseDeal> view();
}
