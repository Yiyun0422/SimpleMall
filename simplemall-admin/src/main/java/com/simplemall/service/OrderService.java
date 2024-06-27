package com.simplemall.service;

import com.simplemall.pojo.Order;
import com.simplemall.pojo.PageBean;

public interface OrderService {
    PageBean orderListPage(Integer page, Integer pageSize, String uId);

    Order selectById(Integer id);

    void send(Order order);

    void cancel(Order order);
}
