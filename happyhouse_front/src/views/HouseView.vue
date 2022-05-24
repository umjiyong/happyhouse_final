<template>
  <div class="view-container">
    HouseView
    <div class="fixed">
      <house-tabs
        :tab-name="[
          { name: '아파트 조회', comp: 'houseSearch' },
          { name: '상세', comp: 'houseSearch' },
          { name: '비교', com: 'houseSearch' },
        ]"
        :tab-icon="['list', 'dashboard', 'compare']"
        plain
        flex-column
        nav-pills-icons
        color-button="happyhouse"
      />
    </div>
    <router-view></router-view>
    <house-nav-bar />
  </div>
</template>

<script>
import HouseNavBar from "@/components/house/layout/HouseNavBar.vue";
import HouseTabs from "@/components/house/HouseTabs.vue";
export default {
  components: { HouseNavBar, HouseTabs },
};
</script>

<style scoped>
.house-page {
  width: 100%;
  min-height: 100vh;
  display: flex;
  justify-content: space-between;
}
.fixed {
  position: fixed;
  right: 5%;
  top: 30%;
  z-index: 1000;
}
</style>
