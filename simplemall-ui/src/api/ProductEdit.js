import service from '../utils/axios';

export async function editproduct(params) {
  try {
    // {params}将params作为一个属性封装在数组中，params是直接传递一个对象
    const response = await service.put('/product/update', params);
    if (response.code !== 1) {
      throw new Error(response.msg || 'Failed to update products');
    }
    return response;
  } catch (error) {
    throw new Error('Network Error');
  }
}


// 根据id获取商品信息
export async function searchProductById(id){
  try {
      const response = await service.get(`/product/select/${id}`);
      if (response.code !== 1) {
        throw new Error(response.msg || 'Failed to search products');
      }
      return response;
    } catch (error) {
      throw new Error('Network Error');
    }
}