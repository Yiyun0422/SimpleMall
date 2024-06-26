package com.simplemall.interception;

import com.alibaba.fastjson.JSONObject;
import com.simplemall.pojo.Result;
import com.simplemall.utils.JwtUtils;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Slf4j
@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
        log.info("preHandle ...");

        String url = req.getRequestURL().toString();
        log.info("请求的url:{}", url);

        if (url.contains("login")) {
            log.info("登录操作，放行...");
            return true;
        }

        String jwt = req.getHeader("Authorization");
        log.info("请求头中的token: {}", jwt);

        if (!StringUtils.hasLength(jwt)) {
            log.info("请求头token为空，返回未登录信息");
            Result error = Result.error("NOT_LOGIN");
            String notLogin = JSONObject.toJSONString(error);
            resp.getWriter().write(notLogin);
            return false;
        }

        try {
            Claims claims = JwtUtils.parseJWT(jwt.replace("Bearer ", ""));
            log.info("令牌解析成功，用户信息: {}", claims);
        } catch (Exception e) {
            e.printStackTrace();
            log.info("解析令牌失败，返回未登录信息");
            Result error = Result.error("NOT_LOGIN");
            String notLogin = JSONObject.toJSONString(error);
            resp.getWriter().write(notLogin);
            return false;
        }

        log.info("令牌合法，放行");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        log.info("postHandle ...");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        log.info("afterCompletion ...");
    }
}
