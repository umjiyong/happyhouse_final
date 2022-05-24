<template>
  <div class="registContainer">
    Question Update

    <form class="form-normal">
      <label>
        제목
        <input type="text" v-model="newQuestion.title" />
      </label>
      <label>
        내용
        <textarea v-model="newQuestion.content" />
      </label>

      <label>
        카테고리
        <select v-model="newQuestion.category" name="category" id="category">
          <option
            v-for="category in categoryList"
            :key="category.id"
            :value="category.id"
          >
            {{ category.name }}
          </option>
        </select>
      </label>
      <div>
        <button
          class="submit-button"
          type="button"
          @click="this.updateThisQuestion"
        >
          제출
        </button>
      </div>
    </form>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";
export default {
  data() {
    return {
      qId: 0,
      newQuestion: {
        id: "",
        title: "",
        content: "",
        category: "",
        userId: "testman",
        regTime: "",
      },
    };
  },
  methods: {
    ...mapActions("qnaStore", [
      "getCategoryList",
      "updateQuestion",
      "searchQuestion",
    ]),
    updateThisQuestion() {
      console.log("new Question!! : " + JSON.stringify(this.newQuestion));
      this.updateQuestion(this.newQuestion).then(() => {
        setTimeout(() => {
          this.getQuestionList();
          this.searchQuestion(this.qId);
        }, 500);
        this.$router.push({ name: "qnaPage", params: { q_id: this.qId } });
      });
    },
  },
  computed: {
    ...mapState("qnaStore", ["categoryList", "question"]),
  },
  created() {
    const qId = this.$route.params.q_id;
    this.qId = qId;
    this.getCategoryList();
    this.searchQuestion(qId);
    this.newQuestion = this.question;
  },
};
</script>

<style>
.registContainer {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.form-normal {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 30%;
  height: 30%;
  gap: 1rem;
}
.submit-button {
  width: 3rem;
  height: 2rem;
}
</style>
