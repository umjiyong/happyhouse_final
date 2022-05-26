<template>
  <div class="compare-search-container">
    <button @click="closeThisModal" class="close-compare-map-btn">
      <md-icon>close</md-icon>
    </button>
    <house-search-bar @closeDetail="closeDetail" />
    <div class="flex-row">
      <house-list
        @openDetail="openDetail"
        v-show="!detailOn"
        :boxSize="'compareSize'"
      />

      <house-detail
        @closeDetail="closeDetail"
        v-show="detailOn"
        :compareMode="true"
        :selectingHouseNum="selectingHouseNum"
        :boxSize="'compareSize'"
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
        :mapSize="'compareSize'"
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
      detailOn: false,
    };
  },
  props: {
    selectingHouseNum: {
      type: Number,
      default: 2,
    },
  },
  components: { HouseSearchBar, HouseList, KakaoMap, HouseDetail },
  methods: {
    openDetail() {
      this.detailOn = true;
    },
    closeDetail() {
      this.detailOn = false;
    },
    closeThisModal() {
      this.$emit("closeModal");
    },
  },
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
};
</script>

<style>
.compare-search-container {
  position: relative;
}
.close-compare-map-btn {
  font-size: 1.5rem;
  position: absolute;
  top: 0;
  right: 0;
  background: transparent;
  border: none;
}
.close-compare-map-btn:hover {
  cursor: pointer;
}
.close-compare-map-btn i {
  color: white !important;
  font-size: 2rem !important;
}
</style>
