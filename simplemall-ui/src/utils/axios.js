// src/utils/axios.js
import axios from 'axios';

const service = axios.create({
  // baseURL: import.meta.env.VITE_BASE_API, // 使用环境变量
  // 所有请求的基本 URL
  baseURL:'http://localhost/api',
  timeout: 5000 // 请求超时时间
});

// 请求拦截器
service.interceptors.request.use(
  config => {
    // 在请求发送之前做一些处理
    return config;
  },
  error => {
    // 处理请求错误
    return Promise.reject(error);
  }
);

// 响应拦截器，清除多余部分
// 这里的service封装的就是响应结果里面的data值{code,msg,data{total，rows{}}}
service.interceptors.response.use(
  // XMLHttpRequest 对象，如 data, status, statusText, headers 等
  response => {
    const res = response.data;
    // 根据返回的code值来做不同的处理
    return res;
  },
  error => {
    // 处理响应错误
    return Promise.reject(error);
  }
);

// service结果为清洗干净的data值，即{code,msg,data{total，rows{}}}
export default service;