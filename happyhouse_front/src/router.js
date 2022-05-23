import Vue from "vue";
import Router from "vue-router";
import Main from "./views/MainView.vue";
import MainNavbar from "./layout/MainNavbar.vue";
import MainFooter from "./layout/MainFooter.vue";
import HouseView from "@/views/HouseView.vue";
import HouseDeal from "@/components/house/HouseDeal";
Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      name: "main",
      components: { default: Main, header: MainNavbar, footer: MainFooter },
      props: {
        header: { colorOnScroll: 200 },
        footer: { backgroundColor: "black" },
      },
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
          component: HouseDeal,
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
