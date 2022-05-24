<template>
  <div>
    <div class="wrapper" v-if="(modalOn == true) & (joinusMode == false)">
      
              <div class="modal-bg">
                <div class="modal-container">
                  <login-card header-color="red">
                    <h4 slot="title" class="card-title">Log in</h4>
                    <p slot="description" class="description">
                      Or Be Classical
                    </p>
                    <md-field class="md-form-group" slot="inputs">
                      <md-icon>man</md-icon>
                      <label>아이디 입력...</label>
                      <md-input v-model="user.id" type="id"></md-input>
                    </md-field>
                    <md-field class="md-form-group" slot="inputs">
                      <md-icon>lock_outline</md-icon>
                      <label>비밀번호 입력...</label>
                      <md-input
                        v-model="user.password"
                        @keyup.enter="confirm"
                        type="password"
                      ></md-input>
                    </md-field>
                    <md-button
                      slot="footer"
                      @click="confirm"
                      class="md-simple md-success md-lg"
                    >
                      Log in
                    </md-button>
                    <md-button
                      slot="footer"
                      @click="swapJoinusMode"
                      class="md-simple md-success md-lg"
                    >
                      Join us
                    </md-button>
                    <md-button
                      slot="footer"
                      @click="logout"
                      class="md-simple md-success md-lg"
                    >
                      창 닫기
                    </md-button>
                  </login-card>
                </div>
              </div>
            
    </div>

    <div class="wrapper" v-else-if="(modalOn == true) & (joinusMode == true)">
      
              <div class="modal-bg">
                <div class="modal-container">
                  <login-card header-color="red">
                    <h4 slot="title" class="card-title">
                      Welcome to Happyhouse!
                    </h4>
                    <p slot="description" class="description">
                      Or Be Classical
                    </p>
                    <md-field class="md-form-group" slot="inputs">
                      <md-icon>man</md-icon>
                      <label>아이디 입력...</label>
                      <md-input v-model="user.id" type="id"></md-input>
                    </md-field>
                    <md-field class="md-form-group" slot="inputs">
                      <md-icon>lock_outline</md-icon>
                      <label>비밀번호 입력...</label>
                      <md-input
                        v-model="user.password"
                        type="password"
                      ></md-input>
                    </md-field>
                    <md-field class="md-form-group" slot="inputs">
                      <md-icon>lock_outline</md-icon>
                      <label>비밀번호 확인...</label>
                      <md-input
                        v-model="userpwdConfirm"
                        type="password"
                      ></md-input>
                    </md-field>
                    <md-field class="md-form-group" slot="inputs">
                      <md-icon>man</md-icon>
                      <label>이름 입력...</label>
                      <md-input v-model="user.name" type="text"></md-input>
                    </md-field>
                    <md-field class="md-form-group" slot="inputs">
                      <md-icon>email</md-icon>
                      <label>이메일 입력...</label>
                      <md-input v-model="user.email" type="email"></md-input>
                    </md-field>
                    <md-button
                      slot="footer"
                      @click="register"
                      class="md-simple md-success md-lg"
                    >
                      가입하기
                    </md-button>
                    <md-button
                      slot="footer"
                      @click="swapJoinusMode"
                      class="md-simple md-success md-lg"
                    >
                      로그인 창으로
                    </md-button>
                    <md-button
                      slot="footer"
                      @click="swapModalOn"
                      class="md-simple md-success md-lg"
                    >
                      창 닫기
                    </md-button>
                  </login-card>
                </div>
              </div>
            </div>
  </div>
</template>

<script>
import { mapActions, mapMutations, mapState } from "vuex";
import { LoginCard } from "@/components/user";

const memberStore = "memberStore";

export default {
  components: {
    LoginCard
  },
  bodyClass: "login-page",
  data() {
    return {
      modalOn: true,
      joinusMode: false,
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
  props: {
    header: {
      type: String,
      default: require("@/assets/img/profile_city.jpg")
    }
  },
  computed: {
    ...mapState(memberStore, ["isLogin", "isLoginError", "isSignipError"]),
    headerStyle() {
      return {
        backgroundImage: `url(${this.header})`
      };
    }
  },
  methods: {
    ...mapMutations(memberStore, ["SET_IS_SIGNUP_ERROR"]),
    ...mapActions(memberStore, [
      "userConfirm",
      "getUserInfo",
      "registerMember",
      "logoutMember"
    ]),
    async confirm() {
      await this.userConfirm(this.user);
      let token = sessionStorage.getItem("access-token");
      console.log(this.user);
      console.log(this.isLogin);
      if (this.isLogin) {
        await this.getUserInfo(token);
        this.$router.go("this.$router.currentRoute");
      }
    },
    logout() {
      this.logoutMember();
    },

    pwCheck() {
      console.log(this.user.password);
      if (this.user.password == this.userpwdConfirm) {
        this.pwMatches = true;
      } else {
        this.pwMatches = false;
      }
    },
    async register() {
      console.log("회원가입 버튼 눌렸음");
      this.pwCheck();
      if (this.pwMatches) {
        console.log(this.user);
        await this.registerMember(this.user);
        if (this.isSignupError == false) {
          alert("가입을 환영합니다!");
        }
        this.movePage();
      }
    },
    swapJoinusMode() {
      this.joinusMode = !this.joinusMode;
    },
    swapModalOn() {
      this.modalOn = !this.modalOn;
    },
    movePage() {
      this.$router.go("this.$router.currentRoute");
    },
    openModal() {
      this.modalOn = true;
    },
    closeModal() {
      this.modalOn = false;
    }
  }
};
</script>

<style lang="css">
.modal-container {
  width: 33%;
}
.modal-bg {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 2000;
  /* width: 100vw;
  height: 100vh; */
  background: rgba(0, 0, 0, 0.3);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
</style>
