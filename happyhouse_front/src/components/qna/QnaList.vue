<template>
  <div>
    QnA List
    <div>
      <input type="text" v-model="word" placeholder="질문 제목 검색" />
      <button @click="searchQuestionByTitle(word)">검색</button>
    </div>
    <div>
      <div v-for="question in questionList" :key="question.id">
        <router-link :to="{ name: 'qnaPage', params: { q_id: question.id } }">{{
          question.title
        }}</router-link>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapState, mapMutations } from "vuex";
export default {
  data() {
    return {
      word: "",
    };
  },
  methods: {
    ...mapActions("qnaStore", ["getQuestionList", "searchQuestionByTitle"]),
    ...mapMutations("qnaStore", ["CLEAR_QUESTION", "CLEAR_REPLY_LIST"]),
  },
  computed: {
    ...mapState("qnaStore", ["questionList"]),
  },
  created() {
    this.getQuestionList();
  },
  updated() {
    console.log("clear qna....");
    this.CLEAR_QUESTION();
    this.CLEAR_REPLY_LIST();
  },
};
</script>

<style></style>
