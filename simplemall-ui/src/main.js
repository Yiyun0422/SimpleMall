// src/main.js
import { createApp } from 'vue';
import App from './App.vue';
import router from './router/index.js';
import axios from './utils/axios.js';
import ElementPlus from 'element-plus';
import 'element-plus/dist/index.css';
import './styles/global.scss'; // 引入全局样式

const app = createApp(App);

// 将 axios 添加到全局属性中
app.config.globalProperties.$axios = axios;

app.use(router).use(ElementPlus).mount('#app');
