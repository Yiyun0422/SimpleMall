package com.simplemall.controller;

import com.simplemall.pojo.Result;
import com.simplemall.pojo.Role;
import com.simplemall.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class RoleController {
    @Autowired
    RoleService roleService;

    /**
     * 查询所有职能
     * */
    @GetMapping("/roles")
    public Result roleList(){
        List<Role> roles = roleService.roleList();
        return Result.success(roles);
    }

    /**
     * 根据id删除
     * */
    @DeleteMapping("/role/delete/{id}")
    public Result delete(@PathVariable Integer id){
        roleService.delete(id);
        return Result.success();
    }

    /**
     * 增加职能
     * */
    @PostMapping("/role/insert")
    public Result insert(@RequestBody Role role){
        roleService.insert(role);
        return Result.success();
    }

    /**
     * 修改职能
     */
    @GetMapping("/role/select/{id}")
    public Result selectById(@PathVariable Integer id){
        Role role = roleService.selectById(id);
        return Result.success(role);
    }
    @PutMapping("/role/update")
    public Result update(@RequestBody Role role){
        roleService.update(role);
        return Result.success();
    }

}
