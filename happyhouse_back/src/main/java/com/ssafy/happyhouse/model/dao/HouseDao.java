package com.ssafy.happyhouse.model.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.AreaCode;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.Status;

@Repository
public interface HouseDao {

	public List<AreaCode> searchAllSido();
	public List<AreaCode> searchAllGugun(String areaCodePrefix);
	public List<AreaCode> searchAllDong(String areaCodePrefix);
	
	public List<HouseInfo> searchHouseInfoByArea(String areaCodePrefix);
	public List<HouseInfo> searchHouseInfoByName(String word);
	
	// status
	
	public Status searchAptPos(String aptCode); 
	public List<Status> searchAllTransportation(Map<String,Double> map);
	public List<Status> searchAllCulture(Map<String,Double> map);
	public List<Status> searchAllEducation(Map<String,Double> map);
	public List<Status> searchAllEnvironment(Map<String,Double> map);
	public List<Status> searchAllLife(Map<String,Double> map);
	public List<Status> searchAllSafety(Map<String,Double> map);	
	
	//deal
	
	public List<HouseDeal> searchHouseDealByAptCode(String aptCode);
	
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
