<template>
  <el-card style="max-width: 100%; height: auto;">
    <template #header>
      <div class="header-container">
        <span class="header-title">用户列表</span>
        <div class="header-actions">
          <el-input v-model="searchName" style="width: 200px;" placeholder="请输入用户名称" />&nbsp;
          <el-select v-model="searchRole" style="width: 100px;" placeholder="选择职能">
            <el-option v-for="role in roles" :key="role.roleId" :label="role.rname"
              :value="role.roleId" />
          </el-select>&nbsp;
          <el-button round  @click="handlesearch" type="primary">搜索</el-button>
          <el-button round  @click="handlereset">重置</el-button>
          <el-button type="primary" round plain @click="handleAdd" class="insert-position">添加</el-button>
        </div>
      </div>
    </template>

    <div>
      <!-- 数据源 -->
      <el-table :data="userData" style="width: 100%" class="table-container" align="center">
        <el-table-column prop="uid" label="账号" width="150" align="center"></el-table-column>
        <el-table-column prop="uname" label="姓名" width="120" align="center"></el-table-column>
        <el-table-column prop="uimg" label="照片" width="150" align="center">
          <template #default="scope">
            <img :src="scope.row.uimg" alt="User Image" width="50" height="50" />
          </template>
        </el-table-column>
        <el-table-column prop="uemail" label="邮箱" width="200" align="center"></el-table-column>
        <el-table-column prop="ucreateTime" label="创建时间" width="180" align="center">
          <template #default="scope">
            {{ formatDateTime(scope.row.ucreateTime) }}
          </template>
        </el-table-column>
        <el-table-column prop="uupdateTime" label="修改时间" width="180" align="center">
          <template #default="scope">
            {{ formatDateTime(scope.row.uupdateTime) }}
          </template>
        </el-table-column>
        <el-table-column prop="urole" label="职能" width="120" align="center">
          <template #default="scope">
            {{ getRole(scope.row.urole) }}
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200" align="center">
          <template #default="scope">
            <el-button type="primary" @click="handleEdit(scope.row)">修改</el-button>
            <el-button type="danger" @click="handleDelete(scope.row)">删除</el-button>
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

<script lang="ts" setup>
import { ref, onMounted } from 'vue';
import { ElMessageBox, ElMessage } from 'element-plus';
import { fetchUsers, deleteUser } from '@/api/user';
import { searchRoles } from '@/api/role';
import { useRouter } from 'vue-router';

// 定义数据类型
interface User {
  userId: number;
  uid: string;
  uname: string;
  uimg: string | null;
  uemail: string;
  ucreateTime: string;
  uupdateTime: string;
  urole: number | null;
}
interface Role {
  roleId: number;
  rname: string;
}

// 初始化数据
const userData = ref<User[]>([]);
const total = ref(0);
const pageSize = ref(8);
const currentPage = ref(1);
const searchName = ref('')
const searchRole= ref<number | null>(null);
const roles = ref<Role[]>([]);

// 更新数据
const loadUsers = async (page: number, uname: string = '', urole: number | null = null) => {
  try {
    const response = await fetchUsers({ page, pageSize: pageSize.value, uName: uname, uRole: urole });
    userData.value = response.data.rows;
    total.value = response.data.total;
    currentPage.value = page;
  } catch (error) {
    ElMessage.error('获取用户信息失败');
  }
};
// 加载职能数据
const loadRoles = async () => {
  try {
    const response = await searchRoles();
    roles.value = response.data;
  } catch (error) {
    ElMessage.error('获取职能信息失败');
  }
};

// 挂载方法加载用户列表和职能列表
onMounted(() => {
  loadUsers(currentPage.value);
  loadRoles();
});

// 获取职能
const getRole = (role: number | null) => {
  
  const roles = {
    1: '超级管理员',
    2: '商品管理员',
    3: '用户'
  };
  return roles[role];
};

// 删除
const handleDelete = async (row: User) => {
  ElMessageBox.confirm('此操作将永久删除该用户, 是否继续?', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    try {
      const response = await deleteUser(row.userId);
      if (response.code !== 1) {
        ElMessage.error('删除失败');
      } else {
        ElMessage.success('删除成功');
        await loadUsers(currentPage.value);  // 重新加载当前页的数据
      }
    } catch (error) {
      ElMessage.error('删除失败');
    }
  }).catch(() => {
    ElMessage.info('取消删除');
  });
};

// 修改操作
// 获取路由实例
const router = useRouter();
const handleEdit = (row: User) => {
  if (!row.userId) {
    ElMessage.error('网络错误');
    return;
  }
  // 跳转到UserEdit页面，带上userId参数
  router.push({ name: 'UserEdit', params: { id: row.userId } });
};


// 新增
const handleAdd = ()=>{
  router.push({ name: 'UserAdd'});
};

// 搜索
const handlesearch = async () => {
  await loadUsers(1, searchName.value, searchRole.value);
};

//重置
const handlereset = () => {
  searchName.value = '';
  searchRole.value = null;
  loadUsers(currentPage.value);
}


// 处理时间转换
const formatDateTime = (dateTime: string) => {
  if (!dateTime) return 'N/A';
  const date = new Date(dateTime);
  return date.toLocaleString();
};

//翻页操作，获取当前页码，并重新加载
const handlePageChange = (page: number) => {
  currentPage.value = page;
  loadUsers(page, searchName.value, searchRole.value);
};

</script>

<style scoped>
.header-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 10px 10px 10px;
  margin-right: 15%;
}

.header-title {
  font-size: 25px;
  font-weight: bold;
}

.header-actions {
  display: flex;
  align-items: center;
  gap: 5px;
}

.insert-position {
  position: absolute;
  right: 50px;
}

.table-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

img {
  display: block;
  margin: 0 auto;
}

.page-position {
  position: absolute;
  right: 100px;
}
</style>
