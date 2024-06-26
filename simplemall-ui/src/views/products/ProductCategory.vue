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
    <el-table :data="categoryData" border="true" style="width: 100%">
      <el-table-column prop="categoryId" label="类别编号" width="100" align="center" />
      <el-table-column prop="cname" label="类别名称" align="center" />
      <el-table-column prop="cnumber" label="类别总数" align="center" />
      <el-table-column label="操作" align="center">
        <template #default="scope">
          <el-button @click="handleEdit(scope.row)" type="primary" size="small">修改</el-button>
          <el-button @click="handleDelete(scope.row)" type="danger" size="small">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>

  <div>
    <el-dialog v-model="dialogEdit" title="修改类别名称" width="500" >
      <el-form :model="form">
        <el-form-item label="类别名称" :label-width="formLabelWidth" :required="true">
          <el-input v-model="form.cname" autocomplete="off" />
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
    <el-dialog v-model="dialogAdd" title="增加新类别" width="500" >
      <el-form :model="formAdd">
        <el-form-item label="类别名称" :label-width="formLabelWidth" :required="true">
          <el-input v-model="formAdd.cname" autocomplete="off" />
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
import { searchCategories, deleteCategory, updateCategory,insertCategory } from '@/api/category';

interface Category {
  categoryId: number;
  cname: string;
  cnumber: number;
}
interface CategoryAdd {
  cname: string;
  cnumber: number;
}

const categoryData = ref<Category[]>([]);

// 初始化
const dialogEdit = ref(false);
const form = ref<Category>({ categoryId: 0, cname: '', cnumber: 0 });
const formAdd =  ref<CategoryAdd>({cname: '', cnumber: 0 });
const formLabelWidth = '120px';
const dialogAdd = ref(false);

const fetchCategories = async () => {
  try {
    const response = await searchCategories();
    categoryData.value = response.data;
  } catch (error) {
    ElMessage.error('Failed to fetch product categories data');
  }
};

onMounted(fetchCategories);

// 新增
const handleAdd = (row: Category) => {
  formAdd.value = { cname: '', cnumber: 0 }; // 初始化为空
  dialogAdd.value = true;
};
const confirmAdd = async () => {
  try {
    const response = await insertCategory(formAdd.value);
    if (response.code === 1) {
      ElMessage.success('添加成功');
      dialogAdd.value = false;
      await fetchCategories();
    } else {
      ElMessage.error('添加失败');
    }
  } catch (error) {
    ElMessage.error('添加失败');
  }
};


// 修改
const handleEdit = (row: Category) => {
  form.value = { ...row };
  dialogEdit.value = true;
};
const confirmEdit = async () => {
  try {
    const response = await updateCategory(form.value);
    if (response.code === 1) {
      ElMessage.success('修改成功');
      dialogEdit.value = false;
      await fetchCategories();
    } else {
      ElMessage.error('修改失败');
    }
  } catch (error) {
    ElMessage.error('修改失败');
  }
};


const handleDelete = async (row: Category) => {
  ElMessageBox.confirm('此操作将永久删除该类别, 是否继续?', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    try {
      const response = await deleteCategory(row.categoryId);
      if (response.code !== 1) {
        ElMessage.error('删除失败');
      } else {
        ElMessage.success('删除成功');
        await fetchCategories(); 
      }
    } catch (error) {
      ElMessage.error('删除失败');
    }
  }).catch(() => {
    ElMessage.info('取消删除');
  });
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
