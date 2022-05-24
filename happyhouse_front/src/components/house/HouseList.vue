<template>
  <div class="house-list-container">
    HouseList
    <div>
      <div
        v-for="house in houseList"
        :key="house.aptCode"
        @click="openDetail(house)"
      >
        {{ house.aptName }}
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
export default {
  computed: {
    ...mapState("houseStore", ["houseList"])
  },
  methods: {
    ...mapMutations("houseStore", ["CLEAR_HOUSE_LIST", "SET_HOUSE_INFO1"]),
    openDetail(houseInfo) {
      this.SET_HOUSE_INFO1(houseInfo);
      this.$emit("openDetail");
    }
  },
  created() {
    this.CLEAR_HOUSE_LIST();
    console.log("create");
  }
};
</script>

<style>
.house-list-container {
  flex-grow: 1;
}
</style>
