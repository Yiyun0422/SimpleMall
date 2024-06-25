<template>
  <div class="card-container">
    <el-card class="product-card">
      <template #header>
        <div class="card-header">
          <span><b>修改商品信息</b></span>
        </div>
      </template>
      <el-form :model="product" ref="productForm" label-width="120px" class="product-form">
        <!-- 商品图像 -->
        <el-form-item label="商品图像">
          <el-upload class="avatar-uploader" action="文件上传地址——阿里云oss" :show-file-list="false"
            :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
            <img v-if="imageUrl" :src="imageUrl" class="avatar" />
            <el-icon v-else class="avatar-uploader-icon">
              <Plus />
            </el-icon>
          </el-upload>
        </el-form-item>

        <!-- 商品名称 -->
        <el-form-item label="商品名称" :required="false">
          <el-input v-model="product.pname" placeholder="请输入商品名称"></el-input>
        </el-form-item>

        <!-- 商品品牌 -->
        <el-form-item label="商品品牌" :required="false">
          <el-input v-model="product.pbrand" placeholder="请输入商品品牌"></el-input>
        </el-form-item>

        <!-- 商品价格 -->
        <el-form-item label="商品价格" :required="false">
          <el-input v-model.number="product.pprice" placeholder="请输入商品价格" type="number"></el-input>
        </el-form-item>

        <!-- 商品库存 -->
        <el-form-item label="商品库存" :required="false">
          <el-input v-model.number="product.pnumber" placeholder="请输入商品库存" type="number"></el-input>
        </el-form-item>

        <!-- 商品类别 -->
        <el-form-item label="商品类别" :required="false">
          <el-select v-model="product.pcategory" placeholder="请选择商品类别">
            <el-option v-for="category in categories" :key="category.value" :label="category.label"
              :value="category.value" />
          </el-select>
        </el-form-item>

        <!-- 提交按钮 -->
        <el-form-item>
          <el-button type="primary" @click="submitForm">提交</el-button>
          <el-button @click="resetForm">清空</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>


<!-- vue3 的script定义方式，能够用于引入elementplus的icon -->
<script lang="ts" setup>
import { onMounted, ref } from 'vue';
import { ElMessage } from 'element-plus';
import { useRoute , useRouter } from 'vue-router';
import { Plus } from '@element-plus/icons-vue';
import type { UploadProps } from 'element-plus';
import { searchProductById, editproduct } from '@/api/ProductEdit';
import { searchCategories } from '@/api/category';

// TypeScript 中用来定义数据结构的关键字，定义一个数据类型的模板，用于描述对象的形状和结构
interface Product {
  productId: number;
  pname: string;
  pbrand: string;
  pprice: number | null;
  pnumber: number | null;
  pcategory: string;
  pimg?: string;
}

// ref : 组合式 API 模式，用于定义响应式数据
// 初始化一个 product 对象
const product = ref<Product>({
  productId: 0,
  pname: '',
  pbrand: '',
  pprice: null,
  pnumber: null,
  pcategory: '',
  pimg: ''
});

// 初始化类别列表
const categories = ref<{ value: string; label: string }[]>([]);

// 定义一个图片url，并赋初值为空字符串
const imageUrl = ref('');

// 获取路由对象
const route = useRoute();
// 获取 router 实例
const router = useRouter();  

// 获取商品 ID
const productId = parseInt(route.params.id as string);

// 初始化表单数据
onMounted(async () => {
  // 进入编辑表单
  try {
    // 调用 searchProductById 方法通过商品 id 获取商品数据
    const response = await searchProductById(productId);
    const passedProduct = response.data;  // 商品数据

    // 如果获取到商品数据，初始化表单
    if (passedProduct) {
      product.value = {
        productId: productId,
        pname: passedProduct.pname,
        pbrand: passedProduct.pbrand,
        pprice: passedProduct.pprice,
        pnumber: passedProduct.pnumber,
        pcategory: passedProduct.pcategory,
        pimg: passedProduct.pimg
      };
      imageUrl.value = passedProduct.pimg || '';
    }
  } catch (error) {
    // 如果获取商品数据失败，显示错误消息
    ElMessage.error('Failed to fetch product data');
  }

  // 动态获取商品类别
  try {
    // 调用 searchCategories 方法获取商品类别数据
    const response = await searchCategories();
    const categoryData = response.data; 
    categories.value = categoryData.map(item => ({
      value: item.categoryId, // 假设 categoryId 是类别ID
      label: item.cname // 假设 cname 是类别名称
    }));
  } catch (error) {
    // 如果获取类别数据失败，显示错误消息
    ElMessage.error('Failed to fetch categories');
  }
});

const handleAvatarSuccess: UploadProps['onSuccess'] = (uploadFile) => {
  imageUrl.value = URL.createObjectURL(uploadFile.raw!);
};

const beforeAvatarUpload: UploadProps['beforeUpload'] = (rawFile) => {
  if (rawFile.type !== 'image/jpeg' && rawFile.type !== 'image/png') {
    ElMessage.error('Avatar picture must be JPG or PNG format!');
    return false;
  } else if (rawFile.size / 1024 / 1024 > 2) {
    ElMessage.error('Avatar picture size can not exceed 2MB!');
    return false;
  }
  return true;
};

const submitForm = async () => {
  const formattedProduct = {
    productId: product.value.productId,
    pname: product.value.pname,
    pbrand: product.value.pbrand,
    pprice: product.value.pprice,
    pnumber: product.value.pnumber,
    pcategory: product.value.pcategory,
    pimg: product.value.pimg
  };
  try {
    const response = await editproduct(formattedProduct);
    if (response.code === 1) { // 确保 response 直接包含 code 属性
      ElMessage.success('修改成功!');
      router.push({ name: 'ProductList' }); // 使用组合 API 的 router 实例
    } else {
      ElMessage.error('表单提交失败，请重试。');
    }
  } catch (error) {
    ElMessage.error('表单提交失败，请重试。');
  }
};

const resetForm = () => {
  product.value = {
    productId: 0,
    pname: '',
    pbrand: '',
    pprice: null,
    pnumber: null,
    pcategory: '',
    pimg: ''
  };
  imageUrl.value = '';
};

</script>



<style scoped>
/* 主容器样式，使卡片容器居中显示 */
.card-container {
  display: flex;
  justify-content: center;
  /* 水平居中 */
  align-items: flex-start;
  /* 垂直靠上 */
  padding-top: 80px;
  /* 顶部内边距 */
  height: 100vh;
  /* 设置高度为视口高度 */
  box-sizing: border-box;
  /* 使 padding 包含在高度内 */
}

/* 卡片样式，设置宽度和最大宽度 */
.product-card {
  width: 100%;
  max-width: 800px;
}

/* 表单样式，设置宽度为 100% */
.product-form {
  width: 100%;
}

/* 卡片头部样式，使头部内容居中 */
.card-header {
  display: flex;
  justify-content: center;
  /* 水平居中 */
}

/* 商品图像上传组件的样式 */
.avatar-uploader .avatar {
  width: 178px;
  height: 178px;
  display: block;
}

/* 上传组件样式 */
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  /* 虚线边框 */
  border-radius: 6px;
  /* 圆角边框 */
  cursor: pointer;
  /* 指针样式 */
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
  /* 过渡效果 */
}

/* 上传组件悬停样式 */
.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
  /* 悬停时的边框颜色 */
}

/* 图标样式 */
.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  text-align: center;
  line-height: 178px;
  /* 水平垂直居中 */
}
</style>