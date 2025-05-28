package com.ruoyi.common.security.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    // 精确放行所有无需认证的路径
    public static final String[] PERMIT_URLS = {
            "/ruoyi-auth/login",
            "/ruoyi-auth/captchaImage",
            "/ruoyi-auth/actuator/**",     // 放行所有 Actuator 端点
            "/**/*.css", "/**/*.js"        // 静态资源
    };

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .cors().and()
                .csrf().disable()
                .authorizeRequests()
                .antMatchers(HttpMethod.OPTIONS).permitAll()
                .antMatchers(PERMIT_URLS).permitAll()  // 放行白名单
                .anyRequest().authenticated()
                .and()
                .httpBasic().disable()   // 禁用 Basic 认证
                .formLogin().disable()    // 禁用表单登录
                .logout().disable();      // 禁用默认注销

        return http.build();
    }
}