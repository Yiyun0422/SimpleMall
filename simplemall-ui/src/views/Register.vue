<template>
    <div class="login-container">
      <!-- 左侧图片
      <div class="login-image">
        <img src="@/assets/1231231.png" alt="Login Image">
      </div> -->
  
      <!-- 右侧登录主体 -->
      <div class="login-body">
        <el-form :model="loginForm" @submit.prevent="handleLogin">
          <el-form-item label="账号" class="login-input">
            <el-input
              v-model="loginForm.uid"
              style="width: 240px"
              placeholder="请设置用户名"
              clearable
            />
          </el-form-item>
          <el-form-item label="密码" class="login-input">
            <el-input
              v-model="loginForm.upassword"
              style="width: 240px"
              type="password"
              placeholder="请设置密码"
              show-password
            />
          </el-form-item>
          <el-form-item class="login-buttons">
            <el-button type="primary" @click="handleLogin">登录</el-button>
            <el-button @click="handleRegister">注册</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </template>
  
  <script lang="ts" setup>
  import { ref } from 'vue';
  import { useRouter } from 'vue-router';
  import { ElMessage } from 'element-plus';
  import { login } from '@/api/login';
  
  const router = useRouter();
  
  const loginForm = ref({
    uid: '',
    upassword: '',
  });
  
  const handleLogin = async () => {
    try {
      const response = await login(loginForm.value);
      if (response && response.code === 1) {
        localStorage.setItem('token', response.data.token);
        router.push('/');
      } else {
        ElMessage.error(response.data.msg || '登录失败');
      }
    } catch (error) {
      ElMessage.error(error.message || '登录时发生错误');
    }
  };
  
  const handleRegister = () => {
    router.push('/register');
  };
  </script>
  
  <style scoped>
  .login-container {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
  }
  
  .login-image {
    width: 50%;
  }
  
  .login-image img {
    width: 100%;
  }
  
  .login-body {
    width: 50%;
    padding: 20px;
  }
  
  .login-input {
    margin-bottom: 20px;
  }
  
  .login-buttons {
    text-align: center;
  }
  </style>
  