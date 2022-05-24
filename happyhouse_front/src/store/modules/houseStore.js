import {
  areaList,
  houseList,
  searchHouseDealByAptCode,
  searchStatus
} from "@/api/house.js";

const houseStore = {
  namespaced: true,
  state: {
    sidos: [{ value: null, text: "선택하세요" }],
    guguns: [{ value: null, text: "선택하세요" }],
    dongs: [{ value: null, text: "선택하세요" }],
    sidoCode: "",
    gugunCode: "",
    dongCode: "all",
    houseList: [],
    houseInfo1: {},
    housedealList: [],
    // status List
    transportationList: [],
    cultureList: [],
    educationList: [],
    environmentList: [],
    lifeList: [],
    safetyList: []
  },

  getters: {},

  mutations: {
    // Area
    SET_SIDO_LIST: (state, sidos) => {
      sidos.forEach(sido => {
        state.sidos.push({ value: sido.sidoCode, text: sido.sidoName });
      });
    },
    SET_GUGUN_LIST: (state, guguns) => {
      guguns.forEach(gugun => {
        state.guguns.push({ value: gugun.gugunCode, text: gugun.gugunName });
      });
    },
    SET_DONG_LIST: (state, dongs) => {
      dongs.forEach(dong => {
        state.dongs.push({ value: dong.dongCode, text: dong.dongName });
      });
    },
    CLEAR_SIDO_LIST: state => {
      state.sidos = [{ value: null, text: "선택하세요" }];
    },
    CLEAR_GUGUN_LIST: state => {
      state.guguns = [{ value: null, text: "선택하세요" }];
    },
    CLEAR_DONG_LIST: state => {
      state.dongs = [{ value: "all", text: "전체동" }];
    },
    SET_SIDOCODE: (state, sidoCode) => {
      state.sidoCode = sidoCode;
    },
    SET_GUGUNCODE: (state, gugunCode) => {
      state.gugunCode = gugunCode;
    },
    SET_DONGCODE: (state, dongCode) => {
      state.dongCode = dongCode;
    },
    CLEAR_SIDOCODE: state => {
      state.sidoCode = "";
    },
    CLEAR_GUGUNCODE: state => {
      state.gugunCode = "";
    },
    CLEAR_DONGCODE: state => {
      state.dongCode = "all";
    },
    // HouseInfo
    SET_HOUSE_LIST: (state, houseList) => {
      state.houseList = houseList;
    },
    CLEAR_HOUSE_LIST: state => {
      state.houseList = [];
    },
    SET_HOUSE_INFO1: (state, houseInfo) => {
      console.log("set House Info 1 -- " + houseInfo);
      for (const key in houseInfo) {
        console.log(key + " " + houseInfo[key]);
      }
      state.houseInfo1 = houseInfo;
    },
    // HouseDeal
    SET_HOUSEDEAL_LIST: (state, housedealList) => {
      state.housedealList = housedealList;
    },
    CLEAR_HOUSEDEAL_LIST: state => {
      state.housedealList = [];
    },
    // Status
    SET_TRANSPORTATION_LIST: (state, transportationList) => {
      state.transportationList = transportationList;
    },
    CLEAR_TRANSPORTATION_LIST: state => {
      state.transportationList = [];
    },
    SET_CULTURE_LIST: (state, cultureList) => {
      state.cultureList = cultureList;
    },
    CLEAR_CULTURE_LIST: state => {
      state.cultureList = [];
    },
    SET_EDUCATION_LIST: (state, educationList) => {
      state.educationList = educationList;
    },
    CLEAR_EDUCATION_LIST: state => {
      state.educationList = [];
    },
    SET_ENVIRONMENT_LIST: (state, environmentList) => {
      state.environmentList = environmentList;
    },
    CLEAR_ENVIRONMENT_LIST: state => {
      state.environmentList = [];
    },
    SET_LIFE_LIST: (state, lifeList) => {
      state.lifeList = lifeList;
    },
    CLEAR_LIFE_LIST: state => {
      state.lifeList = [];
    },
    SET_SAFETY_LIST: (state, safetyList) => {
      state.safetyList = safetyList;
    },
    CLEAR_SAFETY_LIST: state => {
      state.safetyList = [];
    }
  },

  actions: {
    getArea: ({ commit }, { areaUnit, areaCode }) => {
      console.log("ACTION getArea ");
      const params = {
        areaUnit,
        areaCode
      };
      areaList(params, ({ data }) => {
        console.log(params);
        if (areaUnit === "sido") {
          console.log(data);
          console.log("before set sido list");
          commit("SET_SIDO_LIST", data);
        } else if (areaUnit === "gugun") {
          commit("SET_GUGUN_LIST", data);
        } else if (areaUnit === "dong") {
          commit("SET_DONG_LIST", data);
        }
      });
    },
    searchHouseList: ({ commit }, params) => {
      houseList(params, ({ data }) => {
        console.log(data);
        commit("SET_HOUSE_LIST", data);
      });
    },
    searchHouseDealByAptCode: ({ commit }, aptCode) => {
      console.log("search HouseDeal By Apt Code !! -- " + aptCode);
      searchHouseDealByAptCode(aptCode, ({ data }) => {
        commit("SET_HOUSEDEAL_LIST", data);
      });
    },
    // status
    searchStatusByAptCode: ({ commit }, aptCode) => {
      searchStatus(aptCode, ({ data }) => {
        console.log("transportation List ", data["transportation"]);
        console.log("education List ", data["education"]);
        console.log("environment List ", data["environment"]);
        console.log("life List ", data["life"]);
        console.log("safety List ", data["safety"]);
        console.log("culture List ", data["culture"]);
        commit("SET_TRANSPORTATION_LIST", data["transportation"]);
        commit("SET_EDUCATION_LIST", data["education"]);
        commit("SET_LIFE_LIST", data["life"]);
        commit("SET_SAFETY_LIST", data["safety"]);
        commit("SET_ENVIRONMENT_LIST", data["environment"]);
        commit("SET_CULTURE_LIST", data["culture"]);
      });
    }
  }
};

export default houseStore;
