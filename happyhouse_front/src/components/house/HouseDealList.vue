<template>
  <div class="housedeal-list-container">
    <p class="bold-display">거래내역 {{ housedealList.length }}</p>
    <div class="housedeal-list-scroll-box">
      <table class="housedeal-table">
        <thead class="md-table-head">
          <th width="30%">날짜</th>
          <!--{{dealYear}}년 {{dealMonth}}월 {{dealDay}}일-->
          <th width="30%">거래금액</th>
          <!--{{dealAmout}}만원-->
          <th width="15%">층수</th>
          <!--{{floor}}층-->
          <th width="25%">면적</th>
          <!--{{area}}m<sup>2</sup>-->
        </thead>
        <tbody v-if="housedealList.length">
          <tr v-for="housedeal in housedealList" :key="housedeal.no">
            <td>
              {{ housedeal.dealYear }}년 {{ housedeal.dealMonth }}월
              {{ housedeal.dealDay }}일
            </td>
            <td>{{ housedeal.dealAmount | changeUnit }}</td>
            <td>{{ housedeal.floor }}층</td>
            <td>
              {{ housedeal.area }}m<sup>2</sup> ({{
                parseInt(housedeal.area / 3.3)
              }}평)
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  computed: {
    ...mapState("houseStore", ["housedealList"]),
  },
  filters: {
    changeUnit(price) {
      price = price
        .trim()
        .split(",")
        .join("");
      let res = "";
      if (price >= 10000) {
        res += parseInt(price / 10000) + "억";
      }
      if (price % 10000 !== 0) res += " " + (price % 10000) + "만";
      return (res += " 원");
    },
  },
};
</script>

<style scoped>
.housedeal-list-container {
  width: 100%;
}
.housedeal-table {
  width: 100%;
  border: 1px solid rgba(100, 100, 100, 0.2);
  border-collapse: collapse;
}
.housedeal-table td,
.housedeal-table th {
  border: 1px solid rgba(100, 100, 100, 0.5);
  padding-left: 0.5rem;
  font-size: 0.9rem;
}

.housedeal-table thead {
  background-color: rgba(0, 0, 0, 0.8);
  color: white;
}
.housedeal-table tr:nth-child(even) {
  background-color: rgba(100, 100, 100, 0.2);
}
.housedeal-list-scroll-box {
  max-height: 80vh;
  overflow-y: scroll;
}
</style>
