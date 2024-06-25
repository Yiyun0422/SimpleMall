package com.simplemall.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.simplemall.mapper.UserMapper;
import com.simplemall.pojo.PageBean;
import com.simplemall.pojo.Product;
import com.simplemall.pojo.User;
import com.simplemall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Locale;

@Service
public class UserServiceA implements UserService {
    @Autowired
    UserMapper userMapper;

    public PageBean userListPage(Integer page,Integer pageSize, String uName, Integer uRole){
        PageHelper.startPage(page,pageSize);
        List<User> users = userMapper.userListPage(uName, uRole);
        Page<User> p=(Page<User>)users;
        //封装pageBean对象
        PageBean pageBean=new PageBean(p.getTotal(),p.getResult());
        return pageBean;
    }

    public void delete(Integer id){
        userMapper.delete(id);
    }

    public void insert(User user){
        user.setUCreateTime(LocalDateTime.now());
        user.setUUpdateTime(LocalDateTime.now());
        userMapper.insert(user);
    }

    public User selectById(Integer id){
        return userMapper.selectById(id);
    }

    public void update(User user){
        user.setUUpdateTime(LocalDateTime.now());
         userMapper.update(user);
    }


/*    public User login(User user){
        return userMapper.checkUserExist(user);
    }*/
}
