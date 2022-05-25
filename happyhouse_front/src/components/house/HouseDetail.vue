<template>
  <div class="house-detail-container">
    <span class="hover-pointer x-box" @click="closeDetail">
      <md-icon>close</md-icon>
    </span>
    <div v-if="houseInfo1" class="house-detail-box">
      <div>
        <p class="bold-display">{{ houseInfo1.aptName }}</p>
      </div>
      <bar-chart :styles="myStyles" :chart-data="chartDataComputed" />

      <!-- <div>transportation : {{ transportationList.length }}</div>
      <div>culture : {{ cultureList.length }}</div>
      <div>education : {{ educationList.length }}</div>
      <div>environment : {{ environmentList.length }}</div>
      <div>life : {{ lifeList.length }}</div>
      <div>safety : {{ safetyList.length }}</div> -->
      <house-deal-list />
    </div>
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";
import HouseDealList from "@/components/house/HouseDealList.vue";
import BarChart from "@/components/house/charts/BarChart.vue";
export default {
  data() {
    return {
      myStyles: {
        width: "300px",
        height: "300px",
      },
      chartData: {
        labels: [
          "TransPortation",
          "Education",
          "Life",
          "Environment",
          "Safety",
          "Culture",
        ],
        datasets: [{ data: [0, 0, 0, 0, 0, 0] }],
      },
    };
  },
  components: {
    HouseDealList,
    BarChart,
  },
  computed: {
    ...mapState("houseStore", [
      "houseInfo1",
      "transportationList",
      "cultureList",
      "educationList",
      "environmentList",
      "lifeList",
      "safetyList",
    ]),
    chartDataComputed() {
      const res = {
        labels: [
          "TransPortation",
          "Education",
          "Life",
          "Environment",
          "Safety",
          "Culture",
        ],
        datasets: [
          {
            data: [
              this.transportationList.length,
              this.educationList.length,
              this.lifeList.length,
              this.safetyList.length,
              this.environmentList.length,
              this.cultureList.length,
            ],
          },
        ],
      };
      return res;
    },
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
  position: relative;
  max-height: 80vh;
  overflow-y: scroll;
}
.house-detail-box {
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 2rem;
}
.x-box {
  position: absolute;
  top: 2px;
  right: 2px;
}
</style>
