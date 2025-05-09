<template>
  <ParentLayout>
    <template #page>
      <SplitLayout v-if="$page.path !== '/'" />
      <Content v-else />
    </template>
  </ParentLayout>
</template>

<script>
import ParentLayout from '@parent-theme/layouts/Layout.vue'
import SplitLayout from '../components/SplitLayout.vue'

export default {
  components: {
    ParentLayout,
    SplitLayout
  }
}
</script>
