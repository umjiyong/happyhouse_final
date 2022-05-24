package com.ssafy.happyhouse.model.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.HouseDao;
import com.ssafy.happyhouse.model.dto.AreaCode;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.Status;

@Service
public class HouseServiceImp implements HouseService {

	private HouseDao houseDao;

	@Autowired
	public HouseServiceImp(HouseDao houseDao) {
		this.houseDao = houseDao;
	}

	@Override
	public List<AreaCode> searchAllAreaCode(String areaUnit, String areaCode) {
		if (areaUnit == null) {
			System.out.println("오류 Area Unit Null ");
		} else if (areaUnit.equals("sido")) {
			return houseDao.searchAllSido();
		} else if (areaUnit.equals("gugun")) {
			return houseDao.searchAllGugun(areaCode.substring(0, 2));
		} else if (areaUnit.equals("dong")) {
			return houseDao.searchAllDong(areaCode.substring(0, 5));
		}
		return null;
	}

	@Override
	public List<HouseInfo> searchHouseInfoByArea(String gugunCode, String dongCode) {
		if (dongCode == null) {
			System.out.println("오류 dongCode Null");
		} else if (dongCode.equals("all")) {
			System.out.println("구내 아파트 검색");
			return houseDao.searchHouseInfoByArea(gugunCode.substring(0, 5));
		} else {
			System.out.println("동내 아파트 검색");
			return houseDao.searchHouseInfoByArea(dongCode);
		}
		return null;
	}

	@Override
	public List<HouseInfo> searchHouseInfoByName(String word) {
		return houseDao.searchHouseInfoByName(word);
	}

	// status

	@Override
	public Map<String, List<Status>> searchAllStatus(String aptCode) {
		Map<String, List<Status>> statusMap = new HashMap<String, List<Status>>();

		final Status aptPos = houseDao.searchAptPos(aptCode);
		Map<String, Double> pos = new HashMap<String, Double>() {
			{
				put("aptLat", aptPos.getLat());
				put("aptLng", aptPos.getLng());
			}
		};
		
		List<Status> transportationList = houseDao.searchAllTransportation(pos);
		List<Status> cultureList = houseDao.searchAllTransportation(pos);
		List<Status> educationList = houseDao.searchAllEducation(pos);
		List<Status> environmentList = houseDao.searchAllEnvironment(pos);
		List<Status> lifeList = houseDao.searchAllLife(pos);
		List<Status> safetyList = houseDao.searchAllSafety(pos);

		statusMap.put("transportation", transportationList);
		statusMap.put("culture", cultureList);
		statusMap.put("education", educationList);
		statusMap.put("environment", environmentList);
		statusMap.put("life", lifeList);
		statusMap.put("safety", safetyList);
		
		return statusMap;
	}

	// deal

	@Override
	public List<HouseDeal> searchHouseDealByAptCode(String aptCode) {
		return houseDao.searchHouseDealByAptCode(aptCode);
	}

	@Override
	public List<HouseDeal> list() {
		// TODO Auto-generated method stub
		System.out.println(houseDao.searchAll());
		return houseDao.searchAll();
	}

	@Override
	public Map<String, List<HouseDeal>> searchHouseDealByArea(String sidoCode, String gugunCode, String dongCode,
			int K) {
		// TODO Auto-generated method stub
		if (dongCode.equals("all")) {
			System.out.println("searchHouseDealByGugun");
			Map<String, String> sidoGugun = new HashMap<String, String>();
			System.out.println(sidoCode + " - " + gugunCode);
			sidoGugun.put("sidoCode", sidoCode);
			sidoGugun.put("gugunCode", gugunCode);
			List<HouseDeal> housedealList = houseDao.searchHouseDealByGugun(sidoGugun);

			Map<String, List<HouseDeal>> map = new HashMap<String, List<HouseDeal>>();
			map.put("searched", housedealList);
			List<HouseDeal> bestComb = knapsack(housedealList, K);
			map.put("bestcomb", bestComb);

			return map;
		} else {
			houseDao.countView(dongCode);
			List<HouseDeal> housedealList = houseDao.searchHouseDealByDong(dongCode);

			Map<String, List<HouseDeal>> map = new HashMap<String, List<HouseDeal>>();
			map.put("searched", housedealList);
			List<HouseDeal> bestComb = knapsack(housedealList, K);
			map.put("bestcomb", bestComb);

			return map;
		}
	}

