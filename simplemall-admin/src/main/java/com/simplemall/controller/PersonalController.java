package com.simplemall.controller;

import com.simplemall.pojo.User;
import com.simplemall.service.PersonalService;
import com.simplemall.utils.JwtUtils;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/personal")
public class PersonalController {

    @Autowired
    private PersonalService personalService;

    @GetMapping("/userinfo")
    public User getUserInfo(@RequestHeader("Authorization") String authorizationHeader) {
        // 获取 token
        String token = authorizationHeader.replace("Bearer ", "");
        // 解析 token
        Claims claims = JwtUtils.parseJWT(token);
        // 获取用户 ID 或用户名（根据你的 JWT 负载内容）
        String userId = (String) claims.get("uId");

        // 根据用户 ID 或用户名获取用户信息
        User user = personalService.findUserById(userId);

        return user;
    }

    @PostMapping("/updateuserinfo")
    public String updateUserInfo(@RequestHeader("Authorization") String authorizationHeader, @RequestBody User user) {
        // 获取 token
        String token = authorizationHeader.replace("Bearer ", "");
        // 解析 token
        Claims claims = JwtUtils.parseJWT(token);
        // 获取用户 ID 或用户名（根据你的 JWT 负载内容）
        String userId = (String) claims.get("uId");

        // 设置用户ID
        user.setUId(userId);
        // 更新用户信息
        personalService.updateUser(user);

        return "用户信息更新成功";
    }
}
