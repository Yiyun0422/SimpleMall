package com.simplemall.service;

import com.simplemall.pojo.PageBean;
import com.simplemall.pojo.User;

import java.util.List;

public interface UserService {
    PageBean userListPage(Integer page, Integer pageSize, String uName, Integer uRole);

    void delete(Integer id);

    void insert(User user);

    User selectById(Integer id);

    void update(User user);


/*    User login(User user);*/

}
