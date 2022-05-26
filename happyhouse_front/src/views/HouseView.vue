<template>
  <div class="view-container">
    <div class="fixed">
      <house-tabs
        :tab-name="[
          { name: '아파트 조회', comp: 'houseSearch' },
          { name: '상세', comp: 'houseSearch' },
          { name: '비교', comp: 'houseCompare' },
        ]"
        :tab-icon="['list', 'dashboard', 'compare']"
        plain
        flex-column
        nav-pills-icons
        color-button="happyhouse"
      />
    </div>
    <router-view></router-view>
  </div>
</template>

<script>
import HouseTabs from "@/components/house/HouseTabs.vue";
export default {
  components: { HouseTabs },
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
