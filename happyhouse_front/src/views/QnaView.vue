<template>
  <div class="view-container">
    <h2>QnA View 입니다</h2>
    <qna-nav-bar />
    <br />
    <router-view></router-view>
  </div>
</template>

<script>
import QnaNavBar from "@/components/qna/QnaNavBar.vue";
export default {
  components: {
    QnaNavBar
  }
};
</script>

<style></style>
