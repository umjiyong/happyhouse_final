<template>
  <md-card
    class="md-card-tabs"
    :class="[
      { 'flex-column': flexColumn },
      { 'nav-pills-icons': navPillsIcons },
      { 'md-card-plain': plain },
    ]"
  >
    <md-card-header slot="header-title"> </md-card-header>

    <md-card-content>
      <md-list class="nav-tabs  ">
        <div class="padding-box">
          <router-link
            v-for="(item, index) in tabName"
            :key="item.name"
            :to="{ name: item.comp }"
          >
            <md-list-item
              @click="switchPanel(item.name)"
              :class="[
                { active: isActivePanel(item.name) },
                { [getColorButton(colorButton)]: isActivePanel(item.name) },
              ]"
            >
              <p :class="[{ whiteFont: isActivePanel(item.name) }]">
                {{ item.name }}
              </p>
              <md-icon v-if="navPillsIcons">{{ tabIcon[index] }}</md-icon>
            </md-list-item>
          </router-link>
        </div>
      </md-list>

      <!-- <transition name="fade" mode="out-in">
        <div class="tab-content">
          <div
            :class="getTabContent(index + 1)"
            v-for="(item, index) in tabName"
            :key="item"
          >
            <slot :name="getTabContent(index + 1)">
              This is the default text!
            </slot>
          </div>
        </div>
      </transition> -->
    </md-card-content>
  </md-card>
</template>

<script>
export default {
  props: {
    flexColumn: Boolean,
    navPillsIcons: Boolean,
    plain: Boolean,
    tabName: Array,
    tabIcon: Array,
    colorButton: {
      type: String,
      default: "",
    },
  },
  data() {
    return {
      activePanel: this.tabName[0].name,
    };
  },
  methods: {
    switchPanel(panel) {
      this.activePanel = panel;
    },
    isActivePanel(panel) {
      return this.activePanel == panel;
    },
    getColorButton: function(colorButton) {
      return "md-" + colorButton + "";
    },
    getTabContent: function(index) {
      return "tab-pane-" + index + "";
    },
    printTabIcons() {
      console.log(this.tabIcon);
    },
  },
  updated() {
    this.printTabIcons();
  },
};
</script>

<style scoped>
.padding-box {
  background: white;
  border-radius: 5px;
}

.whiteFont {
  color: white;
}
</style>
