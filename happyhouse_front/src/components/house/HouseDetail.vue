<template>
  <div class="house-detail-container">
    <span class="hover-pointer x-box" @click="closeDetail">
      <md-icon>close</md-icon>
    </span>
    <div class="house-detail-scroll-box">
      <div v-if="houseInfo1" class="house-detail-box">
        <div>
          <p class="bold-display">{{ houseInfo1.aptName }}</p>
        </div>
        <br />
        <br />
        <p class="bold-display">주변 정보</p>
        <br />
        <radar-chart :styles="myStyles" :chart-data="statusDataComputed" />

        <table class="status-table">
          <tr>
            <td>역</td>
            <td>학교</td>
            <td>주차장</td>
            <td>공원</td>
            <td>CCTV</td>
            <td>영화관</td>
          </tr>

          <tr>
            <td>{{ transportationList.length }}</td>
            <td>{{ educationList.length }}</td>
            <td>{{ lifeList.length }}</td>
            <td>{{ environmentList.length }}</td>
            <td>{{ safetyList.length }}</td>
            <td>{{ cultureList.length }}</td>
          </tr>
          <tr>
            <td>
              <button @click="pinStatus('transportation')">
                <md-icon>map</md-icon>
              </button>
            </td>
            <td>
              <button @click="pinStatus('education')">
                <md-icon>map</md-icon>
              </button>
            </td>
            <td>
              <button @click="pinStatus('life')">
                <md-icon>map</md-icon>
              </button>
            </td>
            <td>
              <button @click="pinStatus('environment')">
                <md-icon>map</md-icon>
              </button>
            </td>
            <td>
              <button @click="pinStatus('safety')">
                <md-icon>map</md-icon>
              </button>
            </td>
            <td>
              <button @click="pinStatus('culture')">
                <md-icon>map</md-icon>
              </button>
            </td>
          </tr>
        </table>

        <!-- <div>transportation : {{ transportationList.length }}</div>
      <div>culture : {{ cultureList.length }}</div>
      <div>education : {{ educationList.length }}</div>
      <div>environment : {{ environmentList.length }}</div>
      <div>life : {{ lifeList.length }}</div>
      <div>safety : {{ safetyList.length }}</div> -->
        <br /><br />
        <hr />
        <house-deal-list />
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";
import HouseDealList from "@/components/house/HouseDealList.vue";
// import BarChart from "@/components/house/charts/BarChart.vue";
import RadarChart from "@/components/house/charts/RadarChart.vue";
export default {
  data() {
    return {
      myStyles: {
        width: "300px",
        height: "300px"
      }
    };
  },
  components: {
    HouseDealList,
    RadarChart
  },
  computed: {
    ...mapState("houseStore", [
      "houseInfo1",
      "transportationList",
      "cultureList",
      "educationList",
      "environmentList",
      "lifeList",
      "safetyList"
    ]),
    statusDataComputed() {
      const res = {
        labels: ["교통", "교육", "생활", "환경", "안전", "문화"],
        datasets: [
          {
            label: "주변시설",
            fill: true,
            backgroundColor: "#39a839",
            borderColor: "#59d859",
            // hoverBackgroundColor: "#39a839",
            // hoverBorderColor: "#39a839",
            pointBackgroundColor: "#39a839",
            pointBorderColor: "#fff",
            // pointHoverBackgroundColor: "#39a839",
            // pointHoverBorderColor: "#39a839",
            data: [
              this.transportationList.length,
              this.educationList.length / 4,
              this.lifeList.length / 2,
              this.environmentList.length / 2,
              this.safetyList.length / 30,
              this.cultureList.length
            ]
          }
        ]
      };
      return res;
    }
  },
  watch: {
    houseInfo1(val) {
      console.log("houseInfo updated!!");
      this.searchHouseDealByAptCode(val.aptCode);
      this.searchStatusByAptCode(val.aptCode);
    }
  },

  methods: {
    ...mapMutations("houseStore", [
      "CLEAR_HOUSEDEAL_LIST",
      "SET_SHOW_STATUS_POSITION"
    ]),
    ...mapActions("houseStore", [
      "searchHouseDealByAptCode",
      "searchStatusByAptCode"
    ]),
    closeDetail() {
      this.CLEAR_HOUSEDEAL_LIST();
      this.$emit("closeDetail");
    },
    pinStatus(status) {
      this.SET_SHOW_STATUS_POSITION(status);
    }
  }
};
</script>

<style>
.house-detail-container {
  flex-grow: 0.3;
  position: relative;
}
.house-detail-scroll-box {
  width: 100%;
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
  top: 8px;
  right: 20px;
}
.status-table {
  margin: 1rem;
  text-align: center;
  padding: 0.2rem;
  font-size: 0.8rem;
}
.status-table button {
  background: white;
  border: 1px solid gainsboro;
}
.status-table button:hover {
  cursor: pointer;
}
</style>
