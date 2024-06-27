// src/router/index.js

import { createRouter, createWebHistory } from 'vue-router';
import CommonLayout from '../components/CommonLayout.vue';
import FirstPage from '../views/FirstPage.vue';
import ProductList from '../views/products/ProductList.vue';
import ProductCategory from '../views/products/ProductCategory.vue';
import ProductAdd from '../views/products/ProductAdd.vue';
import OrderList from '../views/order/OrderList.vue';
import OrderRecord from '../views/order/OrderRecord.vue';
import UserList from '../views/users/UserList.vue';
import UserRole from '../views/users/UserRole.vue';
import ProductEdit from '../views/products/ProductEdit.vue';
import UserEdit from '../views/users/UserEdit.vue';
import UserAdd from '../views/users/UserAdd.vue';
import Login from '../views/Login.vue';
import Register from '../views/Register.vue';
import NotFoundPage from '../views/404page.vue';
import Personal from '../views/Personal.vue';

const routes = [
  { path: '/login', name: 'Login', component: Login },
  { path: '/register', name: 'Register', component: Register },
  { path: '/notfoundpage', name: '404Page', component: NotFoundPage },

  // 使用 CommonLayout 的页面
  {
    path: '/',
    component: CommonLayout,
    children: [
      { path: '', redirect: '/firstpage' },
      { path: 'firstpage', name: 'FirstPage', component: FirstPage },
      { path: 'products/productlist', name: 'ProductList', component: ProductList },
      { path: 'products/productcategory', name: 'ProductCategory', component: ProductCategory },
      { path: 'products/productadd', name: 'ProductAdd', component: ProductAdd },
      { path: 'products/productedit/:id', name: 'ProductEdit', component: ProductEdit, props: true },
      { path: 'order/orderlist', name: 'OrderList', component: OrderList },
      { path: 'order/orderrecord', name: 'OrderRecord', component: OrderRecord },
      { path: 'users/userlist', name: 'UserList', component: UserList },
      { path: 'users/userrole', name: 'UserRole', component: UserRole },
      { path: 'users/useredit/:id', name: 'UserEdit', component: UserEdit, props: true },
      { path: 'users/useradd', name: 'UserAdd', component: UserAdd },
      { path: 'personal', name: 'Personal', component: Personal }
    ]
  },
  
  // 捕获所有未知路径并重定向到404页面
  { path: '/:catchAll(.*)', redirect: '/notfoundpage' }
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
});

// 添加全局路由守卫
router.beforeEach((to, from, next) => {
  const token = localStorage.getItem('token');
  
  if (!token && to.path !== '/login' && to.path !== '/register' && to.path !== '/notfoundpage') {
    // 如果没有令牌并且不是去登录、注册和404页面，则跳转到登录页面
    next('/login');
  } else {
    // 否则放行
    next();
  }
});

export default router;
