package com.ssafy.happyhouse.model.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;

@Repository
public interface HouseDao {

//	public List<HouseDeal> searchHouseDealByArea(Map<String,String> map);
	public List<HouseDeal> searchHouseDealByDong(String dongCode);
	public List<HouseDeal> searchHouseDealByGugun(Map sidoGugun);

	public List<HouseDeal> searchHouseDealByName(String aptName);

	public List<HouseDeal> searchAll();

	public List<HouseDeal> searchFavorite(String userId);

	public List<HouseInfo> searchHouseInfo(String aptCode);
	
    public int countView(String dongCode);
    
    public List<HouseDeal> searchView();
    
//	public String searchDongCode(String sidoName, String gugunName, String dongName);
}
