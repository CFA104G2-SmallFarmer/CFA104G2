package com.testEncoding.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebFilter("/*")  // 過濾所有的請求資源路徑
public class EncodingFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        // 處理POST請求亂碼問題
        request.setCharacterEncoding("UTF-8");

        // 放行
        chain.doFilter(request, response);

    }

    public void destroy() {
    }
}
