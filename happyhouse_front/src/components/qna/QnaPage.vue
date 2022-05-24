<template>
  <div>
    <h3>Q. {{ question.title }}</h3>
    <div>글쓴이 : {{ question.userId }}</div>
    <br />
    <div>{{ question.content }}</div>
    <button @click="moveUpdatePage">질문 수정</button>
    <button @click="removeThisQuestion(question.id)">질문 삭제</button>
    <div>
      <h4>댓글</h4>
      <div>
        <input type="text" v-model="reply.content" placeholder="댓글 입력" />
        <button @click="registThisReply">등록</button>
      </div>
      <div>{{ selectedReplyId }}</div>
      <div v-for="reply in replyList" :key="reply.r_id">
        <div v-if="reply.id === reply.prId">
          {{ reply.userId }} :
          {{ reply.content }}

          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <button @click="selectReply(reply.id)">대댓글</button>
          <button @click="removeThisReply(reply.id)">삭제</button>
          <div v-if="selectedReplyId === reply.id">
            <div>
              <input
                type="text"
                v-model="reReply.content"
                placeholder="댓글 입력"
              />
              <button @click="registThisReReply(reply.id)">등록</button>
              <button @click="selectReply(0)">취소</button>
            </div>
          </div>
        </div>
        <div v-else-if="reply.id !== reply.prId">
          ㄴ {{ reply.userId }} : {{ reply.content }}
          <button @click="removeThisReply(reply.id)">삭제</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";
export default {
  data() {
    return {
      qId: "",
      selectedReplyId: 0,
      reply: {
        id: "",
        qId: "",
        prId: 0,
        content: "",
        userId: "testman",
        regTime: "",
      },
      reReply: {
        id: "",
        qId: "",
        prId: 0,
        content: "",
        userId: "testman",
        regTime: "",
      },
    };
  },
  methods: {
    ...mapActions("qnaStore", [
      "getQnA",
      "removeQuestion",
      "registReply",
      "removeReply",
    ]),
    moveUpdatePage() {
      this.$router.push({ name: "questionUpdate", params: { q_id: this.qId } });
    },
    removeThisQuestion(qId) {
      this.removeQuestion(qId).then(() => {
        this.$router.push({ name: "qnaList" });
      });
    },
    async registThisReply() {
      this.registReply(this.reply).then(() => {
        setTimeout(() => {
          this.getQnA(this.qId);
        }, 1000);
      });
      this.reply.content = "";
    },
    registThisReReply(prId) {
      this.reReply.prId = prId;
      this.registReply(this.reReply).then(() => {
        this.selectedReplyId = 0;
        setTimeout(() => {
          this.getQnA(this.qId);
        }, 1000);
      });
      this.reReply.content = "";
    },
    selectReply(rId) {
      this.selectedReplyId = rId;
    },
    removeThisReply(rId) {
      this.removeReply(rId).then(() => {
        setTimeout(() => {
          this.getQnA(this.qId);
        }, 500);
      });
    },
  },
  computed: {
    ...mapState("qnaStore", ["question", "replyList"]),
  },
  watch: {
    replyList(newVal, oldVal) {
      console.log("reply List changed!! : ");
      console.log(oldVal);
      console.log(newVal);
    },
  },
  created() {
    const qId = this.$route.params.q_id;
    this.qId = qId;
    this.getQnA(qId);
    this.reply.qId = qId;
    this.reReply.qId = qId;
  },
};
</script>

<style></style>
