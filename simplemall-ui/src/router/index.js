import { createRouter, createWebHistory } from 'vue-router';
import FirstPage from '../views/FirstPage.vue';
import ProductList from '../views/products/ProductList.vue';
import ProductCategory from '../views/products/ProductCategory.vue';
import ProductAdd from '../views/products/ProductAdd.vue';
import UserList from '../views/users/UserList.vue';
import UserRole from '../views/users/UserRole.vue';
import ProductEdit from '../views/products/ProductEdit.vue';
import UserEdit from '../views/users/UserEdit.vue';
import UserAdd from '../views/users/UserAdd.vue';
import Login from '../views/Login.vue';
import Register from '../views/Register.vue';
import NotFoundPage from '../views/404page.vue';

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
      { path: 'users/userlist', name: 'UserList', component: UserList },
      { path: 'users/userrole', name: 'UserRole', component: UserRole },
      { path: 'products/productedit/:id', name: 'ProductEdit', component: ProductEdit, props: true },
      { path: 'users/useredit/:id', name: 'UserEdit', component: UserEdit, props: true },
      { path: 'users/useradd', name: 'UserAdd', component: UserAdd }
    ]
  },
  { path: '/register', name: 'Reginster', component: Register },
  {path:'/notfoundpage',name:'404Page',component:NotFoundPage},
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
});

export default router;
