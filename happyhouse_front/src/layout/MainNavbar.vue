<template>
  <div>
    <md-toolbar
      id="toolbar"
      md-elevation="0"
      class="md-absolute justify-start bg-happyhouse"
      :class="extraNavClasses"
      :color-on-scroll="colorOnScroll"
    >
      <div class="md-toolbar-column md-collapse-lateral align-left">
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
          <md-button
            class="md-just-icon md-simple md-toolbar-toggle"
            :class="{ toggled: toggledClass }"
            @click="toggleNavbarMobile()"
          >
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </md-button>

          <div class="md-collapse">
            <div class="md-collapse-wrapper">
              <md-list>
                <li class="md-list-item" v-if="!showDownload">
                  <a
                    href="javascript:void(0)"
                    class="md-list-item-router md-list-item-container md-button-clean dropdown"
                  >
                    <div class="md-list-item-content">
                      <drop-down direction="down">
                        <md-button
                          slot="title"
                          class="md-button md-button-link md-white md-simple dropdown-toggle"
                          data-toggle="dropdown"
                        >
                          <i class="material-icons">apps</i>
                          <p>Components</p>
                        </md-button>
                        <ul class="dropdown-menu dropdown-with-icons">
                          <li>
                            <a href="#/">
                              <i class="material-icons">layers</i>
                              <p>All Components</p>
                            </a>
                          </li>
                          <li>
                            <a
                              href="https://demos.creative-tim.com/vue-material-kit/documentation/"
                            >
                              <i class="material-icons">content_paste</i>
                              <p>Documentation</p>
                            </a>
                          </li>
                        </ul>
                      </drop-down>
                    </div>
                  </a>
                </li>

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
                    <p>QnA</p>
                  </router-link>
                </md-list-item>

                <md-list-item v-if="isLogin == false" @click="ShowUserModalOn">
                  <i class="material-icons">login</i>
                  <p class="margin-free">로그인</p>
                </md-list-item>
                <div class=" user-box" v-if="isLogin == true">
                  <img
                    src="../assets/img/faces/avatar.jpg"
                    class="avatar img-raised rounded-circle img-fluid imagecustom"
                  />
                  <div>
                    {{ userInfo.name }}({{ userInfo.id }})님 환영합니다.
                  </div>
                </div>
                <md-list-item v-if="isLogin == true" @click="ShowMypageModalOn">
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
.left {
  align-self: right;
}
.imagecustom {
  width: 50px;
  margin-right: 10px;
}
.imagelogo {
  width: 150px;
  margin-left: 10px;
}
.user-box {
  font-size: 0.9rem;
  display: flex;
  align-items: center;
}
</style>
