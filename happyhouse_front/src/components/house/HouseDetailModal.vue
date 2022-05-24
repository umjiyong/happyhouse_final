<template>
  <div class="modal-background">
    <button @click="closeModal">X</button>
    <div class="modal-container" v-if="houseInfo1">
      <div>
        <h5>Hello Detail</h5>
        <h4>{{ houseInfo1.aptName }}</h4>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  computed: {
    ...mapState("houseStore", ["houseInfo1"]),
  },
  mounted() {
    console.log("modal mounted : " + this.houseInfo1);
  },
  methods: {
    closeModal() {
      this.$emit("closeModal");
    },
  },
};
</script>

<style>
.modal-background {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;

  z-index: 2000;
  /* width: 100vw;
  height: 100vh; */
  background: rgba(0, 0, 0, 0.3);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.modal-container {
  width: 200px;
  height: 150px;
  background: white;
}
</style>
