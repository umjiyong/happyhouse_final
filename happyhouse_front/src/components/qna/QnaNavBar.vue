<template>
  <div class="flex-row gap-item qna-nav">
    <router-link :to="{ name: 'qnaList' }">
      <div
        :class="[
          { 'qna-nav-item': true },
          { 'active-qna-item': selected === 'qnaList' },
        ]"
        @click="selectQnaList"
      >
        <md-icon>list</md-icon>
        <span>QnA 목록</span>
      </div>
    </router-link>

    <router-link :to="{ name: 'questionRegist' }">
      <div
        :class="[
          { 'qna-nav-item': true },
          { 'active-qna-item': selected === 'questionRegist' },
        ]"
        @click="selectQuestionRegist"
      >
        <md-icon>add</md-icon>
        <span>질문 등록</span>
      </div>
    </router-link>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selected: "qnaList",
    };
  },
  methods: {
    selectQnaList() {
      this.selected = "qnaList";
    },
    selectQuestionRegist() {
      this.selected = "questionRegist";
    },
  },
};
</script>

<style scoped>
.qna-nav {
  padding: 1.2rem 2rem;
  border-bottom: 1px solid rgba(100, 100, 100, 0.5);
  box-shadow: 6px 2px 10px 3px rgba(100, 100, 100, 0.5);
}
.qna-nav-item {
  padding: 1rem;
}

.qna-nav-item span {
  color: rgba(10, 10, 10, 0.8);
  font-size: 1rem;
  font-weight: 600;
}
.qna-nav-item:hover {
  background: rgba(120, 105, 120, 0.4);

  transition: all 700ms;
  border-radius: 5px;
}
.qna-nav-item:hover span {
  color: white;
  transition: all 200ms;
}
.qna-nav-item:hover i {
  color: white;
  transition: all 200ms;
}

.qna-nav-item i {
  margin-bottom: 2px;
  transition: none;
}
/* .active-qna-item {
  background: rgba(120, 100, 130, 0.4);
  border-radius: 5px;
}
.active-qna-item:hover span {
  color: white;
} */
</style>
