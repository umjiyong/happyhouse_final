<template>
  <div class="house-page">
    <router-view></router-view>
    <!-- <div class="md-layout-item md-size-50 md-small-size-100"> -->
    <div class="fixed">
      <house-tabs
        :tab-name="['Dashboard', '거래내역 조회', '아파트 비교']"
        :tab-icon="['dashboard', 'list', 'compare']"
        plain
        flex-column
        nav-pills-icons
        color-button="happyhouse"
      >
        <!-- here you can add your content for tab-content -->
        <template slot="tab-pane-1">
          Collaboratively administrate empowered markets via plug-and-play
          networks. Dynamically procrastinate B2C users after installed base
          benefits.
          <br /><br />
          Dramatically visualize customer directed convergence without
          revolutionary ROI.
        </template>
        <template slot="tab-pane-2">
          Efficiently unleash cross-media information without cross-media value.
          Quickly maximize timely deliverables for real-time schemas.
          <br /><br />
          Dramatically maintain clicks-and-mortar solutions without functional
          solutions.
        </template>
      </house-tabs>
    </div>
  </div>
</template>

<script>
import HouseTabs from "@/components/house/HouseTabs.vue";
export default {
  components: { HouseTabs }
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
}
</style>
