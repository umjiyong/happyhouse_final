import Vue from "vue";
import Router from "vue-router";
import Main from "./views/MainView.vue";
import MainNavbar from "./layout/MainNavbar.vue";
import MainFooter from "./layout/MainFooter.vue";
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
      component: () => import("@/views/HouseView.vue"),
      redirect: "/house/search",
      children: [
        {
          path: "search",
          name: "houseSearch",
          component: () => import("@/components/house/HouseSearch.vue"),
        },
        {
          path: "detail",
          name: "houseDetail",
          component: () => import("@/components/house/HouseDetail.vue"),
        },
      ],
    },
    {
      path: "/qna",
      name: "qnaView",
      component: () => import("@/views/QnaView.vue"),
      redirect: "/qna/list",
      children: [
        {
          path: "list",
          name: "qnaList",
          component: () => import("@/components/qna/QnaList.vue"),
        },
        {
          path: "regist",
          name: "questionRegist",
          component: () => import("@/components/qna/QuestionRegist.vue"),
        },
        {
          path: "update",
          name: "questionUpdate",
          component: () => import("@/components/qna/QuestionUpdate.vue"),
        },
        {
          path: ":q_id",
          name: "qnaPage",
          component: () => import("@/components/qna/QnaPage.vue"),
        },
      ],
    },
  ],
  scrollBehavior: (to) => {
    if (to.hash) {
      return { selector: to.hash };
    } else {
      return { x: 0, y: 0 };
    }
  },
});
