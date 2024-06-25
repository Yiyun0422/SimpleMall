import service from '../utils/axios';

export async function addProduct(params) {
  try {
    // {params}将params作为一个属性封装在数组中，params是直接传递一个对象
    const response = await service.post('/product/insert', params);
    if (response.code !== 1) {
      throw new Error(response.msg || 'Failed to add products');
    }
    return response;
  } catch (error) {
    throw new Error('Network Error');
  }
}