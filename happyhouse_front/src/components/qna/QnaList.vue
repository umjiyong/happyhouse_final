<template>
  <div class="qna-list-container">
    <div class="flex-row search-box">
      <div class="flex-row gap-item input-box">
        <select v-model="key">
          <option value="all" selected>전체</option>
          <option value="title" selected>제목</option>
          <option value="userId">작성자</option>
        </select>
        <input type="text" v-model="word" placeholder="검색" />
      </div>
      <span
        class="hover-pointer search-btn"
        @click="searchQuestionListAction(1)"
      >
        <md-icon>search</md-icon>
      </span>
    </div>

    <table class="question-table">
      <thead>
        <th width="7%">글 번호</th>
        <th width="13%">카테고리</th>
        <th width="40%">제목</th>
        <th width="10%">작성자</th>
        <th width="20%">작성 시간</th>
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
    <br />
    <div class="page-navi-container">
      <div class="flex-row gap-item page-navi">
        pages
        <span
          :class="[
            { 'hover-pointer': true },
            { 'active-page': isSelected(pageNum) },
          ]"
          v-for="pageNum in totalPageCnt"
          :key="pageNum"
          @click="searchQuestionListAction(pageNum)"
        >
          {{ pageNum }}
        </span>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapState, mapMutations } from "vuex";
export default {
  data() {
    return {
      key: "all",
      word: "",
      selectedPage: 1,
    };
  },

  methods: {
    ...mapActions("qnaStore", [
      "getQuestionList",
      "searchQuestionByTitle",
      "getCategoryList",
    ]),
    ...mapMutations("qnaStore", ["CLEAR_QUESTION", "CLEAR_REPLY_LIST"]),

    mapCategory(cId) {
      console.log("실행됨...");
      if (this.categoryList) {
        const res = this.categoryList.filter((cat) => cat.id === cId);
        if (res.length > 0) return res[0].name;
        else return "기타";
      } else return cId;
    },
    searchQuestionListAction(selectedPage) {
      this.selectedPage = selectedPage;
      this.getQuestionList({ key: this.key, word: this.word, selectedPage });
    },
    isSelected(pageNum) {
      return pageNum === this.selectedPage;
    },
  },
  computed: {
    ...mapState("qnaStore", [
      "questionList",
      "categoryList",
      "totalQuestionCnt",
    ]),
    totalPageCnt() {
      return parseInt((this.totalQuestionCnt - 1) / 10) + 1;
    },
  },

  created() {
    this.getQuestionList();
    this.getCategoryList();
  },
  updated() {
    console.log("clear qna....");
    this.CLEAR_QUESTION();
    this.CLEAR_REPLY_LIST();
  },
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

.page-navi-container {
  width: 100%;
}
.page-navi {
  width: 100%;
  justify-content: center;
  font-weight: 600;
  color: rgba(100, 100, 100, 100);
  font-size: 1.1rem;
}
.page-navi span:hover {
  color: rgba(50, 50, 50, 100);
}
.active-page {
  font-weight: bold;
  font-size: 1.3rem;
  color: rgba(0, 0, 0, 1);
}

.search-box {
  background-color: rgba(59, 59, 59, 1);
  width: auto;
  padding: 0.2rem 0.4rem;
  padding: 1rem;

  justify-content: start;
}
.input-box {
  width: auto;
}
</style>
