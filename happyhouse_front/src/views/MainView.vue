<template>
  <div>
    <br /><br /><br />
    Main 뷰입니다.
    <main-navbar />
    <user-view />

    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <main-footer />
  </div>
</template>

<script>
import MainNavbar from "../layout/MainNavbar.vue";
import MainFooter from "../layout/MainFooter.vue";
import UserView from "./UserView.vue";
export default {
  data() {
    return {
      modalOn: true
    };
  },
  methods: {
    openModal() {
      this.modalOn = true;
    },
    closeModal() {
      this.modalOn = false;
    }
  },

  components: { MainNavbar, MainFooter, UserView }
};
</script>

<style></style>
