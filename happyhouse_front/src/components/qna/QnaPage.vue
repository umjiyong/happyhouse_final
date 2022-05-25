<template>
  <div class="flex-column question-container">
    <div class="flex-column question-box">
      <div class="flex-column question-main">
        <h3 class="question-title">{{ question.title }}</h3>

        <div class="writer">
          by <span class="user-id">{{ question.userId }}</span>
        </div>
        <div>
          {{ question.regTime }}
        </div>
        <br />
        <div class="question-content">{{ question.content }}</div>
      </div>
      <div class="question-control" v-if="isByUser(question.userId)">
        <button class="question-edit-btn hover-pointer" @click="moveUpdatePage">
          질문 수정
        </button>
        <button
          class="question-remove-btn hover-pointer"
          @click="removeThisQuestion(question.id)"
        >
          질문 삭제
        </button>
      </div>
      <div class="flex-column reply-container">
        <div class="bold-display">댓글 {{ replyList.length }}</div>
        <div>
          <input type="text" v-model="reply.content" placeholder="댓글 입력" />
          <button
            class="hover-pointer reply-regist-btn"
            @click="registThisReply"
          >
            등록
          </button>
        </div>
        <br />
        <!-- <div>{{ selectedReplyId }}</div> -->
        <div v-for="reply in replyList" :key="reply.r_id">
          <div class="reply-box" v-if="reply.id === reply.prId">
            <span class="user-id">{{ reply.userId }}</span> :
            {{ reply.content }}

            <button
              class="hover-pointer rereply-open-btn"
              @click="selectReply(reply.id)"
            >
              대댓글
            </button>
            <button
              class="hover-pointer reply-remove-btn"
              @click="removeThisReply(reply.id)"
              v-if="isByUser(reply.userId)"
            >
              삭제
            </button>
            <div v-if="selectedReplyId === reply.id">
              <div>
                <input
                  type="text"
                  v-model="reReply.content"
                  placeholder="댓글 입력"
                />
                <button
                  class="hover-pointer rereply-regist-btn"
                  @click="registThisReReply(reply.id)"
                >
                  등록
                </button>
                <button
                  class="hover-pointer rereply-cancle-btn"
                  @click="selectReply(0)"
                >
                  취소
                </button>
              </div>
            </div>
          </div>
          <div class="rereply-box" v-else-if="reply.id !== reply.prId">
            <span class="user-id">{{ reply.userId }}</span> :
            {{ reply.content }}
            <button
              class="hover-pointer reply-remove-btn"
              @click="removeThisReply(reply.id)"
              v-if="isByUser(reply.userId)"
            >
              삭제
            </button>
          </div>
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
        userId: "",
        regTime: "",
      },
      reReply: {
        id: "",
        qId: "",
        prId: 0,
        content: "",
        userId: "",
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
    isByUser(writerId) {
      return writerId === this.userInfo.id;
    },
  },
  computed: {
    ...mapState("qnaStore", ["question", "replyList"]),
    ...mapState("memberStore", ["userInfo"]),
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

    this.reply.userId = this.userInfo.id;
    this.reReply.userId = this.userInfo.id;
  },
};
</script>

<style>
.question-container {
  align-items: center;

  width: 100%;
}
.question-box {
  width: 70%;
  padding: 2rem;
  border: 1px solid rgba(100, 100, 100, 0.3);
  border-radius: 5px;

  box-shadow: 6px 3px 10px 6px rgba(100, 100, 100, 0.5);
}
.question-main {
}

.question-title {
  font-weight: bold;
}

.question-content {
  padding: 3rem 0;
  border-top: 1px solid rgba(100, 100, 100, 0.3);
}

.question-control {
  display: flex;
  justify-content: flex-end;
  padding: 1rem;
  border-bottom: 1px solid rgba(100, 100, 100, 0.3);
}
.question-edit-btn {
  padding: 0.5rem;
  background: rgba(71, 125, 226, 0.8);
  color: white;
  border: 2px solid rgba(71, 125, 226, 1);
  border-radius: 3px;
}
.question-remove-btn {
  padding: 0.5rem;
  background: rgba(226, 71, 81, 0.8);
  color: white;
  border: 2px solid rgba(226, 71, 81, 1);
  border-radius: 3px;
  margin-left: 0.5rem;
}
.reply-container {
  border-top: 1px solid rgba(100, 100, 100, 0.3);
  padding: 2rem 0;
}
.reply-box {
  padding: 2rem 0;
}
.reply-container input {
  width: 80%;
  font-size: 1.1rem;
  padding: 0.2rem;
}
.reply-regist-btn {
  padding: 0.5rem;
  background: rgba(71, 226, 169, 0.8);
  color: white;
  border: 2px solid rgba(71, 226, 169, 1);
  border-radius: 3px;
  margin-left: 0.5rem;
}

.rereply-open-btn {
  padding: 0.2rem;
  background: rgba(127, 133, 133, 0.8);
  color: white;
  border: 2px solid rgba(123, 139, 141, 1);
  border-radius: 3px;
  margin-left: 0.5rem;
}
.reply-remove-btn {
  padding: 0.2rem;
  background: rgba(226, 71, 81, 0.8);
  color: white;
  border: 2px solid rgba(226, 71, 81, 1);
  border-radius: 3px;
  margin-left: 0.3rem;
}

.rereply-regist-btn {
  padding: 0.5rem;
  background: rgba(71, 226, 169, 0.8);
  color: white;
  border: 2px solid rgba(71, 226, 169, 1);
  border-radius: 3px;
  margin-left: 0.5rem;
}
.rereply-cancle-btn {
  padding: 0.5rem;
  background: rgba(123, 139, 141, 0.8);
  color: white;
  border: 2px solid rgba(123, 139, 141, 1);
  border-radius: 3px;
  margin-left: 0.5rem;
}
.reply-box {
  padding: 0.5rem;
  border-top: 1px solid rgba(100, 100, 100, 0.5);
}
.rereply-box {
  padding: 0.5rem;
  padding-left: 3rem;
  border-top: 1px solid rgba(100, 100, 100, 0.3);
  background: rgba(160, 160, 160, 0.1);
}
.user-id {
  font-weight: bold;
}
</style>
