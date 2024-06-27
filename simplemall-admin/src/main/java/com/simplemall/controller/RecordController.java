package com.simplemall.controller;

import com.simplemall.pojo.PageBean;
import com.simplemall.pojo.Result;
import com.simplemall.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RecordController {
    @Autowired
    RecordService recordService;

    /**
     * 分页查询所有订单记录数据
     * */
    @GetMapping("/order/record")
    public Result recordListPage(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer pageSize,
                                String uId, Integer finish){
        PageBean pageBean = recordService.recordListPage(page,pageSize,uId,finish);
        return Result.success(pageBean);
    }
}
