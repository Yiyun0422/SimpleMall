package com.simplemall.mapper;

import com.simplemall.pojo.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface OrderMapper {
    List<Order> orderListPage(String uId);

    @Select("select * from `order` where order_id = #{id}")
    Order selectById(Integer id);

    @Update("UPDATE `order` SET status = 1, finish = 1, operate_time = #{operateTime} WHERE order_id = #{orderId}")
    void send(Order order);

    @Update("UPDATE `order` o " +
            "JOIN product p ON o.product_id = p.product_id " +
            "SET o.status = 1, o.finish = 0, p.p_number = p.p_number + 1, o.operate_time = #{operateTime} " +
            "WHERE o.order_id = #{orderId}")
    void cancel(Order order);
}
