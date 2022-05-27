import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex);

import memberStore from "@/store/modules/memberStore.js";
import boardStore from "@/store/modules/boardStore.js";
import houseStore from "@/store/modules/houseStore.js";
import todoStore from "@/store/modules/todoStore.js";
import qnaStore from "@/store/modules/qnaStore.js";
import newsStore from "@/store/modules/newsStore.js";
const store = new Vuex.Store({
  modules: {
    memberStore,
    boardStore,
    houseStore,
    todoStore,
    qnaStore,
    newsStore
  },
  plugins: [
    createPersistedState({
      // 브라우저 종료시 제거하기 위해 localStorage가 아닌 sessionStorage로 변경. (default: localStorage)

      storage: sessionStorage
    })
  ]
});

export default store;
