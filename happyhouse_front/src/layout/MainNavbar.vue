<template>
  <div>
    <md-toolbar
      id="toolbar"
      md-elevation="0"
      class="md-absolute justify-start bg-happyhouse"
      :class="extraNavClasses"
      :color-on-scroll="colorOnScroll"
    >
      <div
        class="md-toolbar-column md-collapse-lateral align-left header-container"
      >
        <div class="md-toolbar-section-start">
          <router-link :to="{ name: 'main' }">
            <h3 class="md-title"></h3>
          </router-link>
        </div>
        <div>
          <router-link :to="{ name: 'main' }">

            <div>
              <img
                src="../assets/img/faces/logotest2.png"
                class="rounded img-fluid imagelogo"
              />

            </div>
          </router-link>
        </div>
        <div class="md-toolbar-section-end">
          <!--router-link-->
          <div class="flex-row menu-container">
            <md-list>
                <!--router-link-->
                <md-list-item v-if="showDownload">
                  <router-link :to="{ name: 'houseView' }">
                    <i class="material-icons">house</i>
                    <p>아파트</p>
                  </router-link>
                </md-list-item>

                <md-list-item v-if="showDownload">
                  <router-link :to="{ name: 'qnaView' }">
                    <i class="material-icons">help</i>
                    <p>Q&A</p>
                  </router-link>
                </md-list-item>

                <md-list-item v-if="isLogin == false" @click="ShowUserModalOn">
                  <i class="material-icons">login</i>
                  <p class="margin-free">로그인</p>
                </md-list-item>

                <div class="user-box" v-if="isLogin == true">
                  <img
                    src="../assets/img/faces/avatar.jpg"
                    class="avatar img-raised rounded-circle img-fluid imagecustom"
                  />
                  <div>
                    {{ userInfo.name }}({{ userInfo.id }})님 환영합니다.
                  </div>
                </div>
                <md-list-item v-if="isLogin == true" @click="ShowMypageModalOn">
                  <p class="margin-right">
                    {{ userInfo.name }}({{ userInfo.id }})님 환영합니다.
                  </p>
                  <i class="material-icons">man</i>
                  <p class="margin-free">마이페이지</p>
                </md-list-item>

                <md-list-item @click="logout" v-if="isLogin == true">
                  <i class="material-icons">login</i>
                  <p class="margin-free">로그아웃</p>
                </md-list-item>
              </md-list>
              <md-list></md-list>
            </div>
          </div>
        </div>
      
    </md-toolbar>
    <mypage-view-modal v-if="ShowMypageModal" @closemodal="CloseModal" />
    <user-view-modal v-if="ShowUserModal" @closemodal="CloseModal" />
  </div>
</template>

<script>
let resizeTimeout;
function resizeThrottler(actualResizeHandler) {
  // ignore resize events as long as an actualResizeHandler execution is in the queue
  if (!resizeTimeout) {
    resizeTimeout = setTimeout(() => {
      resizeTimeout = null;
      actualResizeHandler();

      // The actualResizeHandler will execute at a rate of 15fps
    }, 66);
  }
}
import { mapActions, mapState } from "vuex";
import MypageViewModal from "../views/MypageViewModal.vue";
import UserViewModal from "../views/UserViewModal.vue";

const memberStore = "memberStore";
export default {
  components: { UserViewModal, MypageViewModal },
  props: {
    type: {
      type: String,
      default: "white",
      validator(value) {
        return [
          "white",
          "default",
          "primary",
          "danger",
          "success",
          "warning",
          "info",
        ].includes(value);
      },
    },
    colorOnScroll: {
      type: Number,
      default: 1,
    },
  },
  data() {
    return {
      ShowUserModal: false,
      ShowMypageModal: false,
      extraNavClasses: "",
      toggledClass: false,
    };
  },

  computed: {
    ...mapState(memberStore, ["isLogin", "userInfo"]),
    showDownload() {
      const excludedRoutes = ["login", "landing", "profile"];
      return excludedRoutes.every((r) => r !== this.$route.name);
    },
  },
  methods: {
    ...mapActions(memberStore, ["logoutMember"]),
    logout() {
      this.logoutMember();
      this.$router.go("this.$router.currentRoute");
    },
    bodyClick() {
      let bodyClick = document.getElementById("bodyClick");

      if (bodyClick === null) {
        let body = document.querySelector("body");
        let elem = document.createElement("div");
        elem.setAttribute("id", "bodyClick");
        body.appendChild(elem);

        let bodyClick = document.getElementById("bodyClick");
        bodyClick.addEventListener("click", this.toggleNavbarMobile);
      } else {
        bodyClick.remove();
      }
    },
    toggleNavbarMobile() {
      this.NavbarStore.showNavbar = !this.NavbarStore.showNavbar;
      this.toggledClass = !this.toggledClass;
      this.bodyClick();
    },
    handleScroll() {
      let scrollValue =
        document.body.scrollTop || document.documentElement.scrollTop;
      let navbarColor = document.getElementById("toolbar");
      this.currentScrollValue = scrollValue;
      if (this.colorOnScroll > 0 && scrollValue > this.colorOnScroll) {
        this.extraNavClasses = `md-${this.type}`;
        navbarColor.classList.remove("md-transparent");
      } else {
        if (this.extraNavClasses) {
          this.extraNavClasses = "";
          navbarColor.classList.add("md-transparent");
        }
      }
    },
    scrollListener() {
      resizeThrottler(this.handleScroll);
    },
    scrollToElement() {
      let element_id = document.getElementById("downloadSection");
      if (element_id) {
        element_id.scrollIntoView({ block: "end", behavior: "smooth" });
      }
    },
    ShowUserModalOn() {
      this.ShowUserModal = true;
    },
    ShowMypageModalOn() {
      this.ShowMypageModal = true;
    },
    CloseModal() {
      this.ShowUserModal = false;
      this.ShowMypageModal = false;
    },
  },
  mounted() {
    document.addEventListener("scroll", this.scrollListener);
  },
  beforeDestroy() {
    document.removeEventListener("scroll", this.scrollListener);
  },
};
</script>

<style scoped>
.justify-start {
  justify-content: flex-start;
}
.bg-happyhouse {
  background-color: rgba(191, 59, 59, 1) !important;
}
.margin-free {
  margin: 0;
  margin-left: 5px;
}
.header-container {
  width: 100%;
}
.margin-zero {
  margin: 0;
}
.left {
  align-self: right;
}
.imagecustom {
  width: 50px;
  margin-right: 10px;
}
.imagelogo {
  width: 120px;

  margin-left: 10px;
}
.margin-right {
  margin: 0;
  margin-right: 5px;
}
.user-box {
  font-size: 0.9rem;
  display: flex;
  align-items: center;

}
.menu-container {
  width: 100%;
  justify-content: space-between;
}
</style>
