<template>
  <!-- 使用通用布局组件 -->
  <CommonLayout>
    <!-- 路由视图，用于显示匹配的组件 -->
    <router-view></router-view>
  </CommonLayout>
</template>

<script>
import CommonLayout from './components/CommonLayout.vue';

export default {
  name: 'App',
  components: {
    CommonLayout,
  }
};
</script>

<style>

</style>
