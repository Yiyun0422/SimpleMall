package com.simplemall.mapper;

import com.simplemall.pojo.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface RecordMapper {
    List<Order> recordListPage(String uId, Integer finish);
}
