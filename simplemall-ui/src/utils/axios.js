// src/utils/axios.js
import axios from 'axios';

const service = axios.create({
  baseURL: 'http://localhost/api', // 所有请求的基本 URL
  timeout: 5000, // 请求超时时间
});

// 请求拦截器
service.interceptors.request.use(
  config => {
    const token = localStorage.getItem('token');
    if (token) {
      config.headers['Authorization'] = token; // 使用 token 头部
    }
    return config;
  },
  error => Promise.reject(error)
);

// 响应拦截器
service.interceptors.response.use(
  response => response.data, // 直接返回 response.data
  error => Promise.reject(error)
);

export default service;
