import { createRouter, createWebHistory } from 'vue-router';
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
  {
    path: '/',
    children: [
      { path: '', redirect: '/firstpage' },
      { path: 'firstpage', name: 'FirstPage', component: FirstPage },
      { path: 'products/productlist', name: 'ProductList', component: ProductList },
      { path: 'products/productcategory', name: 'ProductCategory', component: ProductCategory },
      { path: 'products/productadd', name: 'ProductAdd', component: ProductAdd },
      { path: 'order/orderlist', name: 'OrderList', component: OrderList },
      { path: 'order/orderrecord', name: 'OrderRecord', component: OrderRecord },
      { path: 'users/userlist', name: 'UserList', component: UserList },
      { path: 'users/userrole', name: 'UserRole', component: UserRole },
      { path: 'products/productedit/:id', name: 'ProductEdit', component: ProductEdit, props: true },
      { path: 'users/useredit/:id', name: 'UserEdit', component: UserEdit, props: true },
      { path: 'users/useradd', name: 'UserAdd', component: UserAdd },
      {path: 'personal', name: 'Personal', component: Personal }
    ]
  },
  { path: '/register', name: 'Register', component: Register },
  { path: '/notfoundpage', name: '404Page', component: NotFoundPage },
  { path: '/:catchAll(.*)', redirect: '/notfoundpage' } // 捕获所有未知路径并重定向到404页面
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
});

export default router;
