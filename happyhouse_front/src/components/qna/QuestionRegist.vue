<template>
  <div class="flex-column question-regist-container">
    <h4>질문 작성</h4>
    <div class="flex-column question-regist-box">
      <form class="form-normal">
        <label for="category">
          카테고리
        </label>
        <select
          class="question-category-select"
          v-model="newQuestion.category"
          name="category"
          id="category"
        >
          <option
            v-for="category in categoryList"
            :key="category.id"
            :value="category.id"
          >
            {{ category.name }}
          </option>
        </select>
        <label for="question-title">
          제목
        </label>
        <input
          id="question-title"
          class="question-title-input"
          type="text"
          v-model="newQuestion.title"
        />
        <label for="question-content">
          내용
        </label>
        <textarea
          id="question-content"
          class="question-content-input"
          v-model="newQuestion.content"
        />
        <br />
        <button
          class="submit-button hover-pointer"
          type="button"
          @click="registNewQuestion"
        >
          제출
        </button>
      </form>
    </div>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";
export default {
  data() {
    return {
      newQuestion: {
        id: "",
        title: "",
        content: "",
        category: "",
        userId: "",
        regTime: ""
      }
    };
  },
  methods: {
    ...mapActions("qnaStore", [
      "getCategoryList",
      "registQuestion",
      "getQuestionList"
    ]),
    registNewQuestion() {
      console.log("new Question!! : " + JSON.stringify(this.newQuestion));
      this.registQuestion(this.newQuestion).then(() => {
        setTimeout(() => {
          this.getQuestionList();
        }, 500);
        this.$router.push({ name: "qnaList" });
      });
    }
  },
  computed: {
    ...mapState("qnaStore", ["categoryList"]),
    ...mapState("memberStore", ["userInfo"])
  },
  created() {
    this.getCategoryList();
    this.newQuestion.userId = this.userInfo.id;
  }
};
</script>

<style>
.question-regist-container {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.question-regist-box {
  width: 70%;
  padding: 3rem;
  border: 1px solid rgba(100, 100, 100, 0.3);
  border-radius: 5px;

  box-shadow: 6px 3px 10px 6px rgba(100, 100, 100, 0.5);
}
.form-normal {
  display: flex;
  flex-direction: column;
  align-items: start;
  width: 100%;
  height: auto;
  gap: 1rem;
}

.question-category-select {
  padding: 0.5rem;
}
.question-title-input {
  width: 100%;
  font-size: 1.1rem;
  padding: 0.5rem;
}
.question-content-input {
  width: 100%;
  height: 30vh;
  padding: 0.5rem;
  font-size: 1rem;
}
.submit-button {
  align-self: center;
  padding: 0.5rem 1.1rem;
  font-size: 1rem;
  background: rgba(71, 226, 169, 0.8);
  color: white;
  border: 2px solid rgba(71, 226, 169, 1);
  border-radius: 3px;
  margin-left: 0.5rem;
}
</style>
