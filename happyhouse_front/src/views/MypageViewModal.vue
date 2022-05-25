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
            <label>회원님의 아이디 : {{ userInfo.id }}</label>
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
            <label>기존 이름 : {{ userInfo.name }}</label>
            <md-input v-model="userInfo.name" type="text"></md-input>
          </md-field>
          <md-field class="md-form-group" slot="inputs">
            <md-icon>email</md-icon>
            <label>기존 email : {{ userInfo.email }}</label>
            <md-input v-model="userInfo.email" type="email"></md-input>
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
          <md-button
            slot="footer"
            @click="closeModal"
            class="md-simple md-success md-lg"
          >
            창 닫기
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
        password: null,
      },
      userpwdConfirm: null,
      pwMatches: true,
    };
  },

  components: {
    LoginCard,
  },
  computed: {
    ...mapState(memberStore, ["userInfo"]),
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
      if (
        this.user.id != null &&
        this.user.password != null &&
        this.userpwdConfirm != null &&
        this.user.name != null &&
        this.user.email != null
      ) {
        this.pwCheck();
        if (this.pwMatches) {
          this.user.id = this.userInfo.id;
          this.user.name = this.userInfo.name;
          this.user.email = this.userInfo.email;
          this.modifyMember(this.user);
          alert("수정 완료");
          this.movePage();
        } else {
          alert("비밀번호 확인하세요");
        }
      } else {
        alert("빈 칸이 있습니다 확인해주세요");
      }
    },
    unregister() {
      if (confirm("정말로 탈퇴하시겠습니까?")) {
        this.deleteMember(this.userInfo.id);
        this.movePage();
      }
    },
    closeModal() {
      this.$emit("closemodal");
    },
    movePage() {
      this.$router.go("this.$router.currentRoute");
    },
  },
};
</script>

<style></style>
