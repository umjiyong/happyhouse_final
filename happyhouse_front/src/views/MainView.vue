<template>
  <div>
    
    <div id="javascriptComponents">
      <div class="title">
        <h3>오늘의 아파트FC 매치 업</h3>
      </div>
      <div class="md-layout">
        <div class="md-layout-item md-size-66 mx-auto md-small-size-100">
          <md-card>
            <carousel
              :per-page="1"
              loop
              :speed="700"
              autoplay
              :autoplay-timeout="5000"
              :mouse-drag="false"
              navigationEnabled
              navigationNextLabel="<i class='material-icons'>keyboard_arrow_right</i>"
              navigationPrevLabel="<i class='material-icons'>keyboard_arrow_left</i>"
            >
              <slide>
                <div class="carousel-caption " @click="movePage">
                  <h4>
                    <md-icon>apartment</md-icon>
                    세종아파트 VS
                    <md-icon>apartment</md-icon>
                    광화문풍림스페이스본
                  </h4>
                </div>
                <img :src="carousel1" alt="carousel1" @click="movePage" />
              </slide>
              <slide>
                <div class="carousel-caption">
                  <h4>
                    <md-icon>apartment</md-icon>
                    청운 현대 VS
                    <md-icon>apartment</md-icon>
                    청호 그린빌
                  </h4>
                </div>
                <img :src="carousel2" alt="carousel2" />
              </slide>
              <slide>
                <div class="carousel-caption">
                  <h4>
                    <md-icon>apartment</md-icon>
                    롯데미도파광화문빌딩 VS 
                    <md-icon>apartment</md-icon>
                    경희궁 파티팰리스
                  </h4>
                </div>
                <img :src="carousel3" alt="carousel3" />
              </slide>
            </carousel>
          </md-card>
        </div>
      </div>
    </div>


    
  </div>

  
</template>

<script>


export default {
  
  data() {
    return {
      carousel1: require("@/assets/img/nature.jpg"),
      carousel2: require("@/assets/img/nature-2.jpg"),
      carousel3: require("@/assets/img/nature-3.jpg")
    };
  },
  methods: {
    movePage() {
      alert("으악");
      this.$router.go("this.$router.currentRoute");
    }
  }
};
</script>

<style lang="css"></style>
