package com.simplemall.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.simplemall.mapper.RecordMapper;
import com.simplemall.pojo.Order;
import com.simplemall.pojo.PageBean;
import com.simplemall.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecordServiceA implements RecordService {
    @Autowired
    RecordMapper recordMapper;
    public PageBean recordListPage(Integer page, Integer pageSize, String uId, Integer finish){
        PageHelper.startPage(page,pageSize);
        List<Order> orders = recordMapper.recordListPage(uId,finish);
        Page<Order> p=(Page<Order>)orders;
        //封装pageBean对象
        PageBean pageBean=new PageBean(p.getTotal(),p.getResult());
        return pageBean;
    }
}
