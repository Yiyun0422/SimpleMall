<template>
  <el-card style="max-width: 100%; min-height: 700px; height: auto;">
    <template #header>
      <div class="card-header">
        <!-- 表头 -->
        <p><b>商品信息列表</b></p>
        <!-- 搜索条 -->
        <div class="search-position">
          &nbsp;&nbsp; &nbsp;&nbsp;商品名称：
          <el-input v-model="productName" style="width: 240px" placeholder="请输入商品名称" />&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp; &nbsp;&nbsp;商品类别：
          <el-select v-model="productCategory" style="width: 240px" placeholder="请选择商品类别">
            <el-option v-for="category in categories" :key="category.categoryId" :label="category.cname"
              :value="category.categoryId" />
          </el-select>&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp; &nbsp;&nbsp;价格区间：
          <el-input v-model="minPrice" style="width: 100px" placeholder="最低价" />&nbsp;&nbsp;
          <span>-</span> &nbsp;
          <el-input v-model="maxPrice" style="width: 100px" placeholder="最高价" />&nbsp;&nbsp;&nbsp;&nbsp;
          <el-button @click="handleSearch" type="primary">搜索</el-button>
          <el-button @click="handleReset">重置</el-button>
        </div>
      </div>
    </template>

    <div>
      <!-- 数据源 -->
      <el-table :data="products" style="width: 100%">
        <el-table-column prop="productId" label="编号" width="200" align="center"></el-table-column>
        <el-table-column prop="pimg" label="图片" width="200" align="center">
          <template #default="scope">
            <img :src="scope.row.pimg" alt="Product Image" width="50" height="50" />
          </template>
        </el-table-column>
        <el-table-column prop="pname" label="名称" align="center"></el-table-column>
        <el-table-column prop="pprice" label="价格" align="center"></el-table-column>
        <el-table-column prop="pnumber" label="库存" align="center"></el-table-column>
        <el-table-column prop="pcategory" label="类别" align="center">
          <template #default="scope">
            {{ getCategoryName(scope.row.pcategory) }}
          </template>
        </el-table-column>
        <el-table-column label="操作" width="150" align="center">
          <!-- 定义一个插槽，scope获取上下文操作，scope.row获取其中的行对象 -->
          <template #default="scope">
            <el-button type="text" icon="el-icon-edit" @click="editProduct(scope.row.productId)">编辑</el-button>
            <el-button type="text" icon="el-icon-delete" @click="deleteProduct(scope.row.productId)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </el-card>
  <!-- 分页 -->
  <div style="text-align: center; margin-top: 20px;" class="page-position">
    <el-pagination background layout="prev, pager, next" :total="total" :page-size="pageSize"
      @current-change="handlePageChange" />
  </div>
</template>

<script>
import { fetchProducts, searchProducts, deleteProduct } from '@/api/ProductsList';
import {searchCategories} from '@/api/category'

export default {
  name: 'ProductList',
  data() {
    return {
      products: [],
      total: 0, // 初始化为0
      pageSize: 7, // 每页显示的数据条数
      currentPage: 1, // 当前页码
      productName: '',
      productCategory: '',
      minPrice: null,
      maxPrice: null,
      categories: []
    };
  },

  // 自动进程，获取商品类别需要提前加载
  created() {
    this.getCategories();
  },

  methods: {
    // 传入加载页码，加载该页数据（单页加载数据为7条）
    async loadProducts(page) {
      try {
        // 这里加载所有数据，只需要传入页码和每页显示的数据就行
        // 用response封装，为纯粹的JSON格式数据元素
        const response = await fetchProducts({ page, pageSize: this.pageSize });
        this.products = response.data.rows; // 更新商品数据
        this.total = response.data.total; // 更新总数
      } catch (error) {
        this.$message.error(error.message);
      }
    },

    // 条件搜索查询
    async handleSearch() {
      try {
        // 传入条件进行相关查询
        const response = await searchProducts({
          page: this.currentPage,
          pageSize: this.pageSize,
          pname: this.productName,
          pcategory: this.productCategory,
          minPrice: this.minPrice,
          maxPrice: this.maxPrice,
        });
        this.products = response.data.rows;
        this.total = response.data.total;
      } catch (error) {
        this.$message.error(error.message);
      }
    },

    // 获取商品类别
    async getCategories() {
      try {
        const response = await searchCategories();
        if (response.code !== 1) {
          throw new Error(response.msg || 'Failed to fetch categories');
        }
        this.categories = response.data.map(item => ({
          categoryId: item.categoryId,
          cname: item.cname
        }));
      } catch (error) {
        this.$message.error(error.message);
      }
    },

    // 根据类别 ID 获取类别名称
    getCategoryName(categoryId) {
      const category = this.categories.find(c => c.categoryId === categoryId);
      return category ? category.cname : '';
    },

    // 重置，将所有内容重置为空字符串，并加载当前页面
    handleReset() {
      this.productName = '';
      this.productCategory = '';
      this.minPrice = null;
      this.maxPrice = null;
      this.loadProducts(this.currentPage);
    },

    //翻页操作，获取当前页码，并重新加载
    handlePageChange(page) {
      this.currentPage = page;
      this.loadProducts(this.currentPage);
    },

    // 删除数据
    async deleteProduct(productId) {
      try {
        // 使用 ElMessageBox 确认对话框
        this.$confirm(
          '此操作将永久删除该商品, 是否继续?',
          '提示',
          {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning',
          }
        )
          .then(async () => {
            // 如果点击确定，则执行删除操作
            await deleteProduct(productId);
            this.$message.success('删除成功');
            this.loadProducts(this.currentPage);
          })
          .catch(() => {
            // 点击取消
            this.$message.info('已取消删除');
          });
      } catch (error) {
        this.$message.error(error.message);
      }
    },


    // 进入编辑表单
    editProduct(productId) {
      if (!productId) {
        console.error('Missing productId');
        return;
      }
      console.log('Navigating to ProductEdit with id:', productId);
      this.$router.push({ name: 'ProductEdit', params: { id: productId } });
    }
  },

  // 操作完成后加载数据
  mounted() {
    this.loadProducts(this.currentPage);
  }
};
</script>

<style scoped>
img {
  display: block;
  margin: 0 auto;
}

.page-position {
  position: absolute;
  right: 100px;
}

.search-position {
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>