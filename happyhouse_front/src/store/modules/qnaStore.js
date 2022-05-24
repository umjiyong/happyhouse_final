import {
  getQuestionList,
  getQnA,
  getCategoryList,
  registQuestion,
  updateQuestion,
  searchQuestion,
  removeQuestion,
  registReply,
  updateReply,
  removeReply
} from "@/api/qna";

const qnaStore = {
  namespaced: true,
  state: {
    questionList: [],
    question: {},
    replyList: [],
    categoryList: [],
    user: {
      id: "defaultUserId",
      name: "defaultUserName"
    }
  },
  actions: {
    getQuestionList(context) {
      getQuestionList(response => {
        console.log(response);
        context.commit("SET_QUESTION_LIST", response.data);
      });
    },
    getQnA(context, qId) {
      getQnA(qId, response => {
        console.log("url : " + `/question/${qId}`);
        console.log(response);
        context.commit("SET_QUESTION", response.data["question"]);
        context.commit("SET_REPLY_LIST", response.data["replyList"]);
      });
    },
    getCategoryList(context) {
      getCategoryList(response => {
        console.log(response);
        context.commit("SET_CATEGORY_LIST", response.data);
      });
    },
    async registQuestion(context, newQuestion) {
      await registQuestion(newQuestion, response => {
        alert(response.data);
      });
    },
    searchQuestion(context, qId) {
      searchQuestion(qId, response => {
        context.commit("SET_QUESTION", response.data);
      });
    },
    async updateQuestion(context, newQuestion) {
      await updateQuestion(newQuestion, response => {
        alert(response.data);
      });
    },
    async removeQuestion(context, qId) {
      await removeQuestion(qId, response => {
        alert(response.data);
      });
    },
    // searchQuestionByTitle(context, word) {},

    async registReply(context, newReply) {
      await registReply(newReply, response => {
        alert(response.data);
        // console.log(response);
        // this.$router.push({ name: "QnAList" });
      });
    },

    async updateReply(context, newReply) {
      await updateReply(newReply, response => {
        alert(response.data);
      });
    },

    async removeReply(context, rId) {
      await removeReply(rId, response => {
        alert(response.data);
      });
    }
  },
  mutations: {
    SET_QUESTION_LIST(state, payload) {
      state.questionList = payload;
    },
    SET_QUESTION(state, payload) {
      state.question = payload;
    },
    SET_REPLY_LIST(state, payload) {
      state.replyList = payload;
    },
    SET_CATEGORY_LIST(state, payload) {
      state.categoryList = payload;
    },
    CLEAR_QUESTION(state) {
      state.question = {};
    },
    CLEAR_REPLY_LIST(state) {
      state.replyList = [];
    }
  }
};

export default qnaStore;
