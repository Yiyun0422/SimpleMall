package com.simplemall.service;

import com.simplemall.pojo.User;

public interface PersonalService {
    User findUserById(String userId);
    void updateUser(User user);
}
