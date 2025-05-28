package com.ruoyi.common.security.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
// 添加以下两个导入
import com.ruoyi.common.security.interceptor.HeaderInterceptor;
import org.springframework.context.annotation.Lazy; // 如果使用@Lazy才需要

@Configuration
// @Lazy  // 暂时注释掉（先解决基础编译问题）
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(headerInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(SecurityConfig.PERMIT_URLS)
                .order(-10);
    }

    @Bean
    public HeaderInterceptor headerInterceptor() {
        return new HeaderInterceptor();
    }
}