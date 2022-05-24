<template>
  <div id="material-kit">
    <div :class="{ 'nav-open': NavbarStore.showNavbar }">
      <div class="main main-raised">
        <router-view />
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>
