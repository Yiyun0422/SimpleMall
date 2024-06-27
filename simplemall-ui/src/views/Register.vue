<template>
  <div class="login-container">
    <div class="login-image">
      <img src="../assets/images/loginPage.png" alt="Login Image" />
    </div>
    <div class="login-card">
      <h2 class="welcome-message">欢迎注册simplemall简易商场系统账号</h2>
      <div class="login-body">
        <el-form :model="registerForm" ref="registerData" label-width="120px" @submit.prevent="handleRegister">

          <!-- 用户账号 -->
          <el-form-item label="用户账号" :required="true">
            <el-input v-model="registerForm.uid" placeholder="请输入用户账号"></el-input>
          </el-form-item>

          <!-- 用户密码 -->
          <el-form-item label="用户密码" :required="true">
            <el-input v-model="registerForm.upassword" type="password" placeholder="请输入密码"></el-input>
          </el-form-item>

          <!-- 用户名称 -->
          <el-form-item label="用户名称" :required="true">
            <el-input v-model="registerForm.uname" placeholder="请输入用户名称"></el-input>
          </el-form-item>

          <!-- 用户邮箱 -->
          <el-form-item label="用户邮箱">
            <el-input v-model="registerForm.uemail" placeholder="请输入用户邮箱"></el-input>
          </el-form-item>

          <!-- 提交按钮 -->
          <el-form-item class="login-buttons">
            <el-button type="primary" @click="handleRegister">注册</el-button>
            <el-button @click="handleBackToLogin">返回登录</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { ElMessage } from 'element-plus';
import { insertUser } from '@/api/user'; // 引入新增用户API

interface User {
  uid: string;
  upassword: string;
  uname: string;
  uemail: string;
}

const registerForm = ref<User>({
  uid: '',
  upassword: '',
  uname: '',
  uemail: '',
});

const router = useRouter();

const handleRegister = async () => {
  if (registerForm.value.uid === '' || registerForm.value.upassword === '') {
    ElMessage.error('请按要求填写所有必填项');
    return;
  }

  try {
    const response = await insertUser(registerForm.value);
    if (response.code === 1) {
      ElMessage.success('注册成功!');
      router.push('/login');
    } else {
      ElMessage.error('注册失败，请重试。');
    }
  } catch (error) {
    ElMessage.error('注册失败，请重试。');
  }
};

const handleBackToLogin = () => {
  router.push('/login');
};
</script>

<style scoped>
.login-container {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
  background-color: #f0f2f5; /* 添加背景颜色 */
}

.login-image {
  flex: 0.7; 
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
}

.login-image img {
  max-width: 100%;
  height: auto;
  border-radius: 8px; /* 添加圆角 */
}

.login-card {
  flex: 0 0 450px; /* 固定宽度 */
  height: 300px; /* 固定高度 */
  padding: 40px;
  background-color: #ffffff; /* 添加背景颜色 */
  border-radius: 8px; /* 添加圆角 */
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1); /* 添加阴影 */
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.welcome-message {
  margin-bottom: 30px;
  text-align: center;
}

.login-body {
  width: 100%;
}

.login-input {
  margin-bottom: 20px;
}

.login-buttons {
  text-align: center;
}
</style>
