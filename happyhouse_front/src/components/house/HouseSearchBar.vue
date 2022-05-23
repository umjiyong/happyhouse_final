<template>
  <div>
    <!-- <b-col class="sm-3">
      <b-form-input
        v-model.trim="dongCode"
        placeholder="동코드 입력...(예 : 11110)"
        @keypress.enter="sendKeyword"
      ></b-form-input>
    </b-col>
    <b-col class="sm-3" align="left">
      <b-button variant="outline-primary" @click="sendKeyword">검색</b-button>
    </b-col>
    <b-col class="sm-3">
      <b-form-select
        v-model="sidoCode"
        :options="sidos"
        @change="gugunList"
      ></b-form-select>
    </b-col>
    <b-col class="sm-3">
      <b-form-select
        v-model="gugunCode"
        :options="guguns"
        @change="searchApt"
      ></b-form-select>
    </b-col> -->

    <div>{{ sidoCode }}</div>
    <div class="md-layout md-gutter">
      <div class="md-layout-item">
        <md-field>
          <label for="movie">Movie</label>
          <select v-model="sidoCode" name="movie" id="movie">
            <option
              v-for="sido in sidos"
              :value="sido.value"
              :key="sido.value"
              >{{ sido.text }}</option
            >
          </select>
        </md-field>
      </div>

      <!-- <div class="md-layout-item">
        <md-field>
          <md-select
            v-model="country"
            name="country"
            id="country"
            placeholder="Country"
          >
            <md-option value="australia">Australia</md-option>
            <md-option value="brazil">Brazil</md-option>
            <md-option value="japan">Japan</md-option>
            <md-option value="united-states">United States</md-option>
          </md-select>
        </md-field>
      </div> -->

      <!-- <div class="md-layout-item">
        <md-field>
          <label for="font">Font</label>
          <md-select v-model="font" name="font" id="font">
            <md-option value="arial">Arial</md-option>
            <md-option value="calibri">Calibri</md-option>
            <md-option value="cambria">Cambria</md-option>
            <md-option value="comic-sans">Comic Sans</md-option>
            <md-option value="consolas">Consolas</md-option>
            <md-option value="courier">Courier</md-option>
            <md-option value="droid-sans">Droid Sans</md-option>
            <md-option value="georgia">Georgia</md-option>
            <md-option value="helvetica">Helvetica</md-option>
            <md-option value="impact">Impact</md-option>
            <md-option value="roboto">Roboto</md-option>
            <md-option value="segoe-ui">Segoe UI</md-option>
            <md-option value="times-new-roman">Times New Roman</md-option>
            <md-option value="ubuntu">Ubuntu</md-option>
            <md-option value="verdana">Verdana</md-option>
          </md-select>
        </md-field>
      </div> -->
    </div>

    <md-button class="md-primary md-raised" @click="movie = 'pulp-fiction'"
      >Set Pulp Fiction</md-button
    >
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";
import { areaList } from "@/api/house.js";

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
      sidoCode: "default",
      gugunCode: null,
      sidos: [{ value: null, text: "선택하세요" }],
      guguns: [{ value: null, text: "선택하세요" }],
      dongs: [{ value: "all", text: "전체동" }],
    };
  },
  computed: {
    // ...mapState(houseStore, ["sidos", "guguns", "houses"]),
    // sidos() {
    //   return this.$store.state.sidos;
    // },
  },
  created() {
    // this.$store.dispatch("getSido");
    // this.sidoList();
    this.CLEAR_SIDO_LIST();
    // this.$store.dispatch("getArea");
    console.log("GETAREA before");
    this.getArea({ areaUnit: "sido", areaName: "" });
  },
  methods: {
    ...mapActions(houseStore, ["getArea"]),
    ...mapMutations(houseStore, ["CLEAR_SIDO_LIST", "CLEAR_GUGUN_LIST"]),
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
