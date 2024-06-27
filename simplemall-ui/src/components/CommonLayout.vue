<template>
  <el-container style="height: 100%;">
    <!-- 侧边栏 -->
    <el-aside width="200px" class="menu-aside">
      <!-- 侧边栏菜单 -->
      <el-menu :default-active="activeMenu" class="el-menu-vertical-demo" @select="handleSelect">
        <!-- 系统首页 -->
        <el-menu-item index="1" style="background-color: #314154;">
          <span>系统首页</span>
        </el-menu-item>

        <!-- 商品管理目录项 -->
        <el-sub-menu index="2">
          <template #title>
            <span style="color: aliceblue;">商品管理</span>
          </template>
          <el-menu-item index="2-1">商品列表</el-menu-item>
          <el-menu-item index="2-2">添加商品</el-menu-item>
          <el-menu-item index="2-3">商品类别</el-menu-item>
        </el-sub-menu>

        <!-- 订单管理目录项 -->
        <el-sub-menu index="3">
          <template #title>
            <span style="color: aliceblue;">订单管理</span>
          </template>
          <el-menu-item index="3-1">订单列表</el-menu-item>
          <el-menu-item index="3-2">订单记录</el-menu-item>
        </el-sub-menu>

        <!-- 用户管理目录项 -->
        <el-sub-menu index="4">
          <template #title>
            <span style="color: aliceblue;">用户管理</span>
          </template>
          <el-menu-item index="4-1">用户列表</el-menu-item>
          <el-menu-item index="4-2">职能管理</el-menu-item>
        </el-sub-menu>

        <!-- 个人中心 -->
        <el-menu-item index="5" style="background-color: #314154;">
          <span>个人中心</span>
        </el-menu-item>
      </el-menu>
    </el-aside>
    <el-container>
      <!-- 页头部 -->
      <el-header class="el-header">
        <div class="header-title">
          SimpleMall简易商场管理系统后台
        </div>
        <el-dropdown @command="handleAvatarCommand" class="header-avatar">
          <span class="el-dropdown-link">
            <img class="profile-avatar" src="../assets/images/profile.jpg" alt="profile" />
          </span>
          <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item command="personal">个人中心</el-dropdown-item>
            <el-dropdown-item command="logout">退出登录</el-dropdown-item>
          </el-dropdown-menu>
          </template>
        </el-dropdown>
      </el-header>
      <!-- 内容显示处 -->
      <el-main class="el-main">
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import { ref, onMounted, watch } from 'vue';
import { useRouter, useRoute } from 'vue-router';
import { ElMessageBox, ElMessage } from 'element-plus';

export default {
  name: 'CommonLayout',
  setup() {
    const router = useRouter();
    const route = useRoute();
    const activeMenu = ref('1');

    const handleSelect = (key) => {
      switch (key) {
        case '1':
          router.push('/firstpage');
          break;
        case '2-1':
          router.push('/products/productlist');
          break;
        case '2-2':
          router.push('/products/productadd');
          break;
        case '2-3':
          router.push('/products/productcategory');
          break;
        case '3-1':
          router.push('/order/orderlist');
          break;
        case '3-2':
          router.push('/order/orderrecord');
          break;
        case '4-1':
          router.push('/users/userlist');
          break;
        case '4-2':
          router.push('/users/userrole');
          break;
        case '5':
          router.push('/personal');
          break;
        default:
          break;
      }
    };

    const setActiveMenu = (path) => {
      if (path.startsWith('/products/productedit')) {
        activeMenu.value = '2-1';
      } else if (path.startsWith('/users/useredit')) {
        activeMenu.value = '4-1';
      } else if (path.startsWith('/users/useradd')) {
        activeMenu.value = '4-1';
      } else {
        switch (path) {
          case '/firstpage':
            activeMenu.value = '1';
            break;
          case '/products/productlist':
            activeMenu.value = '2-1';
            break;
          case '/products/productadd':
            activeMenu.value = '2-2';
            break;
          case '/products/productcategory':
            activeMenu.value = '2-3';
            break;
          case '/order/orderlist':
            activeMenu.value = '3-1';
            break;
          case '/order/orderrecord':
            activeMenu.value = '3-2';
            break;
          case '/users/userlist':
            activeMenu.value = '4-1';
            break;
          case '/users/userrole':
            activeMenu.value = '4-2';
            break;
          case '/personal':
            activeMenu.value = '5';
            break;
          default:
            activeMenu.value = '1';
        }
      }
    };

    const handleAvatarCommand = (command) => {
      console.log(`Received command: ${command}`); // 添加日志调试信息
      if (command === 'personal') {
        router.push('/personal');
      } else if (command === 'logout') {
        ElMessageBox.confirm('您确定要退出登录吗?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
        }).then(() => {
          localStorage.removeItem('token');
          ElMessage({
            type: 'success',
            message: '退出成功',
          });
          router.push('/login');
        }).catch(() => {
          ElMessage({
            type: 'info',
            message: '已取消退出',
          });
        });
      }
    };

    // 监听路由变化并更新激活菜单项
    watch(route, (newRoute) => {
      setActiveMenu(newRoute.path);
    });

    onMounted(() => {
      setActiveMenu(route.path);
    });

    return {
      activeMenu,
      handleSelect,
      handleAvatarCommand,
    };
  },
};
</script>

<style scoped>
/* 主容器样式 */
.el-container,
.el-main {
  height: 100%;
}

/* 侧边栏样式 */
.menu-aside {
  background-color: #314154; /* 调整后的侧边栏背景色 */
  box-shadow: 2px 0 6px rgba(0, 0, 0, 0.1); /* 增加阴影 */
}

/* 菜单样式 */
.el-menu-vertical-demo {
  width: 100%;
  height: 100%;
  background-color: #314154; /* 菜单背景色 */
  color: #ffffff; /* 文本颜色 */
  text-align: center; /* 文本居中 */
}

/* 菜单项样式 */
.el-menu-vertical-demo .el-menu-item {
  background-color: #233242; /* 背景色 */
  padding-left: 20px; /* 左边距 */
  color: #ffffff; /* 文本颜色 */
}

/* 鼠标悬停样式 */
.el-menu-vertical-demo .el-menu-item:hover {
  background-color: #112033; /* 背景色 */
  color: #ffffff; /* 文本颜色 */
}

/* 激活状态样式 */
.el-menu-vertical-demo .el-menu-item.is-active {
  color: #4c97e2; /* 文本颜色 */
}

/* 子菜单标题样式 */
.el-menu-vertical-demo .el-submenu__title {
  color: #ffffff; /* 文本颜色 */
  padding-left: 20px; /* 左边距 */
}

/* 子菜单标题悬停样式 */
.el-menu-vertical-demo .el-submenu__title:hover {
  background-color: #387bc9; /* 背景色 */
  color: #ffffff; /* 文本颜色 */
}

/* 图标颜色 */
.el-menu-vertical-demo .el-icon {
  color: #ffffff; /* 图标颜色 */
}

/* 页头样式 */
.el-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 20px;
  color: #031629; /* 文本颜色 */
  line-height: 60px; /* 垂直居中对齐 */
  font-size: 24px; /* 字体大小 */
  font-weight: bold; /* 字体加粗 */
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 增加阴影 */
}

/* 标题样式 */
.header-title {
  flex: 1;
  text-align: center;
}

/* 头像样式 */
.profile-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  cursor: pointer;
}

.header-avatar {
  margin-left: 10%;
}
</style>
