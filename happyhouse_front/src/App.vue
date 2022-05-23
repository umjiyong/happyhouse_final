<template>
  <div id="material-kit">
    <div :class="{ 'nav-open': NavbarStore.showNavbar }">
      <!-- <router-view name="header" /> -->
      <div>
        <main-navbar />
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <div class="main main-raised">
          <router-view />
        </div>
        <main-footer />
      </div>
      <!-- <router-view name="footer" /> -->
    </div>
  </div>
</template>

<script>
import MainNavbar from "@/layout/MainNavbar.vue";
import MainFooter from "@/layout/MainFooter.vue";
export default {
  components: { MainNavbar, MainFooter },
};
</script>
