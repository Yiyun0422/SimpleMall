import service from '../utils/axios';

// 获取订单数据的接口方法
export async function searchOrders(params) {
  try {
    const response = await service.get('/order', { params });
    if (response.code !== 1) {
      throw new Error(response.msg || 'Failed to fetch order information');
    }
    return response;
  } catch (error) {
    throw new Error('Network Error');
  }
}

// 发货操作
export async function sendOrder(params) {
  try {
    const response = await service.put('/order/send', params);
    if (response.code !== 1) {
      throw new Error(response.msg || 'Failed to send order');
    }
    return response;
  } catch (error) {
    throw new Error('Network Error');
  }
}

// 取消订单
export async function cancelOrder(params) {
  try {
    const response = await service.put('/order/cancel', params);
    if (response.code !== 1) {
      throw new Error(response.msg || 'Failed to cancel order');
    }
    return response;
  } catch (error) {
    throw new Error('Network Error');
  }
}
