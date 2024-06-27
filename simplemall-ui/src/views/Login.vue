<template>
  <div class="login-container">
    <div class="login-image">
      <img src="../assets/images/loginPage.png" alt="Login Image" />
    </div>
    <div class="login-card">
      <h2 class="welcome-message">欢迎来到simplemall简易商场系统</h2>
      <div class="login-body">
        <el-form :model="loginForm" @submit.prevent="handleLogin">
          <!-- 用户账号 -->
          <el-form-item label="用户账号" :required="true">
            <el-input
              v-model="loginForm.uid"
              placeholder="请输入用户账号"
              clearable
            />
          </el-form-item>
          <!-- 用户密码 -->
          <el-form-item label="用户密码" :required="true">
            <el-input
              v-model="loginForm.upassword"
              type="password"
              placeholder="请输入密码"
              show-password
            />
          </el-form-item>
          <!-- 提交按钮 -->
          <el-form-item class="login-buttons">
            <el-button type="primary" @click="handleLogin">登录</el-button>
            <el-button @click="handleRegister">注册</el-button>
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
import { login } from '@/api/login'; // 引入登录API

const router = useRouter();

const loginForm = ref({
  uid: '',
  upassword: '',
});

const handleLogin = async () => {
  try {
    const response = await login(loginForm.value);
    if (response && response.code === 1) {
      localStorage.setItem('token', response.data); // 存储 token
      ElMessage.success('登录成功');
      router.push('/');
    } else {
      ElMessage.error(response.msg || '登录失败');
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
  height: 400px; /* 固定高度 */
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
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.login-input {
  margin-bottom: 20px;
  display: flex;
  justify-content: center;
}

.login-buttons {
  text-align: center;
}
</style>
