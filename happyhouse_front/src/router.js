import Vue from "vue";
import Router from "vue-router";
import Main from "./views/MainView.vue";
import MainNavbar from "./layout/MainNavbar.vue";
import MainFooter from "./layout/MainFooter.vue";
import HouseView from "@/views/HouseView.vue";
import HouseDeal from "@/components/house/HouseDeal";
import MemberMyPage from "@/components/user/MemberMyPage";
Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      name: "main",
      components: { default: Main, header: MainNavbar, footer: MainFooter },
      props: {
        header: { colorOnScroll: 200 },
        footer: { backgroundColor: "black" }
      }
    },
    {
      path: "/user",
      name: "userView",
      component: () => import("@/views/UserView.vue"),
      children: [
        // {
        //   path: "singin",
        //   name: "signIn",
        //   component: () => import("@/components/user/MemberLogin.vue"),
        // },
        // {
        //   path: "singup",
        //   name: "signUp",
        //   component: () => import("@/components/user/MemberRegister.vue"),
        // },
        {
          path: "mypage",
          name: "mypage",
          // beforeEnter: onlyAuthUser,
          component: () => import("@/components/user/MemberMyPage.vue"),
        },
        {
          path: "update",
          name: "update",
          component: () => import("@/components/user/MemberUpdate.vue"),
        },
      ],
    },
    {
      path: "/house",
      name: "houseView",
      // components: { default: Main, header: MainNavbar, footer: MainFooter },
      component: HouseView,
      children: [
        {
          path: "deal",
          name: "houseDeal",
          component: HouseDeal
        }
      ]
    }
  ],
  scrollBehavior: to => {
    if (to.hash) {
      return { selector: to.hash };
    } else {
      return { x: 0, y: 0 };
    }
  }
});
