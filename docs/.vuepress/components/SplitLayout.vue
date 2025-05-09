<template>
  <div class="split-layout">
    <Content class="content-with-sidebar" />
    <RightSidebar />
  </div>
</template>

<script>
import RightSidebar from './RightSidebar.vue'

export default {
  components: {
    RightSidebar
  }
}
</script>

<style>
.split-layout {
  position: relative;
  padding-right: 18rem;
}

.content-with-sidebar {
  max-width: 740px;
  margin: 0 auto;
  padding: 2rem 2.5rem;
}

@media (max-width: 1300px) {
  .split-layout {
    padding-right: 0;
  }
}
</style>
