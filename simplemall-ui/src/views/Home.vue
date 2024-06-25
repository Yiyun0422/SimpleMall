<script setup>
import TheWelcome from '../components/TheWelcome.vue'
</script>

<template>
  <main>
    <CommonLayout> 
      <TheWelcome />
    </CommonLayout>
   
  </main>
</template>
<script>
  import CommonLayout from '@/components/CommonLayout.vue';
  
  export default {
    name: 'FirstPage',
    components: {
      CommonLayout
    }
  };
  </script>