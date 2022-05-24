<template>
  <div class="registContainer">
    Question Regist

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
          @click="this.registNewQuestion"
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
      newQuestion: {
        id: "",
        title: "",
        content: "",
        category: "",
        userId: "testman",
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
    ...mapState("qnaStore", ["categoryList"])
  },
  created() {
    this.getCategoryList();
  }
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
