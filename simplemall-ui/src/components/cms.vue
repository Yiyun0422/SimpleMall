<template>
    <!-- 布局器 -->
    <el-container style="height: 100vh;">
      <!-- 侧边栏 -->
      <el-aside width="200px">
        <!-- 侧边栏菜单 -->
        <el-menu 
          :default-active="activeMenu" 
          class="el-menu-vertical-demo" 
          @select="handleSelect"
        >
          <!-- 首页 -->
          <el-menu-item index="1">
            <i class="el-icon-s-home"></i>
            <span>First Page</span>
          </el-menu-item>
  
          <!-- products目录项 -->
          <el-submenu index="2">
            <template #title>
              <i class="el-icon-goods"></i>
              <span>Products</span>
            </template>
            <!-- 菜单项 -->
            <el-menu-item index="2-1">Product List</el-menu-item>
            <el-menu-item index="2-2">Product Category</el-menu-item>
            <el-menu-item index="2-3">Product Add</el-menu-item>
          </el-submenu>
  
          <!-- user目录项 -->
          <el-submenu index="3">
            <template #title>
              <i class="el-icon-user"></i>
              <span>Users</span>
            </template>
            <el-menu-item index="3-1">User List</el-menu-item>
            <el-menu-item index="3-2">User Role</el-menu-item>
          </el-submenu>
        </el-menu>
      </el-aside>
  
      <el-container>
        <!-- 页头部 -->
        <el-header>Header</el-header>
        <!-- 内容显示处 -->
        <el-main>
          <slot></slot>
        </el-main>
      </el-container>
    </el-container>
  </template>
  
  <script>
  export default {
    name: 'CommonLayout',
    data() {
      return {
        activeMenu: '1'
      };
    },
    methods: {
      // 处理菜单项的选择，根据选择的菜单项来导航到不同的路由
      handleSelect(key) {
        switch (key) {
          case '1':
            this.$router.push('/');
            break;
          case '2-1':
            this.$router.push('/products/productlist');
            break;
          case '2-2':
            this.$router.push('/products/productcategory');
            break;
          case '2-3':
            this.$router.push('/products/productadd');
            break;
          case '3-1':
            this.$router.push('/users/userlist');
            break;
          case '3-2':
            this.$router.push('/users/userrole');
            break;
        }
      },
      // 根据当前路径设置激活的菜单项
      setActiveMenu(path) {
        switch (path) {
          case '/':
            this.activeMenu = '1';
            break;
          case '/products/productlist':
            this.activeMenu = '2-1';
            break;
          case '/products/productcategory':
            this.activeMenu = '2-2';
            break;
          case '/products/productadd':
            this.activeMenu = '2-3';
            break;
          case '/users/userlist':
            this.activeMenu = '3-1';
            break;
          case '/users/userrole':
            this.activeMenu = '3-2';
            break;
          default:
            this.activeMenu = '1';
        }
      }
    },
    // 监听 $route 变化，当路由发生变化时，更新激活的菜单项
    watch: {
      $route(to) {
        this.setActiveMenu(to.path);
      }
    },
    // 组件挂载时，初始化设置激活的菜单项
    mounted() {
      this.setActiveMenu(this.$route.path);
    }
  };
  </script>
  
  
  
  <style scoped>
  /* 设置侧边栏菜单的样式，使其占满整个侧边栏区域，背景为深色 */
  .el-menu-vertical-demo {
    width: 100%;
    height: 100%;
    background-color: #1f41a8bc; /* 深色背景 */
    color: #ecf0f1; /* 浅色文本 */
  }
  
  /* 默认菜单项背景色透明 */
  .el-menu-vertical-demo .el-menu-item {
    background-color: transparent;
    padding-left: 20px; /* 增加左边距 */
  }
  
  /* 菜单项悬停时变色 */
  .el-menu-vertical-demo .el-menu-item:hover {
    background-color: #315578; /* 悬停时变色 */
  }
  
  /* 激活状态菜单项的背景色和文本颜色 */
  .el-menu-vertical-demo .el-menu-item.is-active {
    background-color: #1a70bc; /* 激活时变色 */
    color: #fff;
  }
  
  /* 子菜单标题的文本颜色 */
  .el-menu-vertical-demo .el-submenu__title {
    color: #ecf0f1;
    padding-left: 20px; /* 增加左边距 */
  }
  
  /* 子菜单标题悬停时的背景色 */
  .el-menu-vertical-demo .el-submenu__title:hover {
    background-color: #34495e;
  }
  
  /* 图标颜色 */
  .el-menu-vertical-demo .el-icon {
    color: #ecf0f1;
  }
  
  /* 页头的背景色和文本颜色 */
  .el-header {
    color: #fff;
    text-align: center;
    line-height: 60px; /* 垂直居中对齐 */
    font-size: 18px; /* 增加字体大小 */
    box-shadow: 0 2px 4px rgba(48, 29, 29, 0.1); /* 增加阴影 */
  }
  
  /* 侧边栏的背景色 */
  .menu-aside {
    background-color: #92adc7;
    box-shadow: 2px 0 6px rgba(0, 0, 0, 0.1); /* 增加阴影 */
  }
  </style>