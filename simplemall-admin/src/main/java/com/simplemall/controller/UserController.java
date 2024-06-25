package com.simplemall.controller;

import com.simplemall.pojo.PageBean;
import com.simplemall.pojo.Result;
import com.simplemall.pojo.User;
import com.simplemall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class UserController {
    @Autowired
    UserService userService;

    /**
     * 分页查询所有用户数据
     * */
    @GetMapping("/users")
    public Result userListPage(@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer pageSize,
                               String uName, Integer uRole){
        PageBean pageBean = userService.userListPage(page,pageSize,uName,uRole);
        return Result.success(pageBean);
    }

    /**
     * 删除用户数据
     * */
    @DeleteMapping("/user/delete/{id}")
    public Result delete(@PathVariable Integer id){
        userService.delete(id);
        return Result.success();
    }


    /**
     * 新增用户数据
     * */
    @PostMapping("/user/insert")
    public Result insert(@RequestBody User user){
        userService.insert(user);
        return Result.success();
    }

    /**
     * 修改用户数据
     * */
    @GetMapping("/user/select/{id}")
    public Result selectById(@PathVariable Integer id){
        User user = userService.selectById(id);
        return Result.success(user);
    }
    @PutMapping("/user/update")
    public Result update(@RequestBody User user){
        userService.update(user);
        return Result.success(user);
    }
}
