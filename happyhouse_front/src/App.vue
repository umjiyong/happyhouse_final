<template>
  <div id="material-kit">
    <div :class="{ 'nav-open': NavbarStore.showNavbar }">
      <main-navbar />
      <div class="main main-raised">
        <router-view />
      </div>
      <main-footer />
    </div>
  </div>
</template>

<script>
import MainNavbar from "./layout/MainNavbar.vue";
import MainFooter from "./layout/MainFooter.vue";

export default {
  components: { MainNavbar, MainFooter }
};
</script>

<style>
.flex-row {
  display: flex;
  width: 100%;
}

.gap-item {
  gap: 1rem;
}

.flex-column {
  display: flex;
  flex-direction: column;
}
.app-container {
  background: rgb(100, 100, 100);
  padding: 1rem;
}
.view-container {
  width: 100%;
  min-height: 100vh;
  background: rgb(255, 255, 255);
}
</style>
