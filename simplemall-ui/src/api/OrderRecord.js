import service from '../utils/axios';

// 获取商品数据的接口方法，接受一个由页面传来的数组params
export  async function searchOrders (params) {
  try {
    // 这里使用service调用数据，已经在axios文件中封装好了，数据类型为干净的{code,msg,data{total,rows{}}}
    const response = await service.get('/order/record', { params });
    if (response.code !== 1) {
      throw new Error(response.msg || 'Failed to fetch order information');
    }
    // 返回干净的JSON数据
    return response;
  } catch (error) {
    throw new Error('Network Error');
  }
}
