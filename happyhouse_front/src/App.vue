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

<style>
.flex-row {
  display: flex;
  width: 100%;
}

.gap-item {
  gap: 1rem;
}

.flex-column {
  display: flex;
  flex-direction: column;
}
.app-container {
  background: rgb(100, 100, 100);
  padding: 1rem;
}
.view-container {
  width: 100%;
  min-height: 100vh;
  background: rgb(255, 255, 255);
}
</style>
