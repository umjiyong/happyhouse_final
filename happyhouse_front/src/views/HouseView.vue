<template>
  <div class="view-container">
    HouseView
    <house-nav-bar />
    <house-tabs />
    <router-view></router-view>
  </div>
</template>

<script>
import HouseNavBar from "@/components/house/layout/HouseNavBar.vue";
import HouseTabs from "@/components/house/HouseTabs.vue";
export default {
  components: { HouseNavBar, HouseTabs },
};
</script>

<style></style>
