<template>
  <div class="wrapper" v-if="(modalOn == true) & (joinusMode == false)">
    <div class="section page-header header-filter" :style="headerStyle">
      <div class="container">
        <div class="md-layout">
          <div
            class="md-layout-item md-size-33 md-small-size-66 md-xsmall-size-100 md-medium-size-40 mx-auto"
          >
            <login-card header-color="red">
              <h4 slot="title" class="card-title">Log in</h4>
              <p slot="description" class="description">Or Be Classical</p>
              <md-field class="md-form-group" slot="inputs">
                <md-icon>man</md-icon>
                <label>아이디 입력...</label>
                <md-input v-model="user.userid" type="id"></md-input>
              </md-field>
              <md-field class="md-form-group" slot="inputs">
                <md-icon>lock_outline</md-icon>
                <label>비밀번호 입력...</label>
                <md-input
                  v-model="user.userpwd"
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
                @click="movePage"
                class="md-simple md-success md-lg"
              >
                Join us
              </md-button>
            </login-card>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="wrapper" v-else if="modalOn == true & joinusMode== true">
    <div class="section page-header header-filter" :style="headerStyle">
      <div class="container">
        <div class="md-layout">
          <div
            class="md-layout-item md-size-33 md-small-size-66 md-xsmall-size-100 md-medium-size-40 mx-auto"
          >
            <login-card header-color="red">
              <h4 slot="title" class="card-title">Log in</h4>
              <p slot="description" class="description">Or Be Classical</p>
              <md-field class="md-form-group" slot="inputs">
                <md-icon>man</md-icon>
                <label>아이디 입력...</label>
                <md-input v-model="user.userid" type="id"></md-input>
              </md-field>
              <md-field class="md-form-group" slot="inputs">
                <md-icon>lock_outline</md-icon>
                <label>비밀번호 입력...</label>
                <md-input v-model="user.userpwd" type="password"></md-input>
              </md-field>
              <md-field class="md-form-group" slot="inputs">
                <md-icon>man</md-icon>
                <label>이름 입력...</label>
                <md-input v-model="user.username" type="text"></md-input>
              </md-field>
              <md-field class="md-form-group" slot="inputs">
                <md-icon>email</md-icon>
                <label>이메일 입력...</label>
                <md-input v-model="user.useremail" type="email"></md-input>
              </md-field>
              <md-button
                slot="footer"
                @click="confirm"
                class="md-simple md-success md-lg"
              >
                가입하기
              </md-button>
              <md-button
                slot="footer"
                @click="movePage"
                class="md-simple md-success md-lg"
              >
                로그인 창으로
              </md-button>
            </login-card>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { LoginCard } from "@/components/user";
import { mapState, mapActions } from "vuex";

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
        username: null,
        useremail: null,
        userid: null,
        userpwd: null
      }
    };
  },
  props: {
    header: {
      type: String,
      default: require("@/assets/img/profile_city.jpg")
    }
  },
  computed: {
    ...mapState(memberStore, ["isLogin", "isLoginError"]),
    headerStyle() {
      return {
        backgroundImage: `url(${this.header})`
      };
    }
  },
  methods: {
    ...mapActions(memberStore, ["userConfirm", "getUserInfo"]),
    async confirm() {
      await this.userConfirm(this.user);
      let token = sessionStorage.getItem("access-token");
      if (this.isLogin) {
        await this.getUserInfo(token);
        this.$router.push({ name: "" });
      }
    },
    movePage() {
      this.joinusMode = !this.joinusMode;
    }
  }
};
</script>

<style lang="css"></style>
