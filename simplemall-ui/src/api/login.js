// src/api/login.js
import service from '../utils/axios';

export async function login(params) {
  try {
    const response = await service.post('/login', params);
    if (response.code !== 1) {
      throw new Error(response.msg || 'Failed to login');
    }
    return response;
  } catch (error) {
    console.error('Login API error:', error); // 添加错误日志
    throw new Error(error.message || 'Network Error');
  }
}
