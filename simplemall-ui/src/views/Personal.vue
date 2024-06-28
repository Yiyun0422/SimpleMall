<template>
    <div class="profile-container">
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <h2 class="profile-title">个人中心</h2>
        </div>
        <div class="text item">
          <el-form :model="userInfo" label-width="100px">
            <el-form-item label="姓名">
              <el-input v-model="userInfo.uname" :disabled="!isEditing"></el-input>
            </el-form-item>
            <el-form-item label="职能">
              <el-input v-model="userInfo.urole" :disabled="!isEditing"></el-input>
            </el-form-item>
            <el-form-item label="账号">
              <el-input v-model="userInfo.uid" :disabled="!isEditing"></el-input>
            </el-form-item>
            <el-form-item label="密码">
              <el-input type="password" v-model="userInfo.upassword" :disabled="!isEditing"></el-input>
            </el-form-item>
            <el-form-item label="邮箱">
              <el-input v-model="userInfo.uemail" :disabled="!isEditing"></el-input>
            </el-form-item>
          </el-form>
          <div class="button-container">
            <el-button v-if="!isEditing" type="primary" @click="edit">修改</el-button>
            <el-button v-if="isEditing" type="primary" @click="save">保存</el-button>
            <el-button v-if="isEditing" @click="cancel">取消</el-button>
          </div>
        </div>
      </el-card>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    name: 'Personal',
    data() {
      return {
        userInfo: {},
        originalUserInfo: {}, // 保存原始用户信息
        isEditing: false
      };
    },
    created() {
      this.fetchUserInfo();
    },
    methods: {
      fetchUserInfo() {
        console.log('Fetching user info...');
        axios.get('http://localhost:8080/personal/userinfo', {
          headers: {
            'Authorization': `Bearer ${localStorage.getItem('token')}`
          }
        }).then(response => {
          console.log('User info fetched:', response.data);
          this.userInfo = response.data;
          this.originalUserInfo = { ...response.data }; // 复制原始用户信息
        }).catch(error => {
          this.$message.error('获取用户信息失败');
          console.error('Error fetching user info:', error);
        });
      },
      edit() {
        this.isEditing = true;
      },
      save() {
        console.log('Saving user info...', this.userInfo);
        axios.post('http://localhost:8080/personal/updateuserinfo', this.userInfo, {
          headers: {
            'Authorization': `Bearer ${localStorage.getItem('token')}`
          }
        }).then(response => {
          console.log('User info saved:', response);
          this.$message.success('用户信息更新成功');
          this.isEditing = false;
          this.originalUserInfo = { ...this.userInfo };
        }).catch(error => {
          this.$message.error('用户信息更新失败');
          console.error('Error saving user info:', error);
        });
      },
      cancel() {
        this.userInfo = { ...this.originalUserInfo }; // 恢复原始用户信息
        this.isEditing = false;
      }
    }
  };
  </script>
  
  <style scoped>
  .profile-container {
    padding: 20px;
  }
  
  .box-card {
    width: 600px; 
    height: 600px;
    margin: 0 auto;
  }
  
  .profile-title {
    font-size: 24px; /* 调整字号 */
    font-weight: bold; /* 加粗 */
    text-align: center; /* 居中显示 */
    margin: 20px 0; /* 增加上下间距 */
  }
  
  .el-form-item {
    margin-bottom: 25px;
  }
  
  .button-container {
    text-align: center;
    margin-top: 20px;
  }
  </style>
  