	@Override
	public Map<String, List<HouseDeal>> searchHouseDealByName(String aptName, int K) {
		// TODO Auto-generated method stub
		System.out.println("searchHouseDealByName:<" + aptName + ">");
		List<HouseDeal> housedealList = houseDao.searchHouseDealByName(aptName);

		Map<String, List<HouseDeal>> map = new HashMap<String, List<HouseDeal>>();
		map.put("searched", housedealList);
		List<HouseDeal> bestComb = knapsack(housedealList, K);
		map.put("bestcomb", bestComb);

		return map;
	}

	// 배낭 DP 알고리즘 적용 (주어진 비용 안에서 최고 가치를 가지는 아파트 조합)
	static public List<HouseDeal> knapsack(List<HouseDeal> housedealListOrigin, int K) {

		System.out.println(" KnapSack 시작!!");
		System.out.println(housedealListOrigin);
		System.out.println("K : " + K);

		// 같은 아파트 이름 중복제거
		ArrayList<HouseDeal> housedealList = new ArrayList<HouseDeal>();
		Map<Integer, Boolean> housedealFilter = new HashMap<Integer, Boolean>();
		for (HouseDeal hd : housedealListOrigin) {
			if (!housedealFilter.containsKey(hd.getAptCode())) {
				housedealList.add(hd);
				housedealFilter.put(hd.getAptCode(), true);
			}
		}

		System.out.println("중복 제거 리스트 : ");
		for (HouseDeal hd : housedealList) {
			System.out.println(hd);
		}
		System.out.println("-------------");

		// 가치 (건축년도, 넓이로 계산)
		double value[] = new double[housedealList.size() + 1];
		int cost[] = new int[housedealList.size() + 1];

		for (int i = 1; i <= housedealList.size(); i++) {
			HouseDeal current = housedealList.get(i - 1);
			double area = Double.parseDouble(current.getArea());
			int buildYear = current.getBuildYear();
			value[i] = area * Math.pow(0.95, 2022 - buildYear);
			cost[i] = Integer.parseInt(String.join("", current.getDealAmount().split(",")).trim());
		}

		System.out.println("values:" + Arrays.toString(value));
		// 배낭

		int N = housedealList.size();
		double dp[][] = new double[N + 1][K + 1];
		for (int i = 1; i <= N; i++) {
			for (int k = 0; k <= K; k++) {
				if (k - cost[i] >= 0)
					dp[i][k] = Math.max(dp[i - 1][k], dp[i - 1][k - cost[i]] + value[i]);
				else
					dp[i][k] = dp[i - 1][k];
			}
		}

		System.out.println("최대 가치 : " + dp[N][K]);

		ArrayList<Integer> combs = new ArrayList<Integer>();

		int r = N;
		int k = K;
		while (r > 0) {
			if (dp[r][k] != dp[r - 1][k]) {
				combs.add(r - 1);
				k -= cost[r];
			}
			r--;
		}

		// housedealList 접근할 때 i-1로 접근해주기

		System.out.println("사용된 아파트 : " + combs.size());
		List<HouseDeal> res = new ArrayList<HouseDeal>();
		for (int num : combs) {
			System.out.println(housedealList.get(num));
			res.add(housedealList.get(num));
		}

		// 사용된 Housedeals
		return res;
	}

	// 조회수 내림차순 정렬 top3 뽑기
	@Override
	public List<HouseDeal> view() {

		List<HouseDeal> list = houseDao.searchView();
		HouseDeal[] HouseDealArray = new HouseDeal[list.size()];
		int idx = 0;

		for (HouseDeal a : list) {
			HouseDealArray[idx++] = a;
		}
		Arrays.sort(HouseDealArray);

		List<HouseDeal> viewlist = new ArrayList<HouseDeal>();
		viewlist.add(HouseDealArray[0]);
		viewlist.add(HouseDealArray[1]);
		viewlist.add(HouseDealArray[2]);

		System.out.println(viewlist);
		return viewlist;
	}

}
