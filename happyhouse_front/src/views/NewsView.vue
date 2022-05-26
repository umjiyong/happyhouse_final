<template>
  <div class="news-container">
    <div class="p-5 rounded shadow-sm border">
      <div class="flex-column gap-item">
        <div class="news-box" v-for="(item, idx) in newsList" :key="idx">
          <a :href="item.articleUrl" target="_black">
            <img class="news-img" :src="item.imgUrl" :alt="item.idx" />
            <span class="margin-left news-title"> {{ item.title }} </span>
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapMutations, mapState } from "vuex";

const newsStore = "newsStore";

export default {
  data() {
    return {
      news: {
        idx: 0,
        title: null,
        articleUrl: null,
        imgUrl: null,
      },
    };
  },
  created() {
    this.loadFile();
  },
  computed: {
    ...mapState(newsStore, ["newsList"]),
  },
  methods: {
    ...mapMutations(newsStore, ["SET_NEWS_LIST"]),
    ...mapActions(newsStore, ["getNewsList"]),
    loadFile() {
      console.log("요기");
      this.getNewsList();
      console.log("조기");
      console.log(this.newsList);
    },
    gotolink() {},
  },
};
</script>

<style>
.news-container {
  background: rgba(200, 200, 200, 0.3);
}
.margin-bottom {
  margin-bottom: 20px;
}
.margin-left {
  margin-left: 20px;
}
.news-box {
  border: 1px solid rgba(100, 100, 100, 0.5);
  background: #fff;
  padding: 1rem;
}
.news-img {
  width: 100px;
}
.news-title {
  color: rgba(50, 50, 50, 0.8);
  font-weight: 600;
}
</style>
