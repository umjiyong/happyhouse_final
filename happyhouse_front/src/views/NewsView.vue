<template>
  <div class="col-10 p-3 pt-0 ps-0">
    <div class="p-5 rounded shadow-sm border">
      <ul class="py-4 px-5 rounded shadow-sm border">
        <li
          class="deco mb-2 margin-bottom"
          v-for="(item, idx) in newsList"
          :key="idx"
        >
          <a :href="item.articleUrl" target="_black">
            <img :src="item.imgUrl" :alt="item.idx" />
            <span class="margin-left"> {{ item.title }} </span>
          </a>
        </li>
      </ul>
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
        imgUrl: null
      }
    };
  },
  created() {
    this.loadFile();
  },
  computed: {
    ...mapState(newsStore, ["newsList"])
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
    gotolink() {}
  }
};
</script>

<style>
.margin-bottom {
  margin-bottom: 20px;
}
.margin-left {
  margin-left: 20px;
}
</style>
