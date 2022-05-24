<template>
  <div class="wrapper" v-if="userInfo">
    <div class="modal-bg">
      <div class="modal-container">
        <login-card header-color="red">
          <h4 slot="title" class="card-title">
            회원 정보 수정하기
          </h4>
          <p slot="description" class="description">
            Or Be Classical
          </p>
          <md-field class="md-form-group" slot="inputs">
            <md-icon>man</md-icon>
            <label>회원님의 아이디</label>
            <md-input v-model="userInfo.id" type="id" readonly></md-input>
          </md-field>
          <md-field class="md-form-group" slot="inputs">
            <md-icon>lock_outline</md-icon>
            <label>비밀번호 입력...</label>
            <md-input v-model="user.password" type="password"></md-input>
          </md-field>
          <md-field class="md-form-group" slot="inputs">
            <md-icon>lock_outline</md-icon>
            <label>비밀번호 확인...</label>
            <md-input v-model="userpwdConfirm" type="password"></md-input>
          </md-field>
          <md-field class="md-form-group" slot="inputs">
            <md-icon>man</md-icon>
            <label>{{ userInfo.name }}</label>
            <md-input v-model="user.name" type="text"></md-input>
          </md-field>
          <md-field class="md-form-group" slot="inputs">
            <md-icon>email</md-icon>
            <label>{{ userInfo.email }}</label>
            <md-input v-model="user.email" type="email"></md-input>
          </md-field>
          <md-button
            slot="footer"
            @click="updateMember"
            class="md-simple md-success md-lg"
          >
            수정하기
          </md-button>
          <md-button
            slot="footer"
            @click="unregister"
            class="md-simple md-success md-lg"
          >
            탈퇴하기
          </md-button>
        </login-card>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";
import { LoginCard } from "@/components/user";

const memberStore = "memberStore";

export default {
  name: "MemberMyPage",

  data() {
    return {
      user: {
        name: null,
        email: null,
        id: null,
        password: null
      },
      userpwdConfirm: null,
      pwMatches: true
    };
  },

  components: {
    LoginCard
  },
  computed: {
    ...mapState(memberStore, ["userInfo"])
  },
  methods: {
    ...mapActions(memberStore, ["modifyMember", "deleteMember"]),

    pwCheck() {
      if (this.user.password == this.userpwdConfirm) {
        this.pwMatches = true;
      } else {
        this.pwMatches = false;
      }
    },
    updateMember() {
      this.pwCheck();
      if (this.pwMatches) {
        this.modifyMember(this.user);
        alert("수정 완료");
        this.$router.push({ name: "main" });
      } else {
        alert("비밀번호 확인하세요");
      }
    },
    unregister() {
      if (confirm("정말로 탈퇴하시겠습니까?")) {
        this.deleteMember(this.userInfo.id);
        this.$router.push({ name: "main" });
      }
    }
  }
};
</script>

<style></style>
