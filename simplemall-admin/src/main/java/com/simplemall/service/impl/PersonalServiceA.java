package com.simplemall.service.impl;

import com.simplemall.mapper.PersonalMapper;
import com.simplemall.pojo.User;
import com.simplemall.service.PersonalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonalServiceA implements PersonalService {

    @Autowired
    private PersonalMapper personalMapper;

    @Override
    public User findUserById(String userId) {
        return personalMapper.selectById(userId);
    }

    @Override
    public void updateUser(User user) {
        personalMapper.updateUser(user);
    }
}
