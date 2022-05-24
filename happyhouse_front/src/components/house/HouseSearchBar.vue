<template>
  <div>
    <select v-model="key">
      <option value="searchbyarea" selected>지역으로 찾기</option>
      <option value="searchbyname">이름으로 찾기</option>
    </select>
    <div></div>
    <div class="flex-row gap-item">
      <div class="flex-row gap-item" v-if="key === 'searchbyname'">
        <input type="text" v-model="word" placeholder="아파트 이름 입력" />
      </div>
      <div class="flex-row gap-item" v-if="key === 'searchbyarea'">
        <div>
          <label for="sido">시도</label>
          <select v-model="sido" name="sido" id="sido" @change="changeSido">
            <option v-for="sido in sidos" :value="sido.value" :key="sido.value">
              {{ sido.text }}
            </option>
          </select>
        </div>
        <div>
          <label for="gugun">구군</label>
          <select v-model="gugun" name="gugun" id="gugun" @change="changeGugun">
            <option
              v-for="gugun in guguns"
              :value="gugun.value"
              :key="gugun.value"
            >
              {{ gugun.text }}
            </option>
          </select>
        </div>
        <div>
          <label for="dong">동</label>
          <select v-model="dong" name="dong" id="dong" @change="changeDong">
            <option v-for="dong in dongs" :value="dong.value" :key="dong.value">
              {{ dong.text }}
            </option>
          </select>
        </div>
      </div>
    </div>
    <button @click="searchHouseList({ key, word, gugunCode, dongCode })">
      검색
    </button>
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";

/*
  namespaced: true를 사용했기 때문에 선언해줍니다.
  index.js 에서 modules 객체의 '키' 이름입니다.

  modules: {
    키: 값
    memberStore: memberStore,
    houseStore: houseStore
  }  
*/
const houseStore = "houseStore";

export default {
  name: "HouseSearchBar",
  data() {
    return {
      sido: "",
      gugun: "",
      dong: "",
      key: "searchbyarea",
      word: "",
    };
  },
  computed: {
    ...mapState(houseStore, [
      "sidos",
      "guguns",
      "dongs",
      "sidoCode",
      "gugunCode",
      "dongCode",
    ]),
  },
  created() {
    // this.$store.dispatch("getSido");
    // this.sidoList();
    this.CLEAR_SIDO_LIST();
    this.CLEAR_GUGUN_LIST();
    this.CLEAR_DONG_LIST();
    // this.$store.dispatch("getArea");
    console.log("before getArea");
    this.getArea({ areaUnit: "sido", areaCode: "" });
  },
  methods: {
    ...mapActions(houseStore, ["getArea", "searchHouseList"]),
    ...mapMutations(houseStore, [
      "CLEAR_SIDO_LIST",
      "CLEAR_GUGUN_LIST",
      "CLEAR_DONG_LIST",
      "CLEAR_SIDOCODE",
      "CLEAR_GUGUNCODE",
      "CLEAR_DONGCODE",

      "SET_SIDOCODE",
      "SET_GUGUNCODE",
      "SET_DONGCODE",
    ]),
    changeSido() {
      this.CLEAR_GUGUN_LIST();
      this.CLEAR_DONG_LIST();
      this.CLEAR_GUGUNCODE();
      this.CLEAR_DONGCODE();
      this.SET_SIDOCODE(this.sido);
      this.getArea({ areaUnit: "gugun", areaCode: this.sido });
    },
    changeGugun() {
      this.CLEAR_DONG_LIST();
      this.CLEAR_DONGCODE();
      this.SET_GUGUNCODE(this.gugun);
      this.getArea({ areaUnit: "dong", areaCode: this.gugun });
    },
    changeDong() {
      this.SET_DONGCODE(this.dong);
    },
    // // sidoList() {
    // //   this.getSido();
    // // },
    // gugunList() {
    //   console.log(this.sidoCode);
    //   this.CLEAR_GUGUN_LIST();
    //   this.gugunCode = null;
    //   if (this.sidoCode) this.getGugun(this.sidoCode);
    // },
    // searchApt() {
    //   if (this.gugunCode) this.getHouseList(this.gugunCode);
    // },
  },
};
</script>

<style></style>
