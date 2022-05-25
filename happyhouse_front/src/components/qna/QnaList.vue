<template>
  <div class="qna-list-container">
    QnA List
    <div class="flex-row gap-item">
      <input type="text" v-model="word" placeholder="질문 제목 검색" />
      <span
        class="hover-pointer search-btn"
        @click="searchQuestionByTitle(word)"
      >
        <md-icon>search</md-icon>
      </span>
    </div>

    <table class="question-table">
      <thead>
        <th>글 번호</th>
        <th>카테고리</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성 시간</th>
      </thead>
      <tbody>
        <tr v-for="question in questionList" :key="question.id">
          <td>
            {{ question.id }}
          </td>
          <td>
            {{ mapCategory(question.category) }}
          </td>
          <td>
            <router-link
              :to="{ name: 'qnaPage', params: { q_id: question.id } }"
              ><div class="title-font">{{ question.title }}</div></router-link
            >
          </td>
          <td>
            {{ question.userId }}
          </td>
          <td>
            {{ question.regTime }}
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import { mapActions, mapState, mapMutations } from "vuex";
export default {
  data() {
    return {
      word: ""
    };
  },
  methods: {
    ...mapActions("qnaStore", [
      "getQuestionList",
      "searchQuestionByTitle",
      "getCategoryList"
    ]),
    ...mapMutations("qnaStore", ["CLEAR_QUESTION", "CLEAR_REPLY_LIST"]),

    mapCategory(cId) {
      console.log("실행됨...");
      if (this.categoryList) {
        console.log("카테고리 리스트 있음...");
        const res = this.categoryList.filter(cat => cat.id === cId);
        console.log("필터링 성공...");
        if (res.length > 0) return res[0].name;
        else return "기타";
      } else return cId;
    }
  },
  computed: {
    ...mapState("qnaStore", ["questionList", "categoryList"])
  },

  created() {
    this.getQuestionList();
    this.getCategoryList();
  },
  updated() {
    console.log("clear qna....");
    this.CLEAR_QUESTION();
    this.CLEAR_REPLY_LIST();
  }
};
</script>

<style scoped>
.qna-list-container {
  padding: 0 2rem;
}
.question-table {
  width: 100%;
  border: 1px solid rgba(100, 100, 100, 0.2);
  border-collapse: collapse;
}
.question-table td,
.question-table th {
  border: 1px solid rgba(100, 100, 100, 0.5);
  padding: 0.5rem;
  font-size: 1rem;
  font-weight: 500;
}
.title-font {
  color: rgba(30, 30, 120, 0.9);
  font-weight: 600;
}

.question-table thead {
  background-color: rgba(0, 0, 0, 0.8);
  color: white;
}
.question-table tr:nth-child(even) {
  background-color: rgba(100, 100, 100, 0.2);
}

.search-btn {
  background: white;
  border: 2px solid gainsboro;
  border-radius: 0 5px 5px 0;
  padding: 0.2rem;
}
</style>
