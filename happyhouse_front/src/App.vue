<template>
  <div id="material-kit">
    <div :class="{ 'nav-open': NavbarStore.showNavbar }">
      <!-- <router-view name="header" /> -->
      <div>
        <div class="main main-raised">
          <router-view />
        </div>
      </div>
      <!-- <router-view name="footer" /> -->
    </div>
  </div>
</template>

<script>
export default {};
</script>
