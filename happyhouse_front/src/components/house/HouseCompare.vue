<template>
  <div class="house-compare-container">
    <div></div>

    <div class="compare-layout">
      <div class="compare-module">
        <button class="red-select-btn" @click="setSelectingHouseNum(2)">
          아파트 선택
        </button>
        <house-detail
          :compareMode="true"
          :houseInfo="houseInfo2"
          :housedealList="housedealList2"
          :transportationList="transportationList2"
          :cultureList="cultureList2"
          :lifeList="lifeList2"
          :safetyList="safetyList2"
          :educationList="educationList2"
          :environmentList="environmentList2"
        />
      </div>
      <div class="compare-module">
        <div class="compare-title">
          <span class="red-part">
            {{ houseInfo2 ? houseInfo2.aptName : "" }}</span
          >
          &nbsp;VS&nbsp;
          <span class="blue-part">
            {{ houseInfo3 ? houseInfo3.aptName : "" }}</span
          >
        </div>
        <house-compare-detail />
      </div>
      <div class="compare-module">
        <button class="blue-select-btn" @click="setSelectingHouseNum(3)">
          아파트 선택
        </button>
        <house-detail
          :compareMode="true"
          :houseInfo="houseInfo3"
          :housedealList="housedealList3"
          :transportationList="transportationList3"
          :cultureList="cultureList3"
          :lifeList="lifeList3"
          :safetyList="safetyList3"
          :educationList="educationList3"
          :environmentList="environmentList3"
        />
      </div>
    </div>

    <div v-if="modalOn">
      <div class="select-map-modal-background">
        <div class="select-map-modal-container">
          <house-compare-search
            :selectingHouseNum="selectingHouseNum"
            @closeModal="closeModal"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import HouseCompareSearch from "@/components/house/HouseCompareSearch.vue";
import HouseDetail from "@/components/house/HouseDetail.vue";
import HouseCompareDetail from "@/components/house/HouseCompareDetail.vue";
export default {
  components: { HouseCompareSearch, HouseDetail, HouseCompareDetail },
  data() {
    return {
      modalOn: false,
      selectingHouseNum: 2,
    };
  },
  methods: {
    setSelectingHouseNum(num) {
      this.selectingHouseNum = num;
      this.openModal();
    },
    openModal() {
      this.modalOn = true;
    },
    closeModal() {
      this.modalOn = false;
    },
  },
  computed: {
    ...mapState("houseStore", [
      "houseInfo2",
      "housedealList2",
      "transportationList2",
      "cultureList2",
      "lifeList2",
      "safetyList2",
      "environmentList2",
      "educationList2",
      "houseInfo3",
      "housedealList3",
      "transportationList3",
      "cultureList3",
      "lifeList3",
      "safetyList3",
      "environmentList3",
      "educationList3",
    ]),
  },
};
</script>

<style>
.house-compare-container {
  width: 100%;
  height: 100%;
  padding: 2rem;
}
.select-map-modal-background {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;

  z-index: 2000;
  /* width: 100vw;
  height: 100vh; */
  background: rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.select-map-modal-container {
  z-index: 2000;
  width: 70%;
}

.compare-layout {
  width: 90%;
  height: 100%;
  display: flex;
  flex-basis: 1;
  justify-content: space-between;
}
.compare-title {
  font-weight: bold;
  font-size: 1.3rem;

  padding: 1rem;
}
.compare-module {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.red-select-btn {
  width: 100%;
  padding: 1rem;
  color: white;
  font-size: 1.2rem;
  background: #a81f1f;
  background: rgba(160, 8, 8, 0.904);
  border: 3px solid #c83f3f;
  border-radius: 5px;
}
.red-select-btn:hover {
  cursor: pointer;
  transition: all 500ms;
  background: rgba(182, 21, 21, 0.904);
}
.blue-select-btn {
  width: 100%;
  padding: 1rem;

  color: white;
  font-size: 1.2rem;
  background: #0e0c68c2;
  background: rgba(14, 16, 116, 0.897);
  border: 3px solid #313fc8;

  border-radius: 5px;
}
.blue-select-btn:hover {
  cursor: pointer;
  transition: all 500ms;
  background: rgba(32, 35, 185, 0.897);
}
</style>
