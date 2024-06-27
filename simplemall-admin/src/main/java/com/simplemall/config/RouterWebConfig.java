package com.simplemall.config;

import com.simplemall.interception.LoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 配置拦截器，进行动态拦截操作
 */
@Configuration
public class RouterWebConfig implements WebMvcConfigurer {
    @Autowired
    private LoginInterceptor loginInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 只对需要认证的路径进行拦截
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns(
                        "/user/**",
                        "/users",
                        "/role/**",
                        "/roles",
                        "/product/**",
                        "/products/**",
                        "/category/**",
                        "/categories",
                        "/firstpage",
                        "/order/**",
                        "/personal") // 需要登录认证的路径
                .excludePathPatterns("/login", "/register", "/notfoundpage", "/user/insert"); // 不需要登录认证的路径
    }
}
