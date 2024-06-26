<template>
  <el-container style="height: 100vh;">
    <!-- 侧边栏 -->
    <el-aside width="200px" class="menu-aside">
      <!-- 侧边栏菜单 -->
      <el-menu :default-active="activeMenu" class="el-menu-vertical-demo" @select="handleSelect">
        <!-- 首页 -->
        <el-menu-item index="1">
          <i class="el-icon-s-home"></i>
          <span>首页</span>
        </el-menu-item>
        <!-- products目录项 -->
        <el-submenu index="2">
          <template #title>
            <i class="el-icon-goods"></i>
            <span>商品管理</span>
          </template>
          <!-- 菜单项 -->
          <el-menu-item index="2-1">商品列表</el-menu-item>
          <el-menu-item index="2-2">添加商品</el-menu-item>
          <el-menu-item index="2-3">商品类别</el-menu-item>
        </el-submenu>
        <!-- user目录项 -->
        <el-submenu index="3">
          <template #title>
            <i class="el-icon-user"></i>
            <span>用户管理</span>
          </template>
          <el-menu-item index="3-1">用户列表</el-menu-item>
          <el-menu-item index="3-2">职能管理</el-menu-item>
        </el-submenu>
      </el-menu>
    </el-aside>
    <el-container>
      <!-- 页头部 -->
      <el-header class="el-header">Header</el-header>
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
          router.push('/users/userlist');
          break;
        case '3-2':
          router.push('/users/userrole');
          break;
        default:
          break;
      }
    };

    const setActiveMenu = (path) => {
      if (path.startsWith('/products/productedit')) {
        activeMenu.value = '2-1';
      } else if (path.startsWith('/users/useredit')) {
        activeMenu.value = '3-1';
      } else if (path.startsWith('/users/useradd')) {
        activeMenu.value = '3-1';
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
          case '/users/userlist':
            activeMenu.value = '3-1';
            break;
          case '/users/userrole':
            activeMenu.value = '3-2';
            break;
          default:
            activeMenu.value = '1';
        }
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
    };
  },
};
</script>

<style scoped>
/* 侧边框背景色 */
.el-menu-vertical-demo {
  width: 100%;
  height: 100%;
  background-color: #292b3cbc; /* 深色背景 */
  color: #dcdcdc; /* 设置所有文本颜色为浅色 */
  text-align: center; /* 设置文本居中 */
}

/* 控制菜单项字体颜色默认白色 */
.el-menu-vertical-demo .el-menu-item {
  background-color: transparent;
  padding-left: 20px; /* 增加左边距 */
  color: #dcdcdc; /* 设置所有文本颜色为浅色 */
  text-align: center; /* 设置文本居中 */
}

/* 鼠标移动变色 */
.el-menu-vertical-demo .el-menu-item:hover {
  background-color: #494d51; /* 悬停时变色 */
  color: #fff; /* 确保悬停时文本仍为白色 */
  text-align: center; /* 设置文本居中 */
}

/* 激活状态菜单项颜色 */
.el-menu-vertical-demo .el-menu-item.is-active {
  background-color: #39424d; /* 激活时变色 */
  color: #fff; /* 设置激活时文本颜色为高亮纯白色 */
  text-align: center; /* 设置文本居中 */
}

/* 子菜单标题的文本颜色 */
.el-menu-vertical-demo .el-submenu__title {
  color: #dcdcdc; /* 设置子菜单标题文本颜色为浅色 */
  padding-left: 20px; /* 增加左边距 */
  text-align: center; /* 设置文本居中 */
}

/* 子菜单标题悬停时的背景色 */
.el-menu-vertical-demo .el-submenu__title:hover {
  background-color: #031629;
  color: #fff; /* 设置子菜单标题悬停时文本颜色为白色 */
  text-align: center; /* 设置文本居中 */
}

/* 图标颜色 */
.el-menu-vertical-demo .el-icon {
  color: #dcdcdc; /* 设置图标颜色为浅色 */
}

/* 页头的背景色和文本颜色 */
.el-header {
  color: #dcdcdc; /* 设置页头文本颜色为浅色 */
  text-align: center; /* 设置文本居中 */
  line-height: 60px; /* 垂直居中对齐 */
  font-size: 18px; /* 增加字体大小 */
  box-shadow: 0 2px 4px rgba(48, 29, 29, 0.1); /* 增加阴影 */
}

/* 侧边栏的背景色 */
.menu-aside {
  background-color: #072b4d;
  box-shadow: 2px 0 6px rgba(0, 0, 0, 0.1); /* 增加阴影 */
}

/* 确保主容器和内容区域的高度填满屏幕 */
.el-container,
.el-main {
  height: 100%;
}
</style>
