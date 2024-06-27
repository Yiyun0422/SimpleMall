package com.simplemall.controller;

import com.simplemall.pojo.Order;
import com.simplemall.pojo.PageBean;
import com.simplemall.pojo.Result;
import com.simplemall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class OrderController {
    @Autowired
    OrderService orderService;

    /**
     * 分页查询所有订单数据
     * */
    @GetMapping("/order")
    public Result orderListPage(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer pageSize,
                               String uId){
        PageBean pageBean = orderService.orderListPage(page,pageSize,uId);
        return Result.success(pageBean);
    }


    @GetMapping("/order/select/{id}")
    public Result selectById(@PathVariable Integer id){
        Order order = orderService.selectById(id);
        return Result.success(order);
    }

    /**
     * 发货
     * */
    @PutMapping("/order/send")
    public Result send(@RequestBody Order order){
        orderService.send(order);
        return Result.success();
    }

    /**
     * 取消订单
     * */
    @PutMapping("/order/cancel")
    public Result cancel(@RequestBody Order order){
        orderService.cancel(order);
        return Result.success();
    }
}
