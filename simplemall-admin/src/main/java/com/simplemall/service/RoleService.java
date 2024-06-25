package com.simplemall.service;

import com.simplemall.pojo.Role;

import java.util.List;

public interface RoleService {
    List<Role> roleList();

    void delete(Integer id);

    void insert(Role role);

    Role selectById(Integer id);

    void update(Role role);
}
