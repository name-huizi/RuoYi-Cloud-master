package com.ruoyi.auth.exception;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import com.ruoyi.common.core.domain.R;

@RestControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(Exception.class)
    public R handleException(Exception e) {
        e.printStackTrace(); // 强制打印错误堆栈
        return R.error("内部服务器错误，详情：" + e.getMessage());
    }
}