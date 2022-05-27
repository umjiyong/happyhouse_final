import { getNews } from "@/api/news.js";

const newsStore = {
  namespaced: true,
  state: {
    newsList: [],
    news: {}
  },
  actions: {
    getNewsList: ({ commit }) => {
      getNews(
        ({ data }) => {
          console.log(data);
          commit("SET_NEWS_LIST", data);
        },
        error => {
          console.log(error);
        }
      );
    }
  },
  mutations: {
    SET_NEWS_LIST: (state, newslist) => {
      state.newsList = newslist;
    }
  }
};

export default newsStore;
