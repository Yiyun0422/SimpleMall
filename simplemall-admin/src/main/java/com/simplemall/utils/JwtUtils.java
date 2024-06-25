package com.simplemall.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;
import java.util.Map;

public class JwtUtils {

    // 定义签名密钥
    private static String signKey = "comsimplemall";
    // 定义令牌过期时间
    private static Long expire = 43200000L;

    /**
     * 生成JWT令牌
     * @param claims JWT第二部分负载 payload 中存储的内容
     * @return 返回生成的JWT令牌
     */
    public static String generateJwt(Map<String, Object> claims){
        // 创建JWT令牌
        String jwt = Jwts.builder()
                // 添加负载
                .addClaims(claims)
                // 使用HS256算法和签名密钥进行签名
                .signWith(SignatureAlgorithm.HS256, signKey)
                // 设置令牌过期时间
                .setExpiration(new Date(System.currentTimeMillis() + expire))
                // 构建JWT令牌
                .compact();
        // 返回生成的JWT令牌
        return jwt;
    }

    /**
     * 解析JWT令牌
     * @param jwt JWT令牌
     * @return 返回JWT第二部分负载 payload 中存储的内容
     */
    public static Claims parseJWT(String jwt){
        // 解析JWT令牌
        Claims claims = Jwts.parser()
                // 设置签名密钥
                .setSigningKey(signKey)
                // 解析JWT令牌
                .parseClaimsJws(jwt)
                // 获取负载内容
                .getBody();
        // 返回负载内容
        return claims;
    }
}
