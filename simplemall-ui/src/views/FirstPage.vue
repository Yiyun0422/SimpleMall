<template>
    <div class="block text-center">
    <span class="demonstration">
      专业选品，品质保障，您的首选
    </span>
    <el-divider />
    <el-carousel height="400px" style="width: 800px; margin-left: 80px;">
      <el-carousel-item v-for="item in 4" :key="item">
        <h3 class="small justify-center" text="2xl">{{ item }}</h3>
      </el-carousel-item>
    </el-carousel>
  </div>
</template>

<script>
export default {
  name: 'FirstPage'
};
</script>

<style scoped>
.demonstration {
  font-family: "Microsoft YaHei, sans-serif";
  font-weight: bold; /* 设置字体加粗 */
  text-align: right; /* 将文本靠右对齐 */
}

.el-carousel__item h3 {
  color: #475669;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
  text-align: center;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
</style>