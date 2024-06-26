package com.simplemall.controller;

import com.simplemall.pojo.Result;
import com.simplemall.pojo.User;
import com.simplemall.service.UserService;
import com.simplemall.utils.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class LoginController {
    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public Result login(@RequestBody User user){
        User user1 = userService.login(user);
        if(user1 != null){
            Map<String,Object> claims = new HashMap<>();
            claims.put("userId",user.getUserId());
            claims.put("uId",user1.getUId());
            claims.put("uName",user1.getUName());

            String jwt = JwtUtils.generateJwt(claims);
            return Result.success(jwt);
        }else{
            return  Result.error("用户名或账号错误");
        }
    }
}
