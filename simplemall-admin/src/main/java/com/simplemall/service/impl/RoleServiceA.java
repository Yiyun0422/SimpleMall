package com.simplemall.service.impl;

import com.simplemall.mapper.RoleMapper;
import com.simplemall.pojo.Role;
import com.simplemall.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class RoleServiceA implements RoleService {
    @Autowired
    RoleMapper roleMapper;

    public List<Role> roleList(){
        return roleMapper.roleList();
    }

    public void delete(Integer id){
        roleMapper.delete(id);
    }

    public  void insert(Role role){
        role.setRCreateTime(LocalDateTime.now());
        role.setRUpdateTime(LocalDateTime.now());
        roleMapper.insert(role);
    }

    public Role selectById(Integer id){
        return roleMapper.selectById(id);
    }

    public void update(Role role){
        role.setRUpdateTime(LocalDateTime.now());
        roleMapper.update(role);
    }
}
