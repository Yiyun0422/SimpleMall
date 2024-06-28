<template>
  <div class="container">
    <div>
      <!-- 表头 -->
      <div>
        <p><span class="header-title">订单信息列表</span></p>
      </div>
      <!-- 搜索条 -->
      <div class="search-position">
        用户编号：
        <el-input v-model="userId" style="width: 240px" placeholder="请输入用户编号" />&nbsp;&nbsp;&nbsp;
        <el-button @click="handleSearch" type="primary">搜索</el-button>
        <el-button @click="handleReset">重置</el-button>
      </div>
    </div>

    <hr class="divider">

    <div class="table-container">
      <!-- 数据源 -->
      <el-table :data="orders" style="width: 100%" border>
        <el-table-column prop="orderId" label="订单编号" width="150" align="center"></el-table-column>
        <el-table-column prop="userId" label="用户编号" width="150" align="center"></el-table-column>
        <el-table-column prop="productId" label="商品编号" width="150" align="center"></el-table-column>
        <el-table-column prop="uid" label="用户账号" align="center"></el-table-column>
        <el-table-column prop="pname" label="商品名称" align="center"></el-table-column>
        <el-table-column prop="orderTime" label="下单时间" align="center">
          <template #default="scope">
            {{ formatDate(scope.row.orderTime) }}
          </template>
        </el-table-column>
        <el-table-column prop="operateTime" label="操作时间" align="center">
          <template #default="scope">
            {{ formatDate(scope.row.operateTime) }}
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200" align="center">
          <template #default="scope">
            <el-button type="success" @click="sendOrder(scope.row.orderId)">发货</el-button>
            <el-button type="danger" @click="confirmCancelOrder(scope.row.orderId)">取消订单</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <!-- 分页卡片 -->
    <el-card class="pagination-card">
      <div class="page-position">
        <el-pagination
          background
          layout="prev, pager, next, sizes"
          :total="total"
          :page-size="pageSize"
          :page-sizes="[5, 10, 20, 50]"
          @current-change="handlePageChange"
          @size-change="handleSizeChange"
        />
      </div>
    </el-card>
  </div>
</template>

<script>
import { searchOrders, sendOrder, cancelOrder } from '@/api/OrderList';
import { ElMessageBox } from 'element-plus';

export default {
  name: 'OrderList',
  data() {
    return {
      orders: [],
      total: 0, // 初始化为0
      pageSize: 10, // 每页显示的数据条数
      currentPage: 1, // 当前页码
      userId: ''
    };
  },

  methods: {
    // 加载订单记录
    async loadOrders(page, pageSize) {
      try {
        const response = await searchOrders({ page, pageSize, uId: this.userId });
        this.orders = response.data.rows;  // 解析响应数据中的 rows
        this.total = response.data.total;  // 解析响应数据中的 total
      } catch (error) {
        this.$message.error(error.message);
      }
    },

    // 条件搜索查询
    async handleSearch() {
      try {
        const response = await searchOrders({
          page: this.currentPage,
          pageSize: this.pageSize,
          uId: this.userId
        });
        this.orders = response.data.rows;  // 解析响应数据中的 rows
        this.total = response.data.total;  // 解析响应数据中的 total
      } catch (error) {
        this.$message.error(error.message);
      }
    },

    // 重置查询条件
    handleReset() {
      this.userId = '';
      this.loadOrders(this.currentPage, this.pageSize);
    },

    // 翻页操作
    handlePageChange(page) {
      this.currentPage = page;
      this.handleSearch();
    },

    // 翻页大小变更操作
    handleSizeChange(size) {
      this.pageSize = size;
      this.loadOrders(this.currentPage, this.pageSize);
    },

    // 发货操作
    async sendOrder(orderId) {
      try {
        await sendOrder({ orderId });
        this.$message.success('发货成功');
        this.loadOrders(this.currentPage, this.pageSize);
      } catch (error) {
        this.$message.error(error.message);
      }
    },

    // 确认取消订单操作
    confirmCancelOrder(orderId) {
      ElMessageBox.confirm(
        '确认取消订单？',
        '提示',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }
      ).then(() => {
        this.cancelOrder(orderId);
      }).catch(() => {
        this.$message.info('已取消操作');
      });
    },
    // 取消订单操作
    async cancelOrder(orderId) {
      try {
        await cancelOrder({ orderId });
        this.$message.success('订单已取消');
        this.loadOrders(this.currentPage, this.pageSize);
      } catch (error) {
        this.$message.error(error.message);
      }
    },

    // 格式化日期
    formatDate(isoString) {
      if (!isoString) return '';
      const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' };
      return new Date(isoString).toLocaleDateString('zh-CN', options);
    }
  },

  mounted() {
    this.loadOrders(this.currentPage, this.pageSize);
  }
};
</script>

<style scoped>
.header-title {
  font-size: 25px;
  font-weight: bold;
  margin-bottom: 20px; /* 增加底部空行 */
}

.container {
  position: relative;
  max-width: 100%;
  min-height: 700px;
  height: auto;
}

.table-container {
  margin-bottom: 120px; /* 增加底部空行 */
}

.pagination-card {
  position: fixed;
  bottom: 0;
  right: 0;
  width: calc(100% - 201px); /* 减去侧边栏的宽度 */
  background: white; /* 设置背景色 */
  border-radius: 0;
  z-index: 1000;
}

.page-position {
  text-align: right; /* 使内容在容器内右对齐 */
  padding: 10px;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  width: 100%;
}

.search-position {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 20px; /* 增加底部空行 */
}

.divider {
  border: none;
  border-top: 1px solid #ccc; /* 设置分隔线样式 */
  margin: 20px 0; /* 增加上下空行 */
}
</style>
