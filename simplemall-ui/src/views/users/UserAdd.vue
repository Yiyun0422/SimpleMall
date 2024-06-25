<template>
    <div class="card-container">
      <el-card class="user-card">
        <template #header>
          <div class="card-header">
            <span><b>新增用户</b></span>
          </div>
        </template>
        <el-form :model="user" ref="userData" label-width="120px" class="user-form">
          <!-- 用户相片 -->
          <el-form-item label="用户相片">
            <el-upload
              class="avatar-uploader"
              action="文件上传地址——阿里云oss"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
              :before-upload="beforeAvatarUpload"
            >
              <img v-if="imageUrl" :src="imageUrl" class="avatar" />
              <el-icon v-else class="avatar-uploader-icon">
                <Plus />
              </el-icon>
            </el-upload>
          </el-form-item>
  
          <!-- 用户账号 -->
          <el-form-item label="用户账号" :required="true">
            <el-input v-model="user.uid" placeholder="请输入用户账号"></el-input>
          </el-form-item>

          <!-- 用户账号 -->
          <el-form-item label="用户密码" :required="true">
            <el-input v-model="user.upassword" placeholder="设置密码（默认user123456）"></el-input>
          </el-form-item>

          <!-- 用户名称 -->
          <el-form-item label="用户名称" :required="true">
            <el-input v-model="user.uname" placeholder="请输入用户名称"></el-input>
          </el-form-item>
  
          <!-- 用户邮箱 -->
          <el-form-item label="用户邮箱">
            <el-input v-model="user.uemail" placeholder="请输入用户邮箱"></el-input>
          </el-form-item>
  
          <!-- 用户职能 -->
          <el-form-item label="用户职能">
            <el-select v-model="user.urole" placeholder="用户职能">
              <el-option
                v-for="role in roles"
                :key="role.value"
                :label="role.label"
                :value="role.value"
              />
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
  
  <script lang="ts" setup>
  import { ref, onMounted } from 'vue';
  import { ElMessage } from 'element-plus';
  import { useRoute, useRouter } from 'vue-router';
  import { Plus } from '@element-plus/icons-vue';
  import { insertUser } from '@/api/user';
  import { searchRoles } from '@/api/role';
  import type { UploadProps } from 'element-plus';
  
  interface User {
    uid:string;
    upassword:string;
    uname: string;
    uemail: string;
    urole: string;
    uimg?: string;
  }
  
  const user = ref<User>({
    uid:'',
    upassword:'user123456',
    uname: '',
    uemail: '',
    urole: '',
    uimg: ''
  });
  
  const imageUrl = ref('');
  
  const roles = ref<{ value: string; label: string }[]>([]);
  
  // 获取 router 实例
  const router = useRouter();

  
  // 加载职能
  onMounted(async () => {
    try {
      const rolesResponse = await searchRoles();
      const roleData = rolesResponse.data;
      roles.value = roleData.map((item: { roleId: string, rname: string }) => ({
        value: item.roleId,
        label: item.rname
      }));
    } catch (error) {
      ElMessage.error('Failed to fetch roles');
    }
  });
  
  
  // 文件上传
  const handleAvatarSuccess: UploadProps['onSuccess'] = (response, file) => {
    imageUrl.value = URL.createObjectURL(file.raw!);
    user.value.uimg = response.url; // assuming the response contains the uploaded image URL
  };
  
  const beforeAvatarUpload: UploadProps['beforeUpload'] = (file) => {
    const isJPGorPNG = file.type === 'image/jpeg' || file.type === 'image/png';
    const isLt2M = file.size / 1024 / 1024 < 2;
  
    if (!isJPGorPNG) {
      ElMessage.error('Avatar picture must be JPG or PNG format!');
    }
    if (!isLt2M) {
      ElMessage.error('Avatar picture size cannot exceed 2MB!');
    }
  
    return isJPGorPNG && isLt2M;
  };
  
  
  // 提交表单
  const submitForm = async () => {
    
    if (user.value.uname === '' || user.value.uid === '') {
    ElMessage.error('请填写所有必填项');
    return;
  }

    try {
      const response = await insertUser(user.value);
      if (response.code === 1) {
        ElMessage.success('添加成功!');
        router.push({ name: 'UserList' });
      } else {
        ElMessage.error('表单添加失败，请重试。');
      }
    } catch (error) {
      ElMessage.error('表单添加失败，请重试。');
    }
  };
  
  const resetForm = () => {
    user.value = {
        uid:'',
        upassword:'user123456',
        uname: '',
      uemail: '',
      urole: '',
      uimg: ''
    };
    imageUrl.value = '';
  };
  </script>
  
  
  <style scoped>
  .card-container {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    padding-top: 80px;
    height: 100vh;
    box-sizing: border-box;
  }
  
  .user-card {
    width: 100%;
    max-width: 800px;
  }
  
  .user-form {
    width: 100%;
  }
  
  .card-header {
    display: flex;
    justify-content: center;
  }
  
  .avatar-uploader .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
  
  .avatar-uploader .el-upload {
    border: 1px dashed var(--el-border-color);
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    transition: var(--el-transition-duration-fast);
  }
  
  .avatar-uploader .el-upload:hover {
    border-color: var(--el-color-primary);
  }
  
  .el-icon.avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    text-align: center;
    line-height: 178px;
  }
  </style>
  