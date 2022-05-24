<template>
  <div class="house-detail-container">
    <button @click="closeDetail">X</button>
    <div v-if="houseInfo1">
      <div>
        <h5>Hello Detail</h5>
        <h4>{{ houseInfo1.aptName }}</h4>
      </div>
      <div>transportation : {{ transportationList.length }}</div>
      <div>culture : {{ cultureList.length }}</div>
      <div>education : {{ educationList.length }}</div>
      <div>environment : {{ environmentList.length }}</div>
      <div>life : {{ lifeList.length }}</div>
      <div>safety : {{ safetyList.length }}</div>
      <div>거래내역 {{ housedealList.length }}</div>
      <div v-if="housedealList.length">
        <div v-for="housedeal in housedealList" :key="housedeal.no">
          {{ housedeal.dealAmount }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";
export default {
  computed: {
    ...mapState("houseStore", [
      "houseInfo1",
      "housedealList",
      "transportationList",
      "cultureList",
      "educationList",
      "environmentList",
      "lifeList",
      "safetyList",
    ]),
  },
  watch: {
    houseInfo1(val) {
      console.log("houseInfo updated!!");
      this.searchHouseDealByAptCode(val.aptCode);
      this.searchStatusByAptCode(val.aptCode);
    },
  },
  methods: {
    ...mapMutations("houseStore", ["CLEAR_HOUSEDEAL_LIST"]),
    ...mapActions("houseStore", [
      "searchHouseDealByAptCode",
      "searchStatusByAptCode",
    ]),
    closeDetail() {
      this.CLEAR_HOUSEDEAL_LIST();
      this.$emit("closeDetail");
    },
  },
};
</script>

<style>
.house-detail-container {
  flex-grow: 2;
  transition: all 500ms ease 100ms;
}
</style>
