<template>
  <div class="view-container">
    <house-search-bar @closeDetail="closeDetail" />
    <div class="flex-row">
      <house-list @openDetail="openDetail" v-show="!detailOn" />
      <house-detail @closeDetail="closeDetail" v-show="detailOn" />
      <kakao-map />
    </div>
    <!--modal-->
    <!-- <house-detail v-if="modalOn" @closeDetail="closeDetail" /> -->
  </div>
</template>

<script>
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
  components: { HouseSearchBar, HouseList, KakaoMap, HouseDetail },
  methods: {
    openDetail() {
      this.detailOn = true;
    },
    closeDetail() {
      this.detailOn = false;
    },
  },
};
</script>

<style></style>
