<template>
  <div class="view-container">
    <house-search-bar @closeDetail="closeDetail" />
    <div class="flex-row">
      <house-list @openDetail="openDetail" v-show="!detailOn" />
      <house-detail
        @closeDetail="closeDetail"
        v-show="detailOn"
        :houseInfo="houseInfo1"
        :housedealList="housedealList"
        :transportationList="transportationList"
        :cultureList="cultureList"
        :lifeList="lifeList"
        :safetyList="safetyList"
        :educationList="educationList"
        :environmentList="environmentList"
      />
      <kakao-map
        @openDetail="openDetail"
        :detailOn="detailOn"
        :mapSize="'searchSize'"
      />
    </div>
    <!--modal-->
    <!-- <house-detail v-if="modalOn" @closeDetail="closeDetail" /> -->
  </div>
</template>

<script>
import { mapState } from "vuex";
import HouseSearchBar from "@/components/house/HouseSearchBar.vue";
import HouseList from "@/components/house/HouseList.vue";
import KakaoMap from "@/components/house/KakaoMap.vue";
import HouseDetail from "@/components/house/HouseDetail.vue";
export default {
  data() {
    return {
      detailOn: false
    };
  },
  components: { HouseSearchBar, HouseList, KakaoMap, HouseDetail },
  computed: {
    ...mapState("houseStore", [
      "houseInfo1",
      "housedealList",
      "transportationList",
      "cultureList",
      "lifeList",
      "safetyList",
      "environmentList",
      "educationList",
    ]),
  },
  methods: {
    openDetail() {
      this.detailOn = true;
    },
    closeDetail() {
      this.detailOn = false;
    }
  }
};
</script>

<style></style>
