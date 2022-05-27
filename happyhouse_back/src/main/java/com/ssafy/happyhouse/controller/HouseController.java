package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.AreaCode;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.Status;
import com.ssafy.happyhouse.model.service.HouseService;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/house")

@CrossOrigin(origins = "*", methods = {RequestMethod.GET , RequestMethod.POST, RequestMethod.PUT, RequestMethod.DELETE})

public class HouseController {

	private HouseService houseService;
	
	@Autowired
	public HouseController(HouseService houseService) {
		this.houseService = houseService;
	}
	
	// 시도, 구군, 동 정보 불러오기
	@GetMapping("/area")
	public ResponseEntity<?> areaCodeList(String areaUnit, String areaCode){
		return new ResponseEntity<List<AreaCode>>(houseService.searchAllAreaCode(areaUnit, areaCode),HttpStatus.OK);
	}
	
	
	// 아파트 리스트 불러오기
	@GetMapping("list")
	public ResponseEntity<?> searchHouseInfo(String key, String word, String gugunCode, String dongCode) {
		
		if(key==null) return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		if(key.equals("searchbyarea")) {
			List<HouseInfo> houseInfoList = houseService.searchHouseInfoByArea(gugunCode, dongCode);
			return new ResponseEntity<List<HouseInfo>>(houseInfoList,HttpStatus.OK);
		} else if(key.equals("searchbyname")){
			List<HouseInfo> houseInfoList = houseService.searchHouseInfoByName(word);
			return new ResponseEntity<List<HouseInfo>>(houseInfoList,HttpStatus.OK);			
		} else return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	}
	
	
	//아파트 코드로 거래내역 조회
	@GetMapping("/deal/{aptCode}")
	public ResponseEntity<?> searchHouseDealByAptCode(@PathVariable String aptCode){
		List<HouseDeal> houseDealList = houseService.searchHouseDealByAptCode(aptCode);
		return new ResponseEntity<List<HouseDeal>>(houseDealList,HttpStatus.OK);
	}
	
	
	// status 별 조회
	
	@GetMapping("/status/{aptCode}")
	public ResponseEntity<?> searchStatusLists(@PathVariable String aptCode){
		Map<String,List<Status>> statusMap = houseService.searchAllStatus(aptCode);
		return new ResponseEntity<Map<String,List<Status>>>(statusMap,HttpStatus.OK);
	}
	
	/**
	 * 전체 거래 내역 조회
	 * @return
	 */
	@GetMapping("/deal/list")
	// 해당 메서드에 대해 Swagger ui 에서 표시할 설명 , 리턴 정보
	/** @A : ApiOperation 어노테이션으로 swagger에서 표시할 설명과 리턴 타입 클래스를 입력해준다. */
	@ApiOperation(value = "전체 부동산 거래내역 불러오기", response = HouseDeal.class)
	public ResponseEntity<?> houseDealList(){
		System.out.println("searchAll housedeal ");
		List<HouseDeal> houseDealList = houseService.list();
		return new ResponseEntity<List<HouseDeal>>(houseDealList,HttpStatus.OK);
	}
	
	@GetMapping("/deal/view")
	@ApiOperation(value = "핫한 지역 top3 불러오기", response = HouseDeal.class)
	public ResponseEntity<?> houseBestView(){
		System.out.println("Houseview");
		List<HouseDeal> houseViewList = houseService.view();
		return new ResponseEntity<List<HouseDeal>>(houseViewList,HttpStatus.OK);
	}
	
	@PostMapping("/deal/list")
	@ApiOperation(value = "키워드로 부동산 거래내역을 조회", response = HouseDeal.class)
	public ResponseEntity<?> searchHouseDeals(String key, String word, String sido, String gugun, String dong, String k) {
		System.out.println("POST searchHouseDeals");
		System.out.println("key : "+key+" word : "+word+" dongCode : "+dong);
		int K = (k=="")?0:Integer.parseInt(k);
		
		if(key==null) return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		if(key.equals("searchbyarea")) {
			System.out.println("searchByArea");
			Map<String,List<HouseDeal>> res = houseService.searchHouseDealByArea(sido, gugun, dong, K);
			
			
			return new ResponseEntity<Map<String,List<HouseDeal>>>(res,HttpStatus.OK);
		} else if(key.equals("searchbyname")){
			System.out.println("searchByName"+" word:"+word);
			return new ResponseEntity<Map<String,List<HouseDeal>>>(houseService.searchHouseDealByName(word,K),HttpStatus.OK);			
		} else return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	}
	
}
