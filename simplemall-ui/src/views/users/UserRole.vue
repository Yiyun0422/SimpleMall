<template>
  <div class="header-container">
    <div>
      <span class="header-title">数据列表</span>
    </div>
    <el-button type="primary" plain size="mini" @click="handleAdd">
      添加
    </el-button>
  </div>

  <div class="table-container">
    <el-table :data="roleData" border style="width: 100%">
      <el-table-column prop="roleId" label="编号" width="100" align="center" />
      <el-table-column prop="rname" label="名称" align="center" />
      <el-table-column prop="rdesc" label="描述" align="center" />
      <el-table-column prop="rcreateTime" label="创建时间" width="200" align="center">
        <template #default="scope">
          {{ formatDateTime(scope.row.rcreateTime) }}
        </template>
      </el-table-column>
      <el-table-column prop="rupdateTime" label="更新时间" width="200" align="center">
        <template #default="scope">
          {{ formatDateTime(scope.row.rupdateTime) }}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template #default="scope">
          <el-button @click="handleEdit(scope.row)" type="primary" size="small">修改</el-button>
          <el-button @click="handleDelete(scope.row)" type="danger" size="small">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>


  <div>
    <el-dialog v-model="dialogEdit" title="修改职能信息" width="500" >
      <el-form :model="form">
        <el-form-item label="职能名称" :label-width="formLabelWidth" :required="true">
          <el-input v-model="form.rname" autocomplete="off" />
        </el-form-item>
        <el-form-item label="职能描述" :label-width="formLabelWidth" >
          <el-input v-model="form.rdesc" autocomplete="off" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogEdit = false">取消</el-button>
          <el-button type="primary" @click="confirmEdit">确定</el-button>
        </div>
      </template>
    </el-dialog>
  </div>

  <div>
    <el-dialog v-model="dialogAdd" title="增加新职能" width="500" >
      <el-form :model="formAdd">
        <el-form-item label="职能名称" :label-width="formLabelWidth" :required="true">
          <el-input v-model="formAdd.rname" autocomplete="off" />
        </el-form-item>
        <el-form-item label="职能描述" :label-width="formLabelWidth" >
          <el-input v-model="formAdd.rdesc" autocomplete="off" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogAdd = false">取消</el-button>
          <el-button type="primary" @click="confirmAdd">确定</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>


<script lang="ts" setup>
import { ref, onMounted } from 'vue';
import { ElMessageBox, ElMessage } from 'element-plus';
import { searchRoles,deleteRole,insertRole,updateRole } from '@/api/role';
import { useRouter } from 'vue-router';

interface Role {
  roleId: number;
  rname: string;
  rdesc: string;
  rcreateTime: string;
  rupdateTime:string;
}
interface RoleAdd {
  rname: string;
  rdesc: string;
  rcreateTime: string;
  rupdateTime:string;
}


const roleData = ref<Role[]>([]);
// 初始化
const dialogEdit = ref(false);
const form = ref<Role>({ roleId: 0, rname: null, rdesc: null, rcreateTime:'', rupdateTime:''});
const formAdd =  ref<RoleAdd>({rname: null, rdesc: '', rcreateTime:'', rupdateTime:''});
const formLabelWidth = '120px';
const dialogAdd = ref(false);


const loadRoles = async () => {
  try {
    const response = await searchRoles();
    if (response && response.data) {
      roleData.value = response.data;
    } else {
      throw new Error('Invalid response data');
    }
  } catch (error) {
    ElMessage.error('Failed to fetch role data');
  }
};

onMounted(loadRoles);


const router = useRouter();

// 新增
const handleAdd = (row: Role) => {
  formAdd.value = { rname: '', rdesc:'' ,rcreateTime:'', rupdateTime:''}; // 初始化为空
  dialogAdd.value = true;
};
const confirmAdd = async () => {
  try {
    const response = await insertRole(formAdd.value);
    if (response.code === 1) {
      ElMessage.success('添加成功');
      dialogAdd.value = false;
      await loadRoles();
    } else {
      ElMessage.error('添加失败');
    }
  } catch (error) {
    ElMessage.error('添加失败');
  }
}

// 修改
const handleEdit = (row: Role) => {
  form.value = { ...row };
  dialogEdit.value = true;
};
const confirmEdit = async () => {
  try {
    const response = await updateRole(form.value);
    if (response.code === 1) {
      ElMessage.success('修改成功');
      dialogEdit.value = false;
      await loadRoles();
    } else {
      ElMessage.error('修改失败');
    }
  } catch (error) {
    ElMessage.error('修改失败');
  }
};


const handleDelete = async (row: Role) => {
  ElMessageBox.confirm('此操作将永久删除该类别, 是否继续?', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    try {
      const response = await deleteRole(row.roleId);
      if (response.code !== 1) {
        ElMessage.error('删除失败');
      } else {
        ElMessage.success('删除成功');
        await loadRoles(); 
      }
    } catch (error) {
      ElMessage.error('删除失败');
    }
  }).catch(() => {
    ElMessage.info('取消删除');
  });
};


// 处理时间转换
const formatDateTime = (dateTime: string) => {
  if (!dateTime) return 'N/A';
  const date = new Date(dateTime);
  return date.toLocaleString();
};
</script>



<style scoped>
.header-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 10px;
  margin-right: 100px;
  /* 增加按钮的左侧外边距 */
}

/* 字体样式 */
.header-title {
  font-size: 25px;
  font-weight: bold;
}

.table-container {
  margin-top: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
