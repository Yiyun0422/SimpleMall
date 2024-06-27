package com.simplemall.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.simplemall.mapper.OrderMapper;
import com.simplemall.pojo.Order;
import com.simplemall.pojo.PageBean;
import com.simplemall.pojo.User;
import com.simplemall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class OrderServiceA implements OrderService {

    @Autowired
    OrderMapper orderMapper;
    public PageBean orderListPage(Integer page, Integer pageSize, String uId){
        PageHelper.startPage(page,pageSize);
        List<Order> orders = orderMapper.orderListPage(uId);
        Page<Order> p=(Page<Order>)orders;
        //封装pageBean对象
        PageBean pageBean=new PageBean(p.getTotal(),p.getResult());
        return pageBean;
    }

    public Order selectById(Integer id){
        return orderMapper.selectById(id);
    }

    public void send(Order order){
        order.setOperateTime(LocalDateTime.now());
        orderMapper.send(order);
    }

    public void cancel(Order order){
        order.setOperateTime(LocalDateTime.now());
        orderMapper.cancel(order);
    }
}
