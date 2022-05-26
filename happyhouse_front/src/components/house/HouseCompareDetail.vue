<template>
  <div class="house-detail-container">
    <div :class="[{ 'house-detail-scroll-box': true }]">
      <div class="house-detail-box">
        <div class="compare-title">
          <span class="red-part">
            {{ houseInfo2 ? houseInfo2.aptName : "" }}</span
          >
          &nbsp;VS&nbsp;
          <span class="blue-part">
            {{ houseInfo3 ? houseInfo3.aptName : "" }}</span
          >
        </div>
        <br />
        <br />
        <p class="bold-display">주변 정보</p>
        <br />
        <radar-chart :styles="myStyles" :chart-data="statusDataComputed" />
        <br /><br /><br />
        <div class="bold-display">
          {{ houseInfo2 ? houseInfo2.aptName : "" }}
        </div>
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
            <td>{{ transportationList2 ? transportationList2.length : 0 }}</td>
            <td>{{ educationList2 ? educationList2.length : 0 }}</td>
            <td>{{ lifeList2 ? lifeList2.length : 0 }}</td>
            <td>{{ environmentList2 ? environmentList2.length : 0 }}</td>
            <td>{{ safetyList2 ? safetyList2.length : 0 }}</td>
            <td>{{ cultureList2 ? cultureList2.length : 0 }}</td>
          </tr>
        </table>

        <div class="bold-display">
          {{ houseInfo3 ? houseInfo3.aptName : "" }}
        </div>
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
            <td>{{ transportationList3 ? transportationList3.length : 0 }}</td>
            <td>{{ educationList3 ? educationList3.length : 0 }}</td>
            <td>{{ lifeList3 ? lifeList3.length : 0 }}</td>
            <td>{{ environmentList3 ? environmentList3.length : 0 }}</td>
            <td>{{ safetyList3 ? safetyList3.length : 0 }}</td>
            <td>{{ cultureList3 ? cultureList3.length : 0 }}</td>
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
        <line-chart :styles="myStyles2" :chart-data="dealDataComputed" />
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";
// import HouseDealList from "@/components/house/HouseDealList.vue";
// import BarChart from "@/components/house/charts/BarChart.vue";
import LineChart from "@/components/house/charts/LineChart.vue";
import RadarChart from "@/components/house/charts/RadarChart.vue";
export default {
  data() {
    return {
      myStyles: {
        width: "300px",
        height: "300px",
      },
      myStyles2: {
        width: "400px",
        height: "200px",
      },
    };
  },
  props: {
    compareMode: {
      type: Boolean,
      default: false,
    },
    selectingHouseNum: {
      type: Number,
      default: 2,
    },
  },
  components: {
    // HouseDealList,
    LineChart,
    RadarChart,
  },
  computed: {
    ...mapState("houseStore", [
      "houseInfo2",
      "housedealList2",
      "transportationList2",
      "cultureList2",
      "educationList2",
      "environmentList2",
      "lifeList2",
      "safetyList2",

      "houseInfo3",
      "housedealList3",
      "transportationList3",
      "cultureList3",
      "educationList3",
      "environmentList3",
      "lifeList3",
      "safetyList3",
    ]),
    statusDataComputed() {
      const res = {
        labels: ["교통", "교육", "생활", "환경", "안전", "문화"],
        datasets: [
          {
            label: this.houseInfo2.aptName,
            fill: true,
            backgroundColor: "#a81f1f",
            borderColor: "#a81f1f",
            // hoverBackgroundColor: "#39a839",
            // hoverBorderColor: "#39a839",
            pointBackgroundColor: "#a81f1f",
            pointBorderColor: "#fff",
            // pointHoverBackgroundColor: "#39a839",
            // pointHoverBorderColor: "#39a839",
            data: [
              this.transportationList2.length,
              this.educationList2.length / 4,
              this.lifeList2.length / 2,
              this.environmentList2.length / 2,
              this.safetyList2.length / 30,
              this.cultureList2.length,
            ],
          },
          {
            label: this.houseInfo3.aptName,
            fill: true,
            backgroundColor: "#211fa8",
            borderColor: "#211fa8",
            // hoverBackgroundColor: "#39a839",
            // hoverBorderColor: "#39a839",
            pointBackgroundColor: "#211fa8",
            pointBorderColor: "#fff",
            // pointHoverBackgroundColor: "#39a839",
            // pointHoverBorderColor: "#39a839",
            data: [
              this.transportationList3.length,
              this.educationList3.length / 4,
              this.lifeList3.length / 2,
              this.environmentList3.length / 2,
              this.safetyList3.length / 30,
              this.cultureList3.length,
            ],
          },
        ],
      };
      return res;
    },
    dealDataComputed() {
      const res = {
        labels: [
          ...new Set(
            [
              ...this.housedealList2.map(
                (deal) =>
                  deal.dealYear +
                  "/" +
                  ("00" + deal.dealMonth).slice(-2) +
                  "/" +
                  ("00" + deal.dealDay).slice(-2)
              ),
              ...this.housedealList3.map(
                (deal) =>
                  deal.dealYear +
                  "/" +
                  ("00" + deal.dealMonth).slice(-2) +
                  "/" +
                  ("00" + deal.dealDay).slice(-2)
              ),
            ].sort()
          ),
        ],
        datasets: [
          {
            label: this.houseInfo2.aptName,
            backgroundColor: "#a81f1f",
            borderColor: "#a81f1f",
            data: this.housedealList2
              .map((deal) =>
                parseFloat(
                  deal.dealAmount
                    .trim()
                    .split(",")
                    .join("") / 10000
                )
              )
              .reverse(),
          },
          {
            label: this.houseInfo3.aptName,
            backgroundColor: "#211fa8",
            borderColor: "#211fa8",
            data: this.housedealList3
              .map((deal) =>
                parseFloat(
                  deal.dealAmount
                    .trim()
                    .split(",")
                    .join("") / 10000
                )
              )
              .reverse(),
          },
        ],
      };
      console.log(res);
      return res;
    },
  },
  watch: {
    houseInfo2(val) {
      console.log("houseInfo2 updated!!");
      this.searchHouseDealByAptCode(val.aptCode);
      this.searchStatusByAptCode(val.aptCode);
    },
    houseInfo3(val) {
      console.log("houseInfo3 updated!!");
      this.searchHouseDealByAptCode(val.aptCode);
      this.searchStatusByAptCode(val.aptCode);
    },
  },

  methods: {
    ...mapMutations("houseStore", [
      "CLEAR_HOUSEDEAL_LIST",
      "SET_SHOW_STATUS_POSITION",
    ]),
    ...mapActions("houseStore", [
      "searchHouseDealByAptCode",
      "searchStatusByAptCode",
    ]),
    closeDetail() {
      this.CLEAR_HOUSEDEAL_LIST();
      this.$emit("closeDetail");
    },
    pinStatus(status) {
      this.SET_SHOW_STATUS_POSITION(status);
    },
  },
};
</script>

<style>
.house-detail-container {
  flex-grow: 0.3;
  position: relative;
  background: white;
}
.house-detail-scroll-box {
  overflow-y: scroll;
}
.house-detail-search-size {
  width: 100%;
  max-height: 80vh;
}
.house-detail-compare-size {
  width: 100%;
  max-height: 50vh;
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

/* compare */
.compare-box {
  position: absolute;
  top: 1rem;
  left: 1rem;
}
.compare-box button {
  background: rgba(191, 59, 59, 0.7);
  border: 2px solid rgba(191, 59, 59, 1);
  border-radius: 3px;
  color: white;
  font-size: 0.9rem;
  padding: 0.5rem;
}
.compare-title {
  font-weight: bold;
  font-size: 1.3rem;
}
.red-part {
  color: #a81f1f;
}
.blue-part {
  color: #211fa8;
}
</style>
