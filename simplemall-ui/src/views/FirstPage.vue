<template>
  <div class="block text-center">
    <span class="demonstration">
      专业选品，品质保障，您的首选
    </span>
    <el-divider />
    <el-carousel height="500px" style="width: 90%; height: 70%; margin: 100px auto 0;">
      <el-carousel-item>
        <img src="../assets/images/404NotFoundPage.png" alt="1" class="carousel-image" />
      </el-carousel-item>

      <el-carousel-item>
        <img src="../assets/images/404NotFoundPage.png" alt="2" class="carousel-image" />
      </el-carousel-item>

      <el-carousel-item>
        <img src="../assets/images/404NotFoundPage.png" alt="3" class="carousel-image" />
      </el-carousel-item>

      <el-carousel-item>
        <img src="../assets/images/404NotFoundPage.png" alt="4" class="carousel-image" />
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
  font-family: "Microsoft YaHei", sans-serif;
  font-weight: bold; /* 设置字体加粗 */
  text-align: right; /* 将文本靠右对齐 */
}

.el-carousel__item {
  display: flex;
  justify-content: center;
  align-items: center;
}

.carousel-image {
  max-width: 100%;
  max-height: 100%;
  object-fit: cover;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
</style>
