package com.simplemall;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@SpringBootTest
class SimpleMallApplicationTests {

    @Test
    void contextLoads() {
    }

/*    @Test
    public void testGenJwt(){

        Map<String, Object> claims = new HashMap<>();
        claims.put("id",1);
        claims.put("name","tom");

        String jwt = Jwts.builder()
                .signWith(SignatureAlgorithm.HS256,"simplemall") // 签名算法
                .setClaims(claims)
                .setExpiration(new Date(System.currentTimeMillis() + 3600*1000))
                .compact();
        System.out.println(jwt);
    }


    @Test
    public void testParaJwt(){
        Claims claims = Jwts.parser()
                .setSigningKey("simplemall")
                .parseClaimsJws("eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoidG9tIiwiaWQiOjEsImV4cCI6MTcxNzI2Njg2NH0.hlX0DC2m9yZ0MKWsWBKgVjiIeVQ7-H96DxulvY5vqeo")
                .getBody();
        System.out.println(claims);
    }*/

}
