<template>
  <div class="house-list-container">
    <div class="bold-display padding-1rem">검색된 아파트</div>
    <div class="house-list-box">
      <table class="house-table">
        <tr
          v-for="house in houseList"
          :key="house.aptCode"
          @click="openDetail(house)"
          class="hover-pointer"
        >
          <td>
            {{ house.aptName }}
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
export default {
  computed: {
    ...mapState("houseStore", ["houseList"]),
  },
  methods: {
    ...mapMutations("houseStore", ["CLEAR_HOUSE_LIST", "SET_HOUSE_INFO1"]),
    openDetail(houseInfo) {
      this.SET_HOUSE_INFO1(houseInfo);
      this.$emit("openDetail");
    },
  },
  created() {
    this.CLEAR_HOUSE_LIST();
    console.log("create");
  },
};
</script>

<style scoped>
.padding-1rem {
  padding: 1rem;
}
.house-list-container {
  flex-grow: 1;
  max-height: 80vh;
  overflow-y: scroll;
  border-bottom: 2px solid rgba(100, 100, 100, 0.2);
}
.house-list-box {
  width: 100%;
}
.house-table {
  width: 100%;
  border: 1px solid rgba(100, 100, 100, 0.2);
  border-collapse: collapse;
}
.house-table td,
.house-table th {
  border: 1px solid rgba(100, 100, 100, 0.5);
  padding: 0.5rem;
  font-size: 1rem;
  font-weight: 500;
}

.house-table thead {
  background-color: rgba(0, 0, 0, 0.8);
  color: white;
}
.house-table tr:nth-child(even) {
  background-color: rgba(100, 100, 100, 0.2);
}
.house-table tr:hover {
  background-color: rgba(100, 100, 150, 0.5);
}
</style>